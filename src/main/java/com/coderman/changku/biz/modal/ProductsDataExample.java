package com.coderman.changku.biz.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class ProductsDataExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public ProductsDataExample() {
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

        public Criteria andMerchantnameIsNull() {
            addCriterion("MerchantName is null");
            return (Criteria) this;
        }

        public Criteria andMerchantnameIsNotNull() {
            addCriterion("MerchantName is not null");
            return (Criteria) this;
        }

        public Criteria andMerchantnameEqualTo(String value) {
            addCriterion("MerchantName =", value, "merchantname");
            return (Criteria) this;
        }

        public Criteria andMerchantnameNotEqualTo(String value) {
            addCriterion("MerchantName <>", value, "merchantname");
            return (Criteria) this;
        }

        public Criteria andMerchantnameGreaterThan(String value) {
            addCriterion("MerchantName >", value, "merchantname");
            return (Criteria) this;
        }

        public Criteria andMerchantnameGreaterThanOrEqualTo(String value) {
            addCriterion("MerchantName >=", value, "merchantname");
            return (Criteria) this;
        }

        public Criteria andMerchantnameLessThan(String value) {
            addCriterion("MerchantName <", value, "merchantname");
            return (Criteria) this;
        }

        public Criteria andMerchantnameLessThanOrEqualTo(String value) {
            addCriterion("MerchantName <=", value, "merchantname");
            return (Criteria) this;
        }

        public Criteria andMerchantnameLike(String value) {
            addCriterion("MerchantName like", value, "merchantname");
            return (Criteria) this;
        }

        public Criteria andMerchantnameNotLike(String value) {
            addCriterion("MerchantName not like", value, "merchantname");
            return (Criteria) this;
        }

        public Criteria andMerchantnameIn(List<String> values) {
            addCriterion("MerchantName in", values, "merchantname");
            return (Criteria) this;
        }

        public Criteria andMerchantnameNotIn(List<String> values) {
            addCriterion("MerchantName not in", values, "merchantname");
            return (Criteria) this;
        }

        public Criteria andMerchantnameBetween(String value1, String value2) {
            addCriterion("MerchantName between", value1, value2, "merchantname");
            return (Criteria) this;
        }

        public Criteria andMerchantnameNotBetween(String value1, String value2) {
            addCriterion("MerchantName not between", value1, value2, "merchantname");
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

        public Criteria andUnitIsNull() {
            addCriterion("unit is null");
            return (Criteria) this;
        }

        public Criteria andUnitIsNotNull() {
            addCriterion("unit is not null");
            return (Criteria) this;
        }

        public Criteria andUnitEqualTo(String value) {
            addCriterion("unit =", value, "unit");
            return (Criteria) this;
        }

        public Criteria andUnitNotEqualTo(String value) {
            addCriterion("unit <>", value, "unit");
            return (Criteria) this;
        }

        public Criteria andUnitGreaterThan(String value) {
            addCriterion("unit >", value, "unit");
            return (Criteria) this;
        }

        public Criteria andUnitGreaterThanOrEqualTo(String value) {
            addCriterion("unit >=", value, "unit");
            return (Criteria) this;
        }

        public Criteria andUnitLessThan(String value) {
            addCriterion("unit <", value, "unit");
            return (Criteria) this;
        }

        public Criteria andUnitLessThanOrEqualTo(String value) {
            addCriterion("unit <=", value, "unit");
            return (Criteria) this;
        }

        public Criteria andUnitLike(String value) {
            addCriterion("unit like", value, "unit");
            return (Criteria) this;
        }

        public Criteria andUnitNotLike(String value) {
            addCriterion("unit not like", value, "unit");
            return (Criteria) this;
        }

        public Criteria andUnitIn(List<String> values) {
            addCriterion("unit in", values, "unit");
            return (Criteria) this;
        }

        public Criteria andUnitNotIn(List<String> values) {
            addCriterion("unit not in", values, "unit");
            return (Criteria) this;
        }

        public Criteria andUnitBetween(String value1, String value2) {
            addCriterion("unit between", value1, value2, "unit");
            return (Criteria) this;
        }

        public Criteria andUnitNotBetween(String value1, String value2) {
            addCriterion("unit not between", value1, value2, "unit");
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

        public Criteria andProductspriceIsNull() {
            addCriterion("productsprice is null");
            return (Criteria) this;
        }

        public Criteria andProductspriceIsNotNull() {
            addCriterion("productsprice is not null");
            return (Criteria) this;
        }

        public Criteria andProductspriceEqualTo(BigDecimal value) {
            addCriterion("productsprice =", value, "productsprice");
            return (Criteria) this;
        }

        public Criteria andProductspriceNotEqualTo(BigDecimal value) {
            addCriterion("productsprice <>", value, "productsprice");
            return (Criteria) this;
        }

        public Criteria andProductspriceGreaterThan(BigDecimal value) {
            addCriterion("productsprice >", value, "productsprice");
            return (Criteria) this;
        }

        public Criteria andProductspriceGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("productsprice >=", value, "productsprice");
            return (Criteria) this;
        }

        public Criteria andProductspriceLessThan(BigDecimal value) {
            addCriterion("productsprice <", value, "productsprice");
            return (Criteria) this;
        }

        public Criteria andProductspriceLessThanOrEqualTo(BigDecimal value) {
            addCriterion("productsprice <=", value, "productsprice");
            return (Criteria) this;
        }

        public Criteria andProductspriceIn(List<BigDecimal> values) {
            addCriterion("productsprice in", values, "productsprice");
            return (Criteria) this;
        }

        public Criteria andProductspriceNotIn(List<BigDecimal> values) {
            addCriterion("productsprice not in", values, "productsprice");
            return (Criteria) this;
        }

        public Criteria andProductspriceBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("productsprice between", value1, value2, "productsprice");
            return (Criteria) this;
        }

        public Criteria andProductspriceNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("productsprice not between", value1, value2, "productsprice");
            return (Criteria) this;
        }

        public Criteria andAddtimeIsNull() {
            addCriterion("addtime is null");
            return (Criteria) this;
        }

        public Criteria andAddtimeIsNotNull() {
            addCriterion("addtime is not null");
            return (Criteria) this;
        }

        public Criteria andAddtimeEqualTo(String value) {
            addCriterion("addtime =", value, "addtime");
            return (Criteria) this;
        }

        public Criteria andAddtimeNotEqualTo(String value) {
            addCriterion("addtime <>", value, "addtime");
            return (Criteria) this;
        }

        public Criteria andAddtimeGreaterThan(String value) {
            addCriterion("addtime >", value, "addtime");
            return (Criteria) this;
        }

        public Criteria andAddtimeGreaterThanOrEqualTo(String value) {
            addCriterion("addtime >=", value, "addtime");
            return (Criteria) this;
        }

        public Criteria andAddtimeLessThan(String value) {
            addCriterion("addtime <", value, "addtime");
            return (Criteria) this;
        }

        public Criteria andAddtimeLessThanOrEqualTo(String value) {
            addCriterion("addtime <=", value, "addtime");
            return (Criteria) this;
        }

        public Criteria andAddtimeLike(String value) {
            addCriterion("addtime like", value, "addtime");
            return (Criteria) this;
        }

        public Criteria andAddtimeNotLike(String value) {
            addCriterion("addtime not like", value, "addtime");
            return (Criteria) this;
        }

        public Criteria andAddtimeIn(List<String> values) {
            addCriterion("addtime in", values, "addtime");
            return (Criteria) this;
        }

        public Criteria andAddtimeNotIn(List<String> values) {
            addCriterion("addtime not in", values, "addtime");
            return (Criteria) this;
        }

        public Criteria andAddtimeBetween(String value1, String value2) {
            addCriterion("addtime between", value1, value2, "addtime");
            return (Criteria) this;
        }

        public Criteria andAddtimeNotBetween(String value1, String value2) {
            addCriterion("addtime not between", value1, value2, "addtime");
            return (Criteria) this;
        }

        public Criteria andManagerIsNull() {
            addCriterion("manager is null");
            return (Criteria) this;
        }

        public Criteria andManagerIsNotNull() {
            addCriterion("manager is not null");
            return (Criteria) this;
        }

        public Criteria andManagerEqualTo(String value) {
            addCriterion("manager =", value, "manager");
            return (Criteria) this;
        }

        public Criteria andManagerNotEqualTo(String value) {
            addCriterion("manager <>", value, "manager");
            return (Criteria) this;
        }

        public Criteria andManagerGreaterThan(String value) {
            addCriterion("manager >", value, "manager");
            return (Criteria) this;
        }

        public Criteria andManagerGreaterThanOrEqualTo(String value) {
            addCriterion("manager >=", value, "manager");
            return (Criteria) this;
        }

        public Criteria andManagerLessThan(String value) {
            addCriterion("manager <", value, "manager");
            return (Criteria) this;
        }

        public Criteria andManagerLessThanOrEqualTo(String value) {
            addCriterion("manager <=", value, "manager");
            return (Criteria) this;
        }

        public Criteria andManagerLike(String value) {
            addCriterion("manager like", value, "manager");
            return (Criteria) this;
        }

        public Criteria andManagerNotLike(String value) {
            addCriterion("manager not like", value, "manager");
            return (Criteria) this;
        }

        public Criteria andManagerIn(List<String> values) {
            addCriterion("manager in", values, "manager");
            return (Criteria) this;
        }

        public Criteria andManagerNotIn(List<String> values) {
            addCriterion("manager not in", values, "manager");
            return (Criteria) this;
        }

        public Criteria andManagerBetween(String value1, String value2) {
            addCriterion("manager between", value1, value2, "manager");
            return (Criteria) this;
        }

        public Criteria andManagerNotBetween(String value1, String value2) {
            addCriterion("manager not between", value1, value2, "manager");
            return (Criteria) this;
        }

        public Criteria andOperatorIsNull() {
            addCriterion("operator is null");
            return (Criteria) this;
        }

        public Criteria andOperatorIsNotNull() {
            addCriterion("operator is not null");
            return (Criteria) this;
        }

        public Criteria andOperatorEqualTo(String value) {
            addCriterion("operator =", value, "operator");
            return (Criteria) this;
        }

        public Criteria andOperatorNotEqualTo(String value) {
            addCriterion("operator <>", value, "operator");
            return (Criteria) this;
        }

        public Criteria andOperatorGreaterThan(String value) {
            addCriterion("operator >", value, "operator");
            return (Criteria) this;
        }

        public Criteria andOperatorGreaterThanOrEqualTo(String value) {
            addCriterion("operator >=", value, "operator");
            return (Criteria) this;
        }

        public Criteria andOperatorLessThan(String value) {
            addCriterion("operator <", value, "operator");
            return (Criteria) this;
        }

        public Criteria andOperatorLessThanOrEqualTo(String value) {
            addCriterion("operator <=", value, "operator");
            return (Criteria) this;
        }

        public Criteria andOperatorLike(String value) {
            addCriterion("operator like", value, "operator");
            return (Criteria) this;
        }

        public Criteria andOperatorNotLike(String value) {
            addCriterion("operator not like", value, "operator");
            return (Criteria) this;
        }

        public Criteria andOperatorIn(List<String> values) {
            addCriterion("operator in", values, "operator");
            return (Criteria) this;
        }

        public Criteria andOperatorNotIn(List<String> values) {
            addCriterion("operator not in", values, "operator");
            return (Criteria) this;
        }

        public Criteria andOperatorBetween(String value1, String value2) {
            addCriterion("operator between", value1, value2, "operator");
            return (Criteria) this;
        }

        public Criteria andOperatorNotBetween(String value1, String value2) {
            addCriterion("operator not between", value1, value2, "operator");
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

        public Criteria andStateIsNull() {
            addCriterion("state is null");
            return (Criteria) this;
        }

        public Criteria andStateIsNotNull() {
            addCriterion("state is not null");
            return (Criteria) this;
        }

        public Criteria andStateEqualTo(Integer value) {
            addCriterion("state =", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateNotEqualTo(Integer value) {
            addCriterion("state <>", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateGreaterThan(Integer value) {
            addCriterion("state >", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateGreaterThanOrEqualTo(Integer value) {
            addCriterion("state >=", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateLessThan(Integer value) {
            addCriterion("state <", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateLessThanOrEqualTo(Integer value) {
            addCriterion("state <=", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateIn(List<Integer> values) {
            addCriterion("state in", values, "state");
            return (Criteria) this;
        }

        public Criteria andStateNotIn(List<Integer> values) {
            addCriterion("state not in", values, "state");
            return (Criteria) this;
        }

        public Criteria andStateBetween(Integer value1, Integer value2) {
            addCriterion("state between", value1, value2, "state");
            return (Criteria) this;
        }

        public Criteria andStateNotBetween(Integer value1, Integer value2) {
            addCriterion("state not between", value1, value2, "state");
            return (Criteria) this;
        }

        public Criteria andAllsumIsNull() {
            addCriterion("allsum is null");
            return (Criteria) this;
        }

        public Criteria andAllsumIsNotNull() {
            addCriterion("allsum is not null");
            return (Criteria) this;
        }

        public Criteria andAllsumEqualTo(Integer value) {
            addCriterion("allsum =", value, "allsum");
            return (Criteria) this;
        }

        public Criteria andAllsumNotEqualTo(Integer value) {
            addCriterion("allsum <>", value, "allsum");
            return (Criteria) this;
        }

        public Criteria andAllsumGreaterThan(Integer value) {
            addCriterion("allsum >", value, "allsum");
            return (Criteria) this;
        }

        public Criteria andAllsumGreaterThanOrEqualTo(Integer value) {
            addCriterion("allsum >=", value, "allsum");
            return (Criteria) this;
        }

        public Criteria andAllsumLessThan(Integer value) {
            addCriterion("allsum <", value, "allsum");
            return (Criteria) this;
        }

        public Criteria andAllsumLessThanOrEqualTo(Integer value) {
            addCriterion("allsum <=", value, "allsum");
            return (Criteria) this;
        }

        public Criteria andAllsumIn(List<Integer> values) {
            addCriterion("allsum in", values, "allsum");
            return (Criteria) this;
        }

        public Criteria andAllsumNotIn(List<Integer> values) {
            addCriterion("allsum not in", values, "allsum");
            return (Criteria) this;
        }

        public Criteria andAllsumBetween(Integer value1, Integer value2) {
            addCriterion("allsum between", value1, value2, "allsum");
            return (Criteria) this;
        }

        public Criteria andAllsumNotBetween(Integer value1, Integer value2) {
            addCriterion("allsum not between", value1, value2, "allsum");
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