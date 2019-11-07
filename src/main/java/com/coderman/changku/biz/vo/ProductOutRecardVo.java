package com.coderman.changku.biz.vo;

import lombok.Data;

import java.math.BigDecimal;

/**
 * Created by zhangyukang on 2019/11/7 15:53
 */
@Data
public class ProductOutRecardVo {

    private String fid;

    private String producttype;

    private String productbrand;

    private Integer productcount;

    private String productunit;

    private String productmodel;

    private String type;

    private BigDecimal productsingleprice;

    private BigDecimal productallprice;

    private Integer version;

    private String ffid;

    private String fcor;

    private String customername;





}
