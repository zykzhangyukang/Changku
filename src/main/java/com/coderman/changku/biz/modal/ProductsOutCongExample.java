package com.coderman.changku.biz.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class ProductsOutCongExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public ProductsOutCongExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andFidIsNull() {
            addCriterion("fID is null");
            return (Criteria) this;
        }

        public Criteria andFidIsNotNull() {
            addCriterion("fID is not null");
            return (Criteria) this;
        }

        public Criteria andFidEqualTo(String value) {
            addCriterion("fID =", value, "fid");
            return (Criteria) this;
        }

        public Criteria andFidNotEqualTo(String value) {
            addCriterion("fID <>", value, "fid");
            return (Criteria) this;
        }

        public Criteria andFidGreaterThan(String value) {
            addCriterion("fID >", value, "fid");
            return (Criteria) this;
        }

        public Criteria andFidGreaterThanOrEqualTo(String value) {
            addCriterion("fID >=", value, "fid");
            return (Criteria) this;
        }

        public Criteria andFidLessThan(String value) {
            addCriterion("fID <", value, "fid");
            return (Criteria) this;
        }

        public Criteria andFidLessThanOrEqualTo(String value) {
            addCriterion("fID <=", value, "fid");
            return (Criteria) this;
        }

        public Criteria andFidLike(String value) {
            addCriterion("fID like", value, "fid");
            return (Criteria) this;
        }

        public Criteria andFidNotLike(String value) {
            addCriterion("fID not like", value, "fid");
            return (Criteria) this;
        }

        public Criteria andFidIn(List<String> values) {
            addCriterion("fID in", values, "fid");
            return (Criteria) this;
        }

        public Criteria andFidNotIn(List<String> values) {
            addCriterion("fID not in", values, "fid");
            return (Criteria) this;
        }

        public Criteria andFidBetween(String value1, String value2) {
            addCriterion("fID between", value1, value2, "fid");
            return (Criteria) this;
        }

        public Criteria andFidNotBetween(String value1, String value2) {
            addCriterion("fID not between", value1, value2, "fid");
            return (Criteria) this;
        }

        public Criteria andProducttypeIsNull() {
            addCriterion("producttype is null");
            return (Criteria) this;
        }

        public Criteria andProducttypeIsNotNull() {
            addCriterion("producttype is not null");
            return (Criteria) this;
        }

        public Criteria andProducttypeEqualTo(String value) {
            addCriterion("producttype =", value, "producttype");
            return (Criteria) this;
        }

        public Criteria andProducttypeNotEqualTo(String value) {
            addCriterion("producttype <>", value, "producttype");
            return (Criteria) this;
        }

        public Criteria andProducttypeGreaterThan(String value) {
            addCriterion("producttype >", value, "producttype");
            return (Criteria) this;
        }

        public Criteria andProducttypeGreaterThanOrEqualTo(String value) {
            addCriterion("producttype >=", value, "producttype");
            return (Criteria) this;
        }

        public Criteria andProducttypeLessThan(String value) {
            addCriterion("producttype <", value, "producttype");
            return (Criteria) this;
        }

        public Criteria andProducttypeLessThanOrEqualTo(String value) {
            addCriterion("producttype <=", value, "producttype");
            return (Criteria) this;
        }

        public Criteria andProducttypeLike(String value) {
            addCriterion("producttype like", value, "producttype");
            return (Criteria) this;
        }

        public Criteria andProducttypeNotLike(String value) {
            addCriterion("producttype not like", value, "producttype");
            return (Criteria) this;
        }

        public Criteria andProducttypeIn(List<String> values) {
            addCriterion("producttype in", values, "producttype");
            return (Criteria) this;
        }

        public Criteria andProducttypeNotIn(List<String> values) {
            addCriterion("producttype not in", values, "producttype");
            return (Criteria) this;
        }

        public Criteria andProducttypeBetween(String value1, String value2) {
            addCriterion("producttype between", value1, value2, "producttype");
            return (Criteria) this;
        }

        public Criteria andProducttypeNotBetween(String value1, String value2) {
            addCriterion("producttype not between", value1, value2, "producttype");
            return (Criteria) this;
        }

        public Criteria andProductbrandIsNull() {
            addCriterion("productbrand is null");
            return (Criteria) this;
        }

        public Criteria andProductbrandIsNotNull() {
            addCriterion("productbrand is not null");
            return (Criteria) this;
        }

        public Criteria andProductbrandEqualTo(String value) {
            addCriterion("productbrand =", value, "productbrand");
            return (Criteria) this;
        }

        public Criteria andProductbrandNotEqualTo(String value) {
            addCriterion("productbrand <>", value, "productbrand");
            return (Criteria) this;
        }

        public Criteria andProductbrandGreaterThan(String value) {
            addCriterion("productbrand >", value, "productbrand");
            return (Criteria) this;
        }

        public Criteria andProductbrandGreaterThanOrEqualTo(String value) {
            addCriterion("productbrand >=", value, "productbrand");
            return (Criteria) this;
        }

        public Criteria andProductbrandLessThan(String value) {
            addCriterion("productbrand <", value, "productbrand");
            return (Criteria) this;
        }

        public Criteria andProductbrandLessThanOrEqualTo(String value) {
            addCriterion("productbrand <=", value, "productbrand");
            return (Criteria) this;
        }

        public Criteria andProductbrandLike(String value) {
            addCriterion("productbrand like", value, "productbrand");
            return (Criteria) this;
        }

        public Criteria andProductbrandNotLike(String value) {
            addCriterion("productbrand not like", value, "productbrand");
            return (Criteria) this;
        }

        public Criteria andProductbrandIn(List<String> values) {
            addCriterion("productbrand in", values, "productbrand");
            return (Criteria) this;
        }

        public Criteria andProductbrandNotIn(List<String> values) {
            addCriterion("productbrand not in", values, "productbrand");
            return (Criteria) this;
        }

        public Criteria andProductbrandBetween(String value1, String value2) {
            addCriterion("productbrand between", value1, value2, "productbrand");
            return (Criteria) this;
        }

        public Criteria andProductbrandNotBetween(String value1, String value2) {
            addCriterion("productbrand not between", value1, value2, "productbrand");
            return (Criteria) this;
        }

        public Criteria andProductcountIsNull() {
            addCriterion("productcount is null");
            return (Criteria) this;
        }

        public Criteria andProductcountIsNotNull() {
            addCriterion("productcount is not null");
            return (Criteria) this;
        }

        public Criteria andProductcountEqualTo(Integer value) {
            addCriterion("productcount =", value, "productcount");
            return (Criteria) this;
        }

        public Criteria andProductcountNotEqualTo(Integer value) {
            addCriterion("productcount <>", value, "productcount");
            return (Criteria) this;
        }

        public Criteria andProductcountGreaterThan(Integer value) {
            addCriterion("productcount >", value, "productcount");
            return (Criteria) this;
        }

        public Criteria andProductcountGreaterThanOrEqualTo(Integer value) {
            addCriterion("productcount >=", value, "productcount");
            return (Criteria) this;
        }

        public Criteria andProductcountLessThan(Integer value) {
            addCriterion("productcount <", value, "productcount");
            return (Criteria) this;
        }

        public Criteria andProductcountLessThanOrEqualTo(Integer value) {
            addCriterion("productcount <=", value, "productcount");
            return (Criteria) this;
        }

        public Criteria andProductcountIn(List<Integer> values) {
            addCriterion("productcount in", values, "productcount");
            return (Criteria) this;
        }

        public Criteria andProductcountNotIn(List<Integer> values) {
            addCriterion("productcount not in", values, "productcount");
            return (Criteria) this;
        }

        public Criteria andProductcountBetween(Integer value1, Integer value2) {
            addCriterion("productcount between", value1, value2, "productcount");
            return (Criteria) this;
        }

        public Criteria andProductcountNotBetween(Integer value1, Integer value2) {
            addCriterion("productcount not between", value1, value2, "productcount");
            return (Criteria) this;
        }

        public Criteria andProductunitIsNull() {
            addCriterion("productunit is null");
            return (Criteria) this;
        }

        public Criteria andProductunitIsNotNull() {
            addCriterion("productunit is not null");
            return (Criteria) this;
        }

        public Criteria andProductunitEqualTo(String value) {
            addCriterion("productunit =", value, "productunit");
            return (Criteria) this;
        }

        public Criteria andProductunitNotEqualTo(String value) {
            addCriterion("productunit <>", value, "productunit");
            return (Criteria) this;
        }

        public Criteria andProductunitGreaterThan(String value) {
            addCriterion("productunit >", value, "productunit");
            return (Criteria) this;
        }

        public Criteria andProductunitGreaterThanOrEqualTo(String value) {
            addCriterion("productunit >=", value, "productunit");
            return (Criteria) this;
        }

        public Criteria andProductunitLessThan(String value) {
            addCriterion("productunit <", value, "productunit");
            return (Criteria) this;
        }

        public Criteria andProductunitLessThanOrEqualTo(String value) {
            addCriterion("productunit <=", value, "productunit");
            return (Criteria) this;
        }

        public Criteria andProductunitLike(String value) {
            addCriterion("productunit like", value, "productunit");
            return (Criteria) this;
        }

        public Criteria andProductunitNotLike(String value) {
            addCriterion("productunit not like", value, "productunit");
            return (Criteria) this;
        }

        public Criteria andProductunitIn(List<String> values) {
            addCriterion("productunit in", values, "productunit");
            return (Criteria) this;
        }

        public Criteria andProductunitNotIn(List<String> values) {
            addCriterion("productunit not in", values, "productunit");
            return (Criteria) this;
        }

        public Criteria andProductunitBetween(String value1, String value2) {
            addCriterion("productunit between", value1, value2, "productunit");
            return (Criteria) this;
        }

        public Criteria andProductunitNotBetween(String value1, String value2) {
            addCriterion("productunit not between", value1, value2, "productunit");
            return (Criteria) this;
        }

        public Criteria andProductmodelIsNull() {
            addCriterion("productmodel is null");
            return (Criteria) this;
        }

        public Criteria andProductmodelIsNotNull() {
            addCriterion("productmodel is not null");
            return (Criteria) this;
        }

        public Criteria andProductmodelEqualTo(String value) {
            addCriterion("productmodel =", value, "productmodel");
            return (Criteria) this;
        }

        public Criteria andProductmodelNotEqualTo(String value) {
            addCriterion("productmodel <>", value, "productmodel");
            return (Criteria) this;
        }

        public Criteria andProductmodelGreaterThan(String value) {
            addCriterion("productmodel >", value, "productmodel");
            return (Criteria) this;
        }

        public Criteria andProductmodelGreaterThanOrEqualTo(String value) {
            addCriterion("productmodel >=", value, "productmodel");
            return (Criteria) this;
        }

        public Criteria andProductmodelLessThan(String value) {
            addCriterion("productmodel <", value, "productmodel");
            return (Criteria) this;
        }

        public Criteria andProductmodelLessThanOrEqualTo(String value) {
            addCriterion("productmodel <=", value, "productmodel");
            return (Criteria) this;
        }

        public Criteria andProductmodelLike(String value) {
            addCriterion("productmodel like", value, "productmodel");
            return (Criteria) this;
        }

        public Criteria andProductmodelNotLike(String value) {
            addCriterion("productmodel not like", value, "productmodel");
            return (Criteria) this;
        }

        public Criteria andProductmodelIn(List<String> values) {
            addCriterion("productmodel in", values, "productmodel");
            return (Criteria) this;
        }

        public Criteria andProductmodelNotIn(List<String> values) {
            addCriterion("productmodel not in", values, "productmodel");
            return (Criteria) this;
        }

        public Criteria andProductmodelBetween(String value1, String value2) {
            addCriterion("productmodel between", value1, value2, "productmodel");
            return (Criteria) this;
        }

        public Criteria andProductmodelNotBetween(String value1, String value2) {
            addCriterion("productmodel not between", value1, value2, "productmodel");
            return (Criteria) this;
        }

        public Criteria andTypeIsNull() {
            addCriterion("type is null");
            return (Criteria) this;
        }

        public Criteria andTypeIsNotNull() {
            addCriterion("type is not null");
            return (Criteria) this;
        }

        public Criteria andTypeEqualTo(String value) {
            addCriterion("type =", value, "type");
            return (Criteria) this;
        }

        public Criteria andTypeNotEqualTo(String value) {
            addCriterion("type <>", value, "type");
            return (Criteria) this;
        }

        public Criteria andTypeGreaterThan(String value) {
            addCriterion("type >", value, "type");
            return (Criteria) this;
        }

        public Criteria andTypeGreaterThanOrEqualTo(String value) {
            addCriterion("type >=", value, "type");
            return (Criteria) this;
        }

        public Criteria andTypeLessThan(String value) {
            addCriterion("type <", value, "type");
            return (Criteria) this;
        }

        public Criteria andTypeLessThanOrEqualTo(String value) {
            addCriterion("type <=", value, "type");
            return (Criteria) this;
        }

        public Criteria andTypeLike(String value) {
            addCriterion("type like", value, "type");
            return (Criteria) this;
        }

        public Criteria andTypeNotLike(String value) {
            addCriterion("type not like", value, "type");
            return (Criteria) this;
        }

        public Criteria andTypeIn(List<String> values) {
            addCriterion("type in", values, "type");
            return (Criteria) this;
        }

        public Criteria andTypeNotIn(List<String> values) {
            addCriterion("type not in", values, "type");
            return (Criteria) this;
        }

        public Criteria andTypeBetween(String value1, String value2) {
            addCriterion("type between", value1, value2, "type");
            return (Criteria) this;
        }

        public Criteria andTypeNotBetween(String value1, String value2) {
            addCriterion("type not between", value1, value2, "type");
            return (Criteria) this;
        }

        public Criteria andProductsinglepriceIsNull() {
            addCriterion("productsingleprice is null");
            return (Criteria) this;
        }

        public Criteria andProductsinglepriceIsNotNull() {
            addCriterion("productsingleprice is not null");
            return (Criteria) this;
        }

        public Criteria andProductsinglepriceEqualTo(BigDecimal value) {
            addCriterion("productsingleprice =", value, "productsingleprice");
            return (Criteria) this;
        }

        public Criteria andProductsinglepriceNotEqualTo(BigDecimal value) {
            addCriterion("productsingleprice <>", value, "productsingleprice");
            return (Criteria) this;
        }

        public Criteria andProductsinglepriceGreaterThan(BigDecimal value) {
            addCriterion("productsingleprice >", value, "productsingleprice");
            return (Criteria) this;
        }

        public Criteria andProductsinglepriceGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("productsingleprice >=", value, "productsingleprice");
            return (Criteria) this;
        }

        public Criteria andProductsinglepriceLessThan(BigDecimal value) {
            addCriterion("productsingleprice <", value, "productsingleprice");
            return (Criteria) this;
        }

        public Criteria andProductsinglepriceLessThanOrEqualTo(BigDecimal value) {
            addCriterion("productsingleprice <=", value, "productsingleprice");
            return (Criteria) this;
        }

        public Criteria andProductsinglepriceIn(List<BigDecimal> values) {
            addCriterion("productsingleprice in", values, "productsingleprice");
            return (Criteria) this;
        }

        public Criteria andProductsinglepriceNotIn(List<BigDecimal> values) {
            addCriterion("productsingleprice not in", values, "productsingleprice");
            return (Criteria) this;
        }

        public Criteria andProductsinglepriceBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("productsingleprice between", value1, value2, "productsingleprice");
            return (Criteria) this;
        }

        public Criteria andProductsinglepriceNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("productsingleprice not between", value1, value2, "productsingleprice");
            return (Criteria) this;
        }

        public Criteria andProductallpriceIsNull() {
            addCriterion("productallprice is null");
            return (Criteria) this;
        }

        public Criteria andProductallpriceIsNotNull() {
            addCriterion("productallprice is not null");
            return (Criteria) this;
        }

        public Criteria andProductallpriceEqualTo(BigDecimal value) {
            addCriterion("productallprice =", value, "productallprice");
            return (Criteria) this;
        }

        public Criteria andProductallpriceNotEqualTo(BigDecimal value) {
            addCriterion("productallprice <>", value, "productallprice");
            return (Criteria) this;
        }

        public Criteria andProductallpriceGreaterThan(BigDecimal value) {
            addCriterion("productallprice >", value, "productallprice");
            return (Criteria) this;
        }

        public Criteria andProductallpriceGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("productallprice >=", value, "productallprice");
            return (Criteria) this;
        }

        public Criteria andProductallpriceLessThan(BigDecimal value) {
            addCriterion("productallprice <", value, "productallprice");
            return (Criteria) this;
        }

        public Criteria andProductallpriceLessThanOrEqualTo(BigDecimal value) {
            addCriterion("productallprice <=", value, "productallprice");
            return (Criteria) this;
        }

        public Criteria andProductallpriceIn(List<BigDecimal> values) {
            addCriterion("productallprice in", values, "productallprice");
            return (Criteria) this;
        }

        public Criteria andProductallpriceNotIn(List<BigDecimal> values) {
            addCriterion("productallprice not in", values, "productallprice");
            return (Criteria) this;
        }

        public Criteria andProductallpriceBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("productallprice between", value1, value2, "productallprice");
            return (Criteria) this;
        }

        public Criteria andProductallpriceNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("productallprice not between", value1, value2, "productallprice");
            return (Criteria) this;
        }

        public Criteria andVersionIsNull() {
            addCriterion("version is null");
            return (Criteria) this;
        }

        public Criteria andVersionIsNotNull() {
            addCriterion("version is not null");
            return (Criteria) this;
        }

        public Criteria andVersionEqualTo(Integer value) {
            addCriterion("version =", value, "version");
            return (Criteria) this;
        }

        public Criteria andVersionNotEqualTo(Integer value) {
            addCriterion("version <>", value, "version");
            return (Criteria) this;
        }

        public Criteria andVersionGreaterThan(Integer value) {
            addCriterion("version >", value, "version");
            return (Criteria) this;
        }

        public Criteria andVersionGreaterThanOrEqualTo(Integer value) {
            addCriterion("version >=", value, "version");
            return (Criteria) this;
        }

        public Criteria andVersionLessThan(Integer value) {
            addCriterion("version <", value, "version");
            return (Criteria) this;
        }

        public Criteria andVersionLessThanOrEqualTo(Integer value) {
            addCriterion("version <=", value, "version");
            return (Criteria) this;
        }

        public Criteria andVersionIn(List<Integer> values) {
            addCriterion("version in", values, "version");
            return (Criteria) this;
        }

        public Criteria andVersionNotIn(List<Integer> values) {
            addCriterion("version not in", values, "version");
            return (Criteria) this;
        }

        public Criteria andVersionBetween(Integer value1, Integer value2) {
            addCriterion("version between", value1, value2, "version");
            return (Criteria) this;
        }

        public Criteria andVersionNotBetween(Integer value1, Integer value2) {
            addCriterion("version not between", value1, value2, "version");
            return (Criteria) this;
        }

        public Criteria andFfidIsNull() {
            addCriterion("ffid is null");
            return (Criteria) this;
        }

        public Criteria andFfidIsNotNull() {
            addCriterion("ffid is not null");
            return (Criteria) this;
        }

        public Criteria andFfidEqualTo(String value) {
            addCriterion("ffid =", value, "ffid");
            return (Criteria) this;
        }

        public Criteria andFfidNotEqualTo(String value) {
            addCriterion("ffid <>", value, "ffid");
            return (Criteria) this;
        }

        public Criteria andFfidGreaterThan(String value) {
            addCriterion("ffid >", value, "ffid");
            return (Criteria) this;
        }

        public Criteria andFfidGreaterThanOrEqualTo(String value) {
            addCriterion("ffid >=", value, "ffid");
            return (Criteria) this;
        }

        public Criteria andFfidLessThan(String value) {
            addCriterion("ffid <", value, "ffid");
            return (Criteria) this;
        }

        public Criteria andFfidLessThanOrEqualTo(String value) {
            addCriterion("ffid <=", value, "ffid");
            return (Criteria) this;
        }

        public Criteria andFfidLike(String value) {
            addCriterion("ffid like", value, "ffid");
            return (Criteria) this;
        }

        public Criteria andFfidNotLike(String value) {
            addCriterion("ffid not like", value, "ffid");
            return (Criteria) this;
        }

        public Criteria andFfidIn(List<String> values) {
            addCriterion("ffid in", values, "ffid");
            return (Criteria) this;
        }

        public Criteria andFfidNotIn(List<String> values) {
            addCriterion("ffid not in", values, "ffid");
            return (Criteria) this;
        }

        public Criteria andFfidBetween(String value1, String value2) {
            addCriterion("ffid between", value1, value2, "ffid");
            return (Criteria) this;
        }

        public Criteria andFfidNotBetween(String value1, String value2) {
            addCriterion("ffid not between", value1, value2, "ffid");
            return (Criteria) this;
        }

        public Criteria andFcorIsNull() {
            addCriterion("fcor is null");
            return (Criteria) this;
        }

        public Criteria andFcorIsNotNull() {
            addCriterion("fcor is not null");
            return (Criteria) this;
        }

        public Criteria andFcorEqualTo(String value) {
            addCriterion("fcor =", value, "fcor");
            return (Criteria) this;
        }

        public Criteria andFcorNotEqualTo(String value) {
            addCriterion("fcor <>", value, "fcor");
            return (Criteria) this;
        }

        public Criteria andFcorGreaterThan(String value) {
            addCriterion("fcor >", value, "fcor");
            return (Criteria) this;
        }

        public Criteria andFcorGreaterThanOrEqualTo(String value) {
            addCriterion("fcor >=", value, "fcor");
            return (Criteria) this;
        }

        public Criteria andFcorLessThan(String value) {
            addCriterion("fcor <", value, "fcor");
            return (Criteria) this;
        }

        public Criteria andFcorLessThanOrEqualTo(String value) {
            addCriterion("fcor <=", value, "fcor");
            return (Criteria) this;
        }

        public Criteria andFcorLike(String value) {
            addCriterion("fcor like", value, "fcor");
            return (Criteria) this;
        }

        public Criteria andFcorNotLike(String value) {
            addCriterion("fcor not like", value, "fcor");
            return (Criteria) this;
        }

        public Criteria andFcorIn(List<String> values) {
            addCriterion("fcor in", values, "fcor");
            return (Criteria) this;
        }

        public Criteria andFcorNotIn(List<String> values) {
            addCriterion("fcor not in", values, "fcor");
            return (Criteria) this;
        }

        public Criteria andFcorBetween(String value1, String value2) {
            addCriterion("fcor between", value1, value2, "fcor");
            return (Criteria) this;
        }

        public Criteria andFcorNotBetween(String value1, String value2) {
            addCriterion("fcor not between", value1, value2, "fcor");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}