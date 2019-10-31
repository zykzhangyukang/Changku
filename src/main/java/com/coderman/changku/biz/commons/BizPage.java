package com.coderman.changku.biz.commons;

import lombok.Data;

import java.util.List;

/**
 * Created by zhangyukang on 2019/10/31 10:51
 */
@Data
public class BizPage<T> {
    private long total;
    private List<T> rows;

    public long getTotal() {
        return total;
    }

    public void setTotal(long total) {
        this.total = total;
    }

    public List<T> getRows() {
        return rows;
    }

    public void setRows(List<T> rows) {
        this.rows = rows;
    }

    public BizPage(long total, List<T> rows) {
        this.total = total;
        this.rows = rows;
    }
}
