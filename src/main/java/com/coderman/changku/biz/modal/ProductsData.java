package com.coderman.changku.biz.modal;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.math.BigDecimal;

public class ProductsData {
    @JsonProperty(value = "id")
    private String fid;

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

    public String getFid() {
        return fid;
    }

    public void setFid(String fid) {
        this.fid = fid == null ? null : fid.trim();
    }

    public String getProducttype() {
        return producttype;
    }

    public void setProducttype(String producttype) {
        this.producttype = producttype == null ? null : producttype.trim();
    }

    public String getMerchantname() {
        return merchantname;
    }

    public void setMerchantname(String merchantname) {
        this.merchantname = merchantname == null ? null : merchantname.trim();
    }

    public String getProductbrand() {
        return productbrand;
    }

    public void setProductbrand(String productbrand) {
        this.productbrand = productbrand == null ? null : productbrand.trim();
    }

    public String getProductmodel() {
        return productmodel;
    }

    public void setProductmodel(String productmodel) {
        this.productmodel = productmodel == null ? null : productmodel.trim();
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit == null ? null : unit.trim();
    }

    public Integer getProductcount() {
        return productcount;
    }

    public void setProductcount(Integer productcount) {
        this.productcount = productcount;
    }

    public BigDecimal getProductsingleprice() {
        return productsingleprice;
    }

    public void setProductsingleprice(BigDecimal productsingleprice) {
        this.productsingleprice = productsingleprice;
    }

    public BigDecimal getProductsprice() {
        return productsprice;
    }

    public void setProductsprice(BigDecimal productsprice) {
        this.productsprice = productsprice;
    }

    public String getAddtime() {
        return addtime;
    }

    public void setAddtime(String addtime) {
        this.addtime = addtime == null ? null : addtime.trim();
    }

    public String getManager() {
        return manager;
    }

    public void setManager(String manager) {
        this.manager = manager == null ? null : manager.trim();
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator == null ? null : operator.trim();
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Integer getAllsum() {
        return allsum;
    }

    public void setAllsum(Integer allsum) {
        this.allsum = allsum;
    }

    public Integer getVersion() {
        return version;
    }

    public void setVersion(Integer version) {
        this.version = version;
    }
}