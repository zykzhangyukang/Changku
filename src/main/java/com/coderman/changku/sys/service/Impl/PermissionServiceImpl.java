package com.coderman.changku.sys.service.Impl;

import com.coderman.changku.sys.commons.Constast;
import com.coderman.changku.sys.commons.Page;
import com.coderman.changku.sys.mapper.PermissionMapper;
import com.coderman.changku.sys.mapper.RolePermissionMapper;
import com.coderman.changku.sys.modal.Permission;
import com.coderman.changku.sys.modal.PermissionExample;
import com.coderman.changku.sys.modal.RolePermissionExample;
import com.coderman.changku.sys.modal.RolePermissionKey;
import com.coderman.changku.sys.service.PermissionService;
import com.coderman.changku.sys.vo.PermissionVo;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class PermissionServiceImpl implements PermissionService {
    @Autowired
    private PermissionMapper permissionMapper;

    @Autowired
    private RolePermissionMapper rolePermissionMapper;

    @Override
    public List<Permission> findMenu() {
        PermissionExample example = new PermissionExample();
        example.createCriteria().andTypeEqualTo(Constast.MENU_TYPE).andAvailableEqualTo(Constast.AVAILABLE_TRUE);
        return permissionMapper.selectByExample(example);
    }

    @Override
    public List<Permission> listAllMenu() {
        PermissionExample permissionExample = new PermissionExample();
        permissionExample.createCriteria().andTypeEqualTo(Constast.MENU_TYPE);
        return permissionMapper.selectByExample(permissionExample);
    }

    @Override
    public Page<Permission> findMenuPage(PermissionVo permissionVo, Integer pageNo, int pageSize) {
        PageHelper.startPage(pageNo,pageSize);
        PermissionExample permissionExample = createExample(permissionVo,Constast.MENU_TYPE);
        List<Permission> permissions = permissionMapper.selectByExample(permissionExample);
        com.github.pagehelper.Page<Permission> permissionPage= (com.github.pagehelper.Page<Permission>) permissions;
        return new Page<>(permissionPage.getTotal(),permissionPage.getResult());
    }

    @Override
    public void update(Permission permission) {
        permissionMapper.updateByPrimaryKeySelective(permission);
    }

    @Override
    public void delete(Integer id) {permissionMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void save(Permission permission) {
        permissionMapper.insertSelective(permission);
    }

    @Override
    public List<Permission> listAllPermission() {
        PermissionExample permissionExample = new PermissionExample();
        permissionExample.createCriteria().andTypeEqualTo(Constast.MENU_TYPE);
        return permissionMapper.selectByExample(permissionExample);
    }

    @Override
    public Page<Permission> findPermissionPage(PermissionVo permissionVo, Integer pageNo, int pageSize) {
        PageHelper.startPage(pageNo,pageSize);
        PermissionExample permissionExample = createExample(permissionVo,Constast.PERMISSION_TYPE);
        List<Permission> permissions = permissionMapper.selectByExample(permissionExample);
        com.github.pagehelper.Page<Permission> permissionPage= (com.github.pagehelper.Page<Permission>) permissions;
        return new Page<>(permissionPage.getTotal(),permissionPage.getResult());
    }

    @Override
    public List<Permission> findMenuByRids(List<Integer> currentUserRoleIds) {
        RolePermissionExample example = new RolePermissionExample();
        example.createCriteria().andRidIn(currentUserRoleIds);
        List<RolePermissionKey> rolePermissionKeyList = rolePermissionMapper.selectByExample(example);
        Set<Integer> set=null;
        if(rolePermissionKeyList.size()>0){
          set=new HashSet<>();
            for (RolePermissionKey rolePermissionKey : rolePermissionKeyList) {
                Integer pid = rolePermissionKey.getPid();
                set.add(pid);
            }
        }
        PermissionExample example1 = new PermissionExample();
        example1.createCriteria().andTypeEqualTo(Constast.MENU_TYPE).andIdIn(new ArrayList<>(set));
        List<Permission> permissions = permissionMapper.selectByExample(example1);
        return permissions;
    }

    /**
     * 封装公共的查询对象
     * @param permissionVo
     * @param type
     * @return
     */
    private PermissionExample createExample(PermissionVo permissionVo,String type) {
        PermissionExample permissionExample = new PermissionExample();
        PermissionExample.Criteria criteria = permissionExample.createCriteria();
        criteria.andTypeEqualTo(type);
        PermissionExample.Criteria criteria2 = permissionExample.createCriteria();
        if(permissionVo!=null){
            if(permissionVo.getTitle()!=null&&!"".equals(permissionVo.getTitle())){
                criteria.andTitleLike("%"+permissionVo.getTitle()+"%");
            }
            if(permissionVo.getHref()!=null&&!"".equals(permissionVo.getHref())){
                criteria.andHrefLike("%"+permissionVo.getHref()+"%");
            }
            if(permissionVo.getPercode()!=null&&!"".equals(permissionVo.getPercode())){
                criteria.andPercodeLike("%"+permissionVo.getPercode()+"%");
            }
            if(permissionVo.getId()!=null&&!"".equals(permissionVo.getId())){
                criteria.andIdEqualTo(permissionVo.getId());
                criteria2.andPidEqualTo(permissionVo.getId()).andTypeEqualTo(type);
            }
            permissionExample.or(criteria2);
        }
        return permissionExample;
    }
}
