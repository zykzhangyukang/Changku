package com.coderman.changku.sys.service.Impl;

import com.coderman.changku.sys.commons.Constast;
import com.coderman.changku.sys.mapper.PermissionMapper;
import com.coderman.changku.sys.modal.Permission;
import com.coderman.changku.sys.modal.PermissionExample;
import com.coderman.changku.sys.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PermissionServiceImpl implements PermissionService {
    @Autowired
    private PermissionMapper permissionMapper;

    @Override
    public List<Permission> findMenu() {
        PermissionExample example = new PermissionExample();
        example.createCriteria().andTypeEqualTo(Constast.MENU_TYPE).andAvailableEqualTo(Constast.AVAILABLE_TRUE);
        return permissionMapper.selectByExample(example);
    }
}
