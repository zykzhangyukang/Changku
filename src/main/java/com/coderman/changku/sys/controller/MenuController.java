package com.coderman.changku.sys.controller;

import com.coderman.changku.sys.commons.*;
import com.coderman.changku.sys.modal.Permission;
import com.coderman.changku.sys.modal.User;
import com.coderman.changku.sys.service.PermissionService;
import com.coderman.changku.sys.vo.PermissionVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
}

