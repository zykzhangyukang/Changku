package com.coderman.changku.sys.controller;

import com.coderman.changku.sys.commons.Page;
import com.coderman.changku.sys.commons.Result;
import com.coderman.changku.sys.commons.TreeNode;
import com.coderman.changku.sys.entities.ResultObj;
import com.coderman.changku.sys.modal.Role;
import com.coderman.changku.sys.service.RoleService;
import com.coderman.changku.sys.vo.RoleVo;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.sql.Date;
import java.util.*;

/**
 * 角色管理
 */
@RestController
@RequestMapping("/role")
public class RoleController {

    @Autowired
    private RoleService roleService;

    /**
     * 给角色分配权限
     * @return
     */
    @RequiresPermissions({"role:saveRolePermission"})
    @PostMapping("/saveRolePermission")
    public ResultObj saveRolePermission(Integer rid,Integer[] pids){
        try {
            if(pids!=null&&pids.length!=0){
                Map<String,Object> map=new HashMap<>();
                map.put("rid",rid);
                map.put("pids", Arrays.asList(pids));
                roleService.saveRolePermission(map);
            }else {
                roleService.cleanRolePermission(rid);
            }
            return ResultObj.PERMISSION_SUCCESS;
        }catch (Exception e){
            return ResultObj.PERMISSION_ERROR;
        }

    }

    /**
     * 加载角色拥有的权限
     * @param roleId
     * @return
     */
    @PostMapping("/loadPermissionByRoleId")
    public Result loadPermissionByRoleId(Integer roleId){
        List<TreeNode> treeNodes=roleService.loadPermissionByRoleId(roleId);
        return new Result(treeNodes);
    }
    /**
     * 查询所有的角色
     * @param roleVo
     * @param pageNo
     * @param pageSize
     * @return
     */
    @GetMapping("/listRoles")
    public Result findPage(RoleVo roleVo,
                           @RequestParam(name = "page",required = false,defaultValue = "1") Integer pageNo,
                           @RequestParam(name = "limit",required = false,defaultValue = "20") int pageSize){
        Page<Role> page= roleService.findPage(roleVo,pageNo,pageSize);
        return new Result(page.getTotal(),page.getRows());
    }

    /**
     * 添加角色的信息
     * @return
     */
    @RequiresPermissions({"role:add"})
    @PostMapping("/add")
    public ResultObj add(Role role){
        role.setCreatetime(new Date(System.currentTimeMillis()));
        try {
            roleService.save(role);
            return ResultObj.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_FAIL;
        }
    }
    /**
     * 删除角色的信息
     * @param id
     * @return
     */
    @RequiresPermissions({"role:delete"})
    @PostMapping("/delete")
    public ResultObj delete(Integer id){
        try {
            roleService.delete(id);
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }
    /**
     * 更新角色
     * @param role
     * @return
     */
    @RequiresPermissions({"role:update"})
    @PostMapping("/update")
    public ResultObj update(Role role){
        try {
            roleService.update(role);
            return ResultObj.UPDATE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.UPDATE_FAIL;
        }
    }
}
