package com.coderman.changku.biz.modal;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.Objects;

public class ProductCong {
    @JsonProperty(value = "id")
    private String fid;

    private String productbrand;

    private String productmodel;

    private String type;

    private String remark;

    private String typeid;

    private Integer version;

    private String fcor;

    public String getFid() {
        return fid;
    }

    public void setFid(String fid) {
        this.fid = fid == null ? null : fid.trim();
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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public String getTypeid() {
        return typeid;
    }

    public void setTypeid(String typeid) {
        this.typeid = typeid == null ? null : typeid.trim();
    }

    public Integer getVersion() {
        return version;
    }

    public void setVersion(Integer version) {
        this.version = version;
    }

    public String getFcor() {
        return fcor;
    }

    public void setFcor(String fcor) {
        this.fcor = fcor == null ? null : fcor.trim();
    }

}