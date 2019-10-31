package com.coderman.changku.biz.commons;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Created by zhangyukang on 2019/10/31 10:49
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ResultJson {
    private Integer code=0;
    private String msg="";
    private long count=0;
    private Object data;

    public ResultJson(long count, Object data) {
        this.count = count;
        this.data = data;
    }

    public ResultJson(Object data) {
        this.data = data;
    }
}
