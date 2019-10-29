package com.coderman.changku.sys.service.Impl;

import com.coderman.changku.sys.commons.Constast;
import com.coderman.changku.sys.commons.Page;
import com.coderman.changku.sys.commons.TreeNode;
import com.coderman.changku.sys.mapper.PermissionMapper;
import com.coderman.changku.sys.mapper.RoleMapper;
import com.coderman.changku.sys.mapper.RolePermissionMapper;
import com.coderman.changku.sys.mapper.RoleUserMapper;
import com.coderman.changku.sys.modal.*;
import com.coderman.changku.sys.service.RoleService;
import com.coderman.changku.sys.vo.RoleVo;
import com.github.pagehelper.PageHelper;
import com.sun.org.apache.regexp.internal.RE;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import sun.reflect.generics.tree.Tree;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleMapper roleMapper;

    @Autowired
    private RolePermissionMapper rolePermissionMapper;


    @Autowired
    private PermissionMapper permissionMapper;

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

    @Transactional
    @Override
    public List<TreeNode> loadPermissionByRoleId(Integer roleId) {
        //查询所有可用的权限
        PermissionExample example = new PermissionExample();
        example.createCriteria().andAvailableEqualTo(Constast.AVAILABLE_TRUE);
        List<Permission> allAvaiablePermission = permissionMapper.selectByExample(example);
        //查询该角色拥有的权限
        RolePermissionExample example1 = new RolePermissionExample();
        example1.createCriteria().andRidEqualTo(roleId);
        List<RolePermissionKey> rolePermissions = rolePermissionMapper.selectByExample(example1);
        //封装返回对象
        List<TreeNode> treeNodes=new ArrayList<>();
            for (Permission permission : allAvaiablePermission) {
                String checkArr="0";
                for (RolePermissionKey rolePermission : rolePermissions) {
                    if(rolePermission.getPid()==permission.getId()){
                        checkArr="1";
                        break;
                    }
                }
                Boolean spread=permission.getOpen()==Constast.OPEN_TRUE? true:false;
               treeNodes.add(new TreeNode(permission.getId(), permission.getTitle(),  spread, permission.getPid(), checkArr));
            }
        return treeNodes;
    }

    @Transactional
    @Override
    public void saveRolePermission(Map<String, Object> roleMap) {
        if(roleMap.get("roleId")!=null&&roleMap.get("pids")!=null){
            cleanRolePermission((Integer) roleMap.get("roleId"));
            List<Integer> pids= (List<Integer>) roleMap.get("pids");
            for (Integer pid : pids) {
                RolePermissionKey rolePermissionKey = new RolePermissionKey();
                rolePermissionKey.setRid((Integer) roleMap.get("roleId"));
                rolePermissionKey.setPid(pid);
                rolePermissionMapper.insertSelective(rolePermissionKey);
            }
        }
    }

    @Transactional
    @Override
    public void cleanRolePermission(Integer roleId) {
        RolePermissionExample example = new RolePermissionExample();
        example.createCriteria().andRidEqualTo(roleId);
        rolePermissionMapper.deleteByExample(example);
    }

    @Override
    public List<Integer> findRoleIdsByUserId(Integer id) {
        RoleUserExample example = new RoleUserExample();
        example.createCriteria().andUidEqualTo(id);
        List<RoleUserKey> roleUserKeys = roleUserMapper.selectByExample(example);
        if(roleUserKeys.size()>0){
            List<Integer> rids=new ArrayList<>();
            for (RoleUserKey roleUserKey : roleUserKeys) {
                rids.add(roleUserKey.getRid());
            }
            return rids;
        }else {
            return new ArrayList<>();
        }
    }
}
