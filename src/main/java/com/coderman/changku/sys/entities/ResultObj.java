package com.coderman.changku.sys.entities;

import com.coderman.changku.sys.commons.Constast;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ResultObj {

    public static  final ResultObj LOGIN_SUCCESS=new ResultObj(Constast.OK,"兄弟恭喜你登入成功~");
    public static  final ResultObj LOGIN_FAIL_BY_INFO=new ResultObj(Constast.ERROR,"用户名或密码错误");
    public static  final ResultObj LOGIN_FAIL_BY_CODE=new ResultObj(Constast.ERROR,"验证码不正确");

    public static final ResultObj DELETE_SUCCESS = new ResultObj(Constast.OK,"删除成功");
    public static final ResultObj DELETE_ERROR = new ResultObj(Constast.OK,"删除失败");


    public static final ResultObj UPDATE_SUCCESS = new ResultObj(Constast.OK,"更新成功");
    public static final ResultObj UPDATE_FAIL = new ResultObj(Constast.OK,"更新失败");

    public static final ResultObj ADD_SUCCESS = new ResultObj(Constast.OK,"添加成功");
    public static final ResultObj ADD_FAIL = new ResultObj(Constast.OK,"添加失败");

    public static final ResultObj PERMISSION_SUCCESS = new ResultObj(Constast.OK,"授权成功");
    public static final ResultObj PERMISSION_ERROR = new ResultObj(Constast.OK,"授权失败");

    public static final ResultObj ROLE_SUCCESS = new ResultObj(Constast.OK,"分配角色成功");
    public static final ResultObj ROLE_ERROR = new ResultObj(Constast.OK,"分配角色失败");

    public static final ResultObj RESET_SUCCESS = new ResultObj(Constast.OK,"重置密码成功");
    public static final ResultObj RESET_ERROR = new ResultObj(Constast.OK,"重置密码失败");


    public static final ResultObj NOT_HAVE_PERMISSION = new ResultObj(Constast.ERROR,"对不起，您没有权限操作");


    private Integer code;
    private String msg;

}
