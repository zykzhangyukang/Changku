package com.coderman.changku.biz.modal;

import com.fasterxml.jackson.annotation.JsonProperty;

public class Provider {
    @JsonProperty(value = "id")
    private String fid;

    private Integer merchantno;

    private String merchantname;

    private String merchanttell;

    private String merchantperson;

    private String sh;

    private String bank;

    private String bankcard;

    private String address;

    private String addtime;

    private String operator;

    private Integer version;

    public String getFid() {
        return fid;
    }

    public void setFid(String fid) {
        this.fid = fid == null ? null : fid.trim();
    }

    public Integer getMerchantno() {
        return merchantno;
    }

    public void setMerchantno(Integer merchantno) {
        this.merchantno = merchantno;
    }

    public String getMerchantname() {
        return merchantname;
    }

    public void setMerchantname(String merchantname) {
        this.merchantname = merchantname == null ? null : merchantname.trim();
    }

    public String getMerchanttell() {
        return merchanttell;
    }

    public void setMerchanttell(String merchanttell) {
        this.merchanttell = merchanttell == null ? null : merchanttell.trim();
    }

    public String getMerchantperson() {
        return merchantperson;
    }

    public void setMerchantperson(String merchantperson) {
        this.merchantperson = merchantperson == null ? null : merchantperson.trim();
    }

    public String getSh() {
        return sh;
    }

    public void setSh(String sh) {
        this.sh = sh == null ? null : sh.trim();
    }

    public String getBank() {
        return bank;
    }

    public void setBank(String bank) {
        this.bank = bank == null ? null : bank.trim();
    }

    public String getBankcard() {
        return bankcard;
    }

    public void setBankcard(String bankcard) {
        this.bankcard = bankcard == null ? null : bankcard.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getAddtime() {
        return addtime;
    }

    public void setAddtime(String addtime) {
        this.addtime = addtime == null ? null : addtime.trim();
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator == null ? null : operator.trim();
    }

    public Integer getVersion() {
        return version;
    }

    public void setVersion(Integer version) {
        this.version = version;
    }
}