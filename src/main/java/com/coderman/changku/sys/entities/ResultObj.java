package com.coderman.changku.sys.entities;

import com.coderman.changku.sys.commons.Constast;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ResultObj {

    public static  final ResultObj LOGIN_SUCCESS=new ResultObj(Constast.OK,"登入成功");
    public static  final ResultObj LOGIN_FAIL_BY_INFO=new ResultObj(Constast.ERROR,"用户名或密码错误");
    public static  final ResultObj LOGIN_FAIL_BY_CODE=new ResultObj(Constast.ERROR,"验证码不正确");

    public static final ResultObj DELETE_SUCCESS = new ResultObj(Constast.OK,"删除成功");
    public static final ResultObj DELETE_ERROR = new ResultObj(Constast.OK,"删除失败");


    public static final ResultObj UPDATE_SUCCESS = new ResultObj(Constast.OK,"更新成功");
    public static final ResultObj UPDATE_FAIL = new ResultObj(Constast.OK,"更新失败");

    public static final ResultObj ADD_SUCCESS = new ResultObj(Constast.OK,"添加成功");
    public static final ResultObj ADD_FAIL = new ResultObj(Constast.OK,"添加失败");


    private Integer code;
    private String msg;

}
