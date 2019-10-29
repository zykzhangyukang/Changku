package com.coderman.changku.sys.service;

import com.coderman.changku.sys.commons.Page;
import com.coderman.changku.sys.modal.Permission;
import com.coderman.changku.sys.vo.PermissionVo;

import java.util.List;

public interface PermissionService {
    /**
     * 获取所有的可用菜单
     * @return
     */
    List<Permission> findMenu();

    /**
     * 获取所有菜单信息
     * @return
     */
    List<Permission> listAllMenu();

    /**
     * 查询菜单信息
     * @param permissionVo
     * @param pageNo
     * @param pageSize
     * @return
     */
    Page<Permission> findMenuPage(PermissionVo permissionVo, Integer pageNo, int pageSize);

    /**
     * 更新
     * @param permission
     */
    void update(Permission permission);

    /**
     * 删除
     * @param id
     */
    void delete(Integer id);

    /**
     * 保存
     * @param permission
     */
    void save(Permission permission);

    /**
     * 显示所有权限信息
     * @return
     */
    List<Permission> listAllPermission();

    /**
     * 查询权限信息
     * @param permissionVo
     * @param pageNo
     * @param pageSize
     * @return
     */
    Page<Permission> findPermissionPage(PermissionVo permissionVo, Integer pageNo, int pageSize);

    /**
     * 获取用户的菜单根据角色
     * @param currentUserRoleIds
     * @return
     */
    List<Permission> findMenuByRids(List<Integer> currentUserRoleIds);
}
