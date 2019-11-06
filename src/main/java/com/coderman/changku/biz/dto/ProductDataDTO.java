package com.coderman.changku.biz.dto;

import lombok.Data;

import java.math.BigDecimal;

/**
 * Created by zhangyukang on 2019/11/6 18:10
 */
@Data
public class ProductDataDTO {

    private String id;

    private String producttype;

    private String merchantname;

    private String productbrand;

    private String productmodel;

    private String unit;

    private Integer productcount;

    private BigDecimal productsingleprice;

    private BigDecimal productsprice;

    private String addtime;

    private String manager;

    private String operator;

    private String type;

    private Integer state;

    private Integer allsum;

    private Integer version;

    private String outcount;


}
