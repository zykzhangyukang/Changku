package com.coderman.changku.sys.controller;

import com.coderman.changku.sys.commons.Constast;
import com.coderman.changku.sys.commons.Page;
import com.coderman.changku.sys.commons.Result;
import com.coderman.changku.sys.commons.TreeNode;
import com.coderman.changku.sys.entities.ResultObj;
import com.coderman.changku.sys.modal.Permission;
import com.coderman.changku.sys.service.PermissionService;
import com.coderman.changku.sys.vo.PermissionVo;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

/**
 * 权限管理
 */
@RestController
@RequestMapping("/permission")
public class PermissionController {
    @Autowired
    private PermissionService permissionService;

    /**
     * 加载左边权限树的json
     * @return
     */
    @PostMapping("/loadPermissionTree")
    public Result loadDeptTree() {
        List<Permission> permissions = permissionService.listAllPermission();
        List<TreeNode> treeNodes = new ArrayList<>();
        for (Permission permission : permissions) {
            Boolean spread = permission.getOpen() == Constast.OPEN_TRUE ? true : false;
            treeNodes.add(new TreeNode(permission.getId(), permission.getPid(), permission.getTitle(), spread));
        }
        return new Result(treeNodes);
    }
    /**
     * 添加权限信息
     * @param Permission
     * @return
     */
    @RequiresPermissions({"permission:add"})
    @PostMapping("/add")
    public ResultObj add(Permission Permission){
        try {
            Permission.setType(Constast.PERMISSION_TYPE);
            permissionService.save(Permission);
            return ResultObj.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_FAIL;
        }
    }
    /**
     * 更新权限信息
     * @param Permission
     * @return
     */
    @RequiresPermissions({"permission:update"})
    @PostMapping("/update")
    public ResultObj update(Permission Permission){
        try {
            permissionService.update(Permission);
            return ResultObj.UPDATE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.UPDATE_FAIL;
        }
    }
    /**
     * 删除权限
     * @param id
     * @return
     */
    @RequiresPermissions({"permission:delete"})
    @PostMapping("/delete")
    public ResultObj delete(Integer id){
        try {
            permissionService.delete(id);
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }

    /**
     * 查询权限信息
     * @param pageNo
     * @param pageSize
     * @return
     */
    @GetMapping("/listPermission")
    public Result listLoginInfo(PermissionVo permissionVo,
                                @RequestParam(name = "page",required = false,defaultValue = "1") Integer pageNo,
                                @RequestParam(name = "limit",required = false,defaultValue = "20") int pageSize){
        Page<Permission> page= permissionService.findPermissionPage(permissionVo,pageNo,pageSize);
        return new Result(page.getTotal(),page.getRows());
    }
}
