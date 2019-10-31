package com.coderman.changku.biz.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by zhangyukang on 2019/10/31 11:14
 */
@Controller
@RequestMapping("/biz")
public class BizController {
    /**
     * 跳转到客户管理页面
     * @return
     */
    @GetMapping("/toCustomerManager")
    public String toCustomerManager(){
        return "/biz/customer/customer";
    }
}
