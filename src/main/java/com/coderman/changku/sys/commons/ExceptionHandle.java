package com.coderman.changku.sys.commons;

import com.coderman.changku.sys.entities.ResultObj;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.apache.shiro.authz.UnauthorizedException;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by zhangyukang on 2019/10/30 13:39
 */
@ControllerAdvice
public class ExceptionHandle {

    /**
     * 处理权限不足时候的异常处理器
     * @param e
     * @return
     */
    @ResponseBody
    @ExceptionHandler(UnauthorizedException.class)
    public ResultObj UnAuthMethod(Exception e){
        String message = e.getMessage();
        System.out.println("info:"+message);
        return ResultObj.NOT_HAVE_PERMISSION;
    }
}
