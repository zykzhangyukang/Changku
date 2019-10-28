package com.coderman.changku.sys.controller;

import com.coderman.changku.sys.commons.*;
import com.coderman.changku.sys.entities.ResultObj;
import com.coderman.changku.sys.modal.Permission;
import com.coderman.changku.sys.modal.Permission;
import com.coderman.changku.sys.modal.User;
import com.coderman.changku.sys.service.PermissionService;
import com.coderman.changku.sys.vo.PermissionVo;
import com.coderman.changku.sys.vo.PermissionVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

/**
 * 菜单管理
 */
@RestController
@RequestMapping("/menu")
public class MenuController {
    @Autowired
    private PermissionService permissionService;

    @GetMapping("/loadIndexLeftMenu")
    public Result loadIndexLeftMenu(PermissionVo permissionVo){
        List<Permission> menus;
        User user = (User) WebUtil.getSession().getAttribute("user");
        if(user.getType()==0){
            //超级用户
             menus=permissionService.findMenu();
        }else {
            //普通用户根据用户id，角色，权限查询。
            menus=permissionService.findMenu();
        }
        //处理list，返回List<TreeNode>
        List<TreeNode> treeNodes=new ArrayList<>();
        for (Permission menu : menus) {
            Integer id = menu.getId();
            Integer pid = menu.getPid();
            String title = menu.getTitle();
            String icon = menu.getIcon();
            String href = menu.getHref();
            Boolean spread=menu.getOpen()== Constast.OPEN_TRUE? true:false;
            treeNodes.add(new TreeNode( id,  pid,  title,  icon,  href,  spread));
        }
        //构建层级关系
        List<TreeNode> nodes = TreeNodeBuilder.build(treeNodes, 1);
        return new Result(nodes);
    }
    /*****************************菜单管理*********************************/
    /**
     * 加载左边菜单树的json
     * @return
     */
    @PostMapping("/loadMenuTree")
    public Result loadDeptTree() {
        List<Permission> permissions = permissionService.listAllMenu();
        List<TreeNode> treeNodes = new ArrayList<>();
        for (Permission permission : permissions) {
            Boolean spread = permission.getOpen() == Constast.OPEN_TRUE ? true : false;
            treeNodes.add(new TreeNode(permission.getId(), permission.getPid(), permission.getTitle(), spread));
        }
        return new Result(treeNodes);
    }
    /**
     * 添加菜单信息
     * @param Permission
     * @return
     */
    @PostMapping("/add")
    public ResultObj add(Permission Permission){
        try {
            Permission.setType(Constast.MENU_TYPE);
            permissionService.save(Permission);
            return ResultObj.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_FAIL;
        }
    }
    /**
     * 更新菜单信息
     * @param Permission
     * @return
     */
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
     * 删除菜单
     * @param id
     * @return
     */
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
     * 查询菜单信息
     * @param pageNo
     * @param pageSize
     * @return
     */
    @GetMapping("/listMenus")
    public Result listLoginInfo(PermissionVo permissionVo,
                                @RequestParam(name = "page",required = false,defaultValue = "1") Integer pageNo,
                                @RequestParam(name = "limit",required = false,defaultValue = "20") int pageSize){
        Page<Permission> page= permissionService.findMenuPage(permissionVo,pageNo,pageSize);
        return new Result(page.getTotal(),page.getRows());
    }
}

