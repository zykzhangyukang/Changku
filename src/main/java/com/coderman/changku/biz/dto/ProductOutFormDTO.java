package com.coderman.changku.biz.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * 封装商品出库的兑现
 * Created by zhangyukang on 2019/11/6 17:11
 */
@Data
public class ProductOutFormDTO {

    @JsonProperty(value = "id")
    private String fid;

    private String customerno;

    private String customername;

    private String customertell;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private String birthday;

    private String sh;

    private String bank;

    private String bankno;

    private String address;

    private String carpinpai;

    private String cartype;

    private String carno;

    private String items;

    private Double  cardistance;

}
