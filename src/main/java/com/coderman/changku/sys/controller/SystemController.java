package com.coderman.changku.sys.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/sys")
public class SystemController {

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
