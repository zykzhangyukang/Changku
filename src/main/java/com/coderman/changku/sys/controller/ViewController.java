package com.coderman.changku.sys.controller;

import com.coderman.changku.biz.commons.ResultJson;
import com.coderman.changku.sys.commons.WebUtil;
import com.coderman.changku.sys.modal.User;
import com.coderman.changku.sys.service.LoginInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by zhangyukang on 2019/11/1 17:55
 */
@RestController
@RequestMapping("/view")
public class ViewController {

    @Autowired
    private LoginInfoService loginInfoService;

    /**
     * 近期访问记录
     * @return
     */
    @GetMapping("/loadViewCount")
    public ResultJson loadViewCount(){
        Map<String, Object> data = new HashMap<>();
        User user = (User) WebUtil.getSession().getAttribute("user");
        List<Map<String, Object>> lastSevenVisitCount = this.loginInfoService.findLastSevenDaysVisitCount(null);
        data.put("lastSevenVisitCount", lastSevenVisitCount);
        return new ResultJson(data);
    }
}
