package com.coderman.changku.biz.exception;

import com.coderman.changku.biz.commons.BizResultObject;
import lombok.Data;

/**
 * Created by zhangyukang on 2019/11/6 18:15
 */
@Data
public class BizException extends RuntimeException {
    private Integer code;

    public BizException() {
    }
    public BizException(BizResultObject resultObject) {
        super(resultObject.getMsg());
        this.code=resultObject.getCode();
    }
}
