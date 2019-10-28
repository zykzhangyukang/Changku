package com.coderman.changku.sys.service.Impl;

import com.coderman.changku.sys.commons.Page;
import com.coderman.changku.sys.mapper.RoleMapper;
import com.coderman.changku.sys.mapper.RolePermissionMapper;
import com.coderman.changku.sys.mapper.RoleUserMapper;
import com.coderman.changku.sys.modal.Role;
import com.coderman.changku.sys.modal.RoleExample;
import com.coderman.changku.sys.modal.RolePermissionExample;
import com.coderman.changku.sys.modal.RoleUserExample;
import com.coderman.changku.sys.service.RoleService;
import com.coderman.changku.sys.vo.RoleVo;
import com.github.pagehelper.PageHelper;
import com.sun.org.apache.regexp.internal.RE;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleMapper roleMapper;

    @Autowired
    private RolePermissionMapper rolePermissionMapper;

    @Autowired
    private RoleUserMapper roleUserMapper;

    @Override
    public Page<Role> findPage(RoleVo roleVo, int pageNo, int pageSize) {
        PageHelper.startPage(pageNo,pageSize);
        RoleExample roleExample = createRoleExample(roleVo);
        List<Role> roles = roleMapper.selectByExample(roleExample);
        com.github.pagehelper.Page<Role> rolePage= (com.github.pagehelper.Page<Role>) roles;
        return new Page<>(rolePage.getTotal(),rolePage.getResult());
    }

    /**
     * 封装角色查询的对象
     * @param roleVo
     * @return
     */
    private RoleExample createRoleExample(RoleVo roleVo) {
        RoleExample roleExample = new RoleExample();
        RoleExample.Criteria criteria = roleExample.createCriteria();
        if(roleVo!=null){
            if(roleVo.getName()!=null&&!"".equals(roleVo.getName())){
                criteria.andNameLike("%"+roleVo.getName()+"%");
            }
            if(roleVo.getRemark()!=null&&!"".equals(roleVo.getRemark())){
                criteria.andRemarkLike("%"+roleVo.getRemark()+"%");
            }
            if(roleVo.getAvailable()!=null&&!"".equals(roleVo.getAvailable())){
                criteria.andAvailableEqualTo(roleVo.getAvailable());
            }
        }
        return roleExample;
    }

    @Override
    public void update(Role role) {
        roleMapper.updateByPrimaryKeySelective(role);
    }

    @Override
    public void delete(Integer id) {
        //删除中间表的数据
        //sys_role_permission;
        RolePermissionExample example = new RolePermissionExample();
        example.createCriteria().andRidEqualTo(id);
        rolePermissionMapper.deleteByExample(example);
        // sys_role_user
        RoleUserExample example1 = new RoleUserExample();
        example1.createCriteria().andRidEqualTo(id);
        roleUserMapper.deleteByExample(example1);

        roleMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void save(Role role) {
        roleMapper.insertSelective(role);
    }
}
