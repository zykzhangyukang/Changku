package com.coderman.changku.sys.service;

import com.coderman.changku.sys.modal.Permission;

import java.util.List;

public interface PermissionService {
    /**
     * 获取所有的可用菜单
     * @return
     */
    List<Permission> findMenu();
}
