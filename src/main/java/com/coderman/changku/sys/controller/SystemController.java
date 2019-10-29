package com.coderman.changku.sys.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 路由跳转
 */
@Controller
@RequestMapping("/sys")
public class SystemController {




    /**
     * 跳转到用户管理页面
     * @return
     */
    @GetMapping("/toUserManager")
    public String toUserManager(){
        return "sys/user/user";
    }




    /**
     * 跳转到Icon管理页面
     * @return
     */
    @GetMapping("/toIconManager")
    public String toIconManager(){
        return "sys/icon/icon";
    }



    /**
     * 跳转到角色管理页面
     * @return
     */
    @GetMapping("/toRoleManager")
    public String toRoleManager(){
        return "sys/role/role";
    }


    /**
     * 跳转到权限管理页面
     * @return
     */
    @GetMapping("/toPermissionLeft")
    public String toPermissionLeft(){
        return "sys/permission/permissionleft";
    }


    /**
     * 跳转到权限管理页面
     * @return
     */
    @GetMapping("/toPermissionRight")
    public String toPermissionRight(){
        return "sys/permission/permissionright";
    }

    /**
     * 跳转到权限管理页面
     * @return
     */
    @GetMapping("/toPermissionManager")
    public String toPermissionManager(){
        return "sys/permission/permission";
    }

    /**
     * 跳转到菜单管理
     * @return
     */
    @GetMapping("/toMenuManager")
    public String toMenuManager(){
        return "sys/menu/menu";
    }
    /**
     * 跳转到部门菜单的部分
     * @return
     */
    @GetMapping("/toMenuLeft")
    public String toMenuLeft(){
        return "sys/menu/menuleft";
    }

    /**
     * 跳转到菜单右边的页面
     * @return
     */
    @GetMapping("/toMenuRight")
    public String toMenutRight(){
        return "sys/menu/menuright";
    }
    /**
    /**
     * 跳转到部门管理
     * @return
     */
    @GetMapping("/toDeptManager")
    public String toDept(){
        return "sys/department/department";
    }
    /**
     * 跳转到部门左边的部分
     * @return
     */
    @GetMapping("/toDeptLeft")
    public String toDeptLeft(){
        return "sys/department/departmentleft";
    }

    /**
     * 跳转到部门右边的页面
     * @return
     */
    @GetMapping("/toDeptRight")
    public String toDeptRight(){
        return "sys/department/departmentright";
    }
    /**
     * 跳转到公告管理
     * @return
     */
    @GetMapping("/toNoticeManager")
    public String toNoticeManager(){
        return "sys/notice/notice";
    }
    /**
     * 跳转到日志管理
     * @return
     */
    @GetMapping("/toLoginInfoManager")
    public String toLoginInfoManager(){
        return "sys/loginInfo/loginInfo";
    }
    /**
     * 跳转到登入页面
     * @return
     */
    @RequestMapping("/toLogin")
    public String toLogin(){
        return "sys/index/login";
    }

    /**
     * 跳转到首页
     * @return
     */
    @RequestMapping("/index")
    public String index(){
        return "sys/index/index";
    }
    /**
     * 工作台
     */
    @GetMapping("/toMain")
    public String toMain(){
        return "sys/index/main";
    }
}
