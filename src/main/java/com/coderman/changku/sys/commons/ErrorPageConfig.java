package com.coderman.changku.sys.commons;

/**
 * Created by zhangyukang on 2019/10/30 15:28
 */

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;


/**
 *
 * @ClassName: ErrorPageConfig
 * @Description: 配置错误页面
 * @author cheng
 * @date 2018年4月3日 下午3:45:49
 */
@Controller
public class ErrorPageConfig  implements ErrorController {



    @Override
    public String getErrorPath() {
        return "/error";
    }

    @RequestMapping("/error")
    public String handleError(HttpServletRequest request){
        //获取statusCode:401,404,500
        Integer statusCode = (Integer) request.getAttribute("javax.servlet.error.status_code");
        if(statusCode == 401){
            return "/401";
        }else if(statusCode == 404){
            return "/sys/404";
        }else if(statusCode == 403){
            return "/403";
        }else{
            return "/500";
        }

    }

}