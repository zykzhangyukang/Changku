package com.coderman.changku.biz.modal;

import java.math.BigDecimal;
import java.util.Date;

public class ProductsOutmain {
    private String fid;

    private String customername;

    private String customertell;

    private String carpinpai;

    private String cartype;

    private String carno;

    private Double cardistance;

    private Integer money;

    private BigDecimal allsum;

    private String manager;

    private String operator;

    private Date addtime;

    private String remark;

    private Integer version;

    private String fcor;

    private BigDecimal myallsum;

    public String getFid() {
        return fid;
    }

    public void setFid(String fid) {
        this.fid = fid == null ? null : fid.trim();
    }

    public String getCustomername() {
        return customername;
    }

    public void setCustomername(String customername) {
        this.customername = customername == null ? null : customername.trim();
    }

    public String getCustomertell() {
        return customertell;
    }

    public void setCustomertell(String customertell) {
        this.customertell = customertell == null ? null : customertell.trim();
    }

    public String getCarpinpai() {
        return carpinpai;
    }

    public void setCarpinpai(String carpinpai) {
        this.carpinpai = carpinpai == null ? null : carpinpai.trim();
    }

    public String getCartype() {
        return cartype;
    }

    public void setCartype(String cartype) {
        this.cartype = cartype == null ? null : cartype.trim();
    }

    public String getCarno() {
        return carno;
    }

    public void setCarno(String carno) {
        this.carno = carno == null ? null : carno.trim();
    }

    public Double getCardistance() {
        return cardistance;
    }

    public void setCardistance(Double cardistance) {
        this.cardistance = cardistance;
    }

    public Integer getMoney() {
        return money;
    }

    public void setMoney(Integer money) {
        this.money = money;
    }

    public BigDecimal getAllsum() {
        return allsum;
    }

    public void setAllsum(BigDecimal allsum) {
        this.allsum = allsum;
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

    public Date getAddtime() {
        return addtime;
    }

    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
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

    public BigDecimal getMyallsum() {
        return myallsum;
    }

    public void setMyallsum(BigDecimal myallsum) {
        this.myallsum = myallsum;
    }
}