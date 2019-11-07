package com.coderman.changku.biz.modal;

import java.math.BigDecimal;

public class ProductsOutCong {
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


    private BigDecimal productsprice;

    private String addtime;

    private String manager;

    private String operator;


    private Integer state;

    private Integer allsum;

    private String customername;

    public String getCustomername() {
        return customername;
    }

    public void setCustomername(String customername) {
        this.customername = customername;
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
        this.addtime = addtime;
    }

    public String getManager() {
        return manager;
    }

    public void setManager(String manager) {
        this.manager = manager;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
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

    public String getProductbrand() {
        return productbrand;
    }

    public void setProductbrand(String productbrand) {
        this.productbrand = productbrand == null ? null : productbrand.trim();
    }

    public Integer getProductcount() {
        return productcount;
    }

    public void setProductcount(Integer productcount) {
        this.productcount = productcount;
    }

    public String getProductunit() {
        return productunit;
    }

    public void setProductunit(String productunit) {
        this.productunit = productunit == null ? null : productunit.trim();
    }

    public String getProductmodel() {
        return productmodel;
    }

    public void setProductmodel(String productmodel) {
        this.productmodel = productmodel == null ? null : productmodel.trim();
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public BigDecimal getProductsingleprice() {
        return productsingleprice;
    }

    public void setProductsingleprice(BigDecimal productsingleprice) {
        this.productsingleprice = productsingleprice;
    }

    public BigDecimal getProductallprice() {
        return productallprice;
    }

    public void setProductallprice(BigDecimal productallprice) {
        this.productallprice = productallprice;
    }

    public Integer getVersion() {
        return version;
    }

    public void setVersion(Integer version) {
        this.version = version;
    }

    public String getFfid() {
        return ffid;
    }

    public void setFfid(String ffid) {
        this.ffid = ffid == null ? null : ffid.trim();
    }

    public String getFcor() {
        return fcor;
    }

    public void setFcor(String fcor) {
        this.fcor = fcor == null ? null : fcor.trim();
    }
}