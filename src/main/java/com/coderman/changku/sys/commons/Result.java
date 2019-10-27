package com.coderman.changku.sys.commons;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Result {
    private Integer code=0;
    private String msg="";
    private long count=0;
    private Object data;

    public Result(long count, Object data) {
        this.count = count;
        this.data = data;
    }

    public Result(Object data) {
        this.data = data;
    }
}
