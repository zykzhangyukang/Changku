package com.coderman.changku.biz.commons;

import com.coderman.changku.sys.commons.Constast;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Created by zhangyukang on 2019/10/31 11:58
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class BizResultObject {

    public static final BizResultObject DELETE_SUCCESS = new BizResultObject(Constast.OK,"删除成功");
    public static final BizResultObject DELETE_ERROR = new BizResultObject(Constast.OK,"删除失败");


    public static final BizResultObject UPDATE_SUCCESS = new BizResultObject(Constast.OK,"更新成功");
    public static final BizResultObject UPDATE_FAIL = new BizResultObject(Constast.OK,"更新失败");

    public static final BizResultObject ADD_SUCCESS = new BizResultObject(Constast.OK,"添加成功");
    public static final BizResultObject ADD_FAIL = new BizResultObject(Constast.OK,"添加失败");

    public static final BizResultObject PERMISSION_SUCCESS = new BizResultObject(Constast.OK,"授权成功");
    public static final BizResultObject PERMISSION_ERROR = new BizResultObject(Constast.OK,"授权失败");

    public static final BizResultObject ROLE_SUCCESS = new BizResultObject(Constast.OK,"分配角色成功");
    public static final BizResultObject ROLE_ERROR = new BizResultObject(Constast.OK,"分配角色失败");

    public static final BizResultObject RESET_SUCCESS = new BizResultObject(Constast.OK,"重置密码成功");
    public static final BizResultObject RESET_ERROR = new BizResultObject(Constast.OK,"重置密码失败");


    public static final BizResultObject NOT_HAVE_PERMISSION = new BizResultObject(Constast.ERROR,"对不起，您没有权限操作");

    public static final BizResultObject STOCK_ERROR = new BizResultObject(Constast.ERROR,"库存错误");


    private Integer code;
    private String msg;
}
