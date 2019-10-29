package com.coderman.changku.sys.controller;

import com.coderman.changku.sys.commons.ActiveUser;
import com.coderman.changku.sys.commons.AddressUtils;
import com.coderman.changku.sys.commons.Constast;
import com.coderman.changku.sys.commons.WebUtil;
import com.coderman.changku.sys.entities.ResultObj;
import com.coderman.changku.sys.modal.LoginInfo;
import com.coderman.changku.sys.service.LoginInfoService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.sql.Date;

@RestController
@RequestMapping("/login")
public class LoginController {

    @Autowired
    private LoginInfoService loginInfoService;

    /**登入逻辑
     * @param username: 用户名
     * @param password: 密码
     * @return
     */
    @PostMapping("/login")
    public ResultObj login(@RequestParam("username") String username,
                           @RequestParam("password") String password) {
        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken usernamePasswordToken = new UsernamePasswordToken(username, password);
        try {
            subject.login(usernamePasswordToken);
            ActiveUser activeUser= (ActiveUser) subject.getPrincipal();
            //把用户放到session中
            WebUtil.getSession().setAttribute("user",activeUser.getUser());
            //记录登入日志
            LoginInfo loginInfo = new LoginInfo();
            loginInfo.setLoginname(activeUser.getUser().getName()+"-"+activeUser.getUser().getLoginname());
            loginInfo.setLoginip(WebUtil.getRequest().getRemoteAddr());
            loginInfo.setLogintime(new Date(System.currentTimeMillis()));
            //根据Ip获取用户的登入地点。
            try {
                loginInfo.setAddress(
                        AddressUtils.getAddress("ip="+WebUtil.getRequest().getRemoteAddr().toString(), "utf-8")
                );
            } catch (Exception e) {
                loginInfo.setAddress(Constast.IP_ADDRESS);
            }
            loginRecord(loginInfo);
            return ResultObj.LOGIN_SUCCESS;
        }catch (AuthenticationException e){
            return ResultObj.LOGIN_FAIL_BY_INFO;
        }
    }

    /**
     * 保存登入日志
     * @param loginInfo
     */
    private void loginRecord(LoginInfo loginInfo) {
        loginInfoService.save(loginInfo);
    }
}
