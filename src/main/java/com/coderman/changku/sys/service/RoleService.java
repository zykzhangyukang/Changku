package com.coderman.changku.sys.service;

import com.coderman.changku.sys.commons.Page;
import com.coderman.changku.sys.commons.TreeNode;
import com.coderman.changku.sys.modal.Role;
import com.coderman.changku.sys.vo.RoleVo;

import java.util.List;
import java.util.Map;

public interface RoleService {
    /**
     * 查询角色信息
     * @param roleVo
     * @param pageNo
     * @param pageSize
     * @return
     */
    Page<Role> findPage(RoleVo roleVo,int pageNo,int pageSize);

    /**
     * 更新 角色信息
     * @param role
     */
    public void update(Role role);

    /**
     * 删除角色信息
     * @param id
     */
    public void delete(Integer id);

    /**
     * 添加觉信息
     * @param role
     */
    void save(Role role);

    /**
     * 返回角色可以的权限树Json
     * @param roleId
     * @return
     */
    List<TreeNode> loadPermissionByRoleId(Integer roleId);

    /**
     * 给用户分配权限
     * @param roleMap
     */
    void saveRolePermission(Map<String, Object> roleMap);

    /**
     * 清除用户的权限
     * @param roleId
     */
    void cleanRolePermission(Integer roleId);

    /**
     * 根据用户ID获取用户角色
     * @param id
     * @return
     */
    List<Integer> findRoleIdsByUserId(Integer id);

    /**
     * 根据角色集合返回角色的名称
     * @param currentUserRoleIds
     * @return
     */
    List<String> findNameByIds(List<Integer> currentUserRoleIds);
}
