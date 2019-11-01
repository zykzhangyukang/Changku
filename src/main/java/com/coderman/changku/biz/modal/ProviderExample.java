package com.coderman.changku.biz.modal;

import java.util.ArrayList;
import java.util.List;

public class ProviderExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public ProviderExample() {
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

        public Criteria andMerchantnoIsNull() {
            addCriterion("MerchantNo is null");
            return (Criteria) this;
        }

        public Criteria andMerchantnoIsNotNull() {
            addCriterion("MerchantNo is not null");
            return (Criteria) this;
        }

        public Criteria andMerchantnoEqualTo(Integer value) {
            addCriterion("MerchantNo =", value, "merchantno");
            return (Criteria) this;
        }

        public Criteria andMerchantnoNotEqualTo(Integer value) {
            addCriterion("MerchantNo <>", value, "merchantno");
            return (Criteria) this;
        }

        public Criteria andMerchantnoGreaterThan(Integer value) {
            addCriterion("MerchantNo >", value, "merchantno");
            return (Criteria) this;
        }

        public Criteria andMerchantnoGreaterThanOrEqualTo(Integer value) {
            addCriterion("MerchantNo >=", value, "merchantno");
            return (Criteria) this;
        }

        public Criteria andMerchantnoLessThan(Integer value) {
            addCriterion("MerchantNo <", value, "merchantno");
            return (Criteria) this;
        }

        public Criteria andMerchantnoLessThanOrEqualTo(Integer value) {
            addCriterion("MerchantNo <=", value, "merchantno");
            return (Criteria) this;
        }

        public Criteria andMerchantnoIn(List<Integer> values) {
            addCriterion("MerchantNo in", values, "merchantno");
            return (Criteria) this;
        }

        public Criteria andMerchantnoNotIn(List<Integer> values) {
            addCriterion("MerchantNo not in", values, "merchantno");
            return (Criteria) this;
        }

        public Criteria andMerchantnoBetween(Integer value1, Integer value2) {
            addCriterion("MerchantNo between", value1, value2, "merchantno");
            return (Criteria) this;
        }

        public Criteria andMerchantnoNotBetween(Integer value1, Integer value2) {
            addCriterion("MerchantNo not between", value1, value2, "merchantno");
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

        public Criteria andMerchanttellIsNull() {
            addCriterion("MerchantTell is null");
            return (Criteria) this;
        }

        public Criteria andMerchanttellIsNotNull() {
            addCriterion("MerchantTell is not null");
            return (Criteria) this;
        }

        public Criteria andMerchanttellEqualTo(String value) {
            addCriterion("MerchantTell =", value, "merchanttell");
            return (Criteria) this;
        }

        public Criteria andMerchanttellNotEqualTo(String value) {
            addCriterion("MerchantTell <>", value, "merchanttell");
            return (Criteria) this;
        }

        public Criteria andMerchanttellGreaterThan(String value) {
            addCriterion("MerchantTell >", value, "merchanttell");
            return (Criteria) this;
        }

        public Criteria andMerchanttellGreaterThanOrEqualTo(String value) {
            addCriterion("MerchantTell >=", value, "merchanttell");
            return (Criteria) this;
        }

        public Criteria andMerchanttellLessThan(String value) {
            addCriterion("MerchantTell <", value, "merchanttell");
            return (Criteria) this;
        }

        public Criteria andMerchanttellLessThanOrEqualTo(String value) {
            addCriterion("MerchantTell <=", value, "merchanttell");
            return (Criteria) this;
        }

        public Criteria andMerchanttellLike(String value) {
            addCriterion("MerchantTell like", value, "merchanttell");
            return (Criteria) this;
        }

        public Criteria andMerchanttellNotLike(String value) {
            addCriterion("MerchantTell not like", value, "merchanttell");
            return (Criteria) this;
        }

        public Criteria andMerchanttellIn(List<String> values) {
            addCriterion("MerchantTell in", values, "merchanttell");
            return (Criteria) this;
        }

        public Criteria andMerchanttellNotIn(List<String> values) {
            addCriterion("MerchantTell not in", values, "merchanttell");
            return (Criteria) this;
        }

        public Criteria andMerchanttellBetween(String value1, String value2) {
            addCriterion("MerchantTell between", value1, value2, "merchanttell");
            return (Criteria) this;
        }

        public Criteria andMerchanttellNotBetween(String value1, String value2) {
            addCriterion("MerchantTell not between", value1, value2, "merchanttell");
            return (Criteria) this;
        }

        public Criteria andMerchantpersonIsNull() {
            addCriterion("Merchantperson is null");
            return (Criteria) this;
        }

        public Criteria andMerchantpersonIsNotNull() {
            addCriterion("Merchantperson is not null");
            return (Criteria) this;
        }

        public Criteria andMerchantpersonEqualTo(String value) {
            addCriterion("Merchantperson =", value, "merchantperson");
            return (Criteria) this;
        }

        public Criteria andMerchantpersonNotEqualTo(String value) {
            addCriterion("Merchantperson <>", value, "merchantperson");
            return (Criteria) this;
        }

        public Criteria andMerchantpersonGreaterThan(String value) {
            addCriterion("Merchantperson >", value, "merchantperson");
            return (Criteria) this;
        }

        public Criteria andMerchantpersonGreaterThanOrEqualTo(String value) {
            addCriterion("Merchantperson >=", value, "merchantperson");
            return (Criteria) this;
        }

        public Criteria andMerchantpersonLessThan(String value) {
            addCriterion("Merchantperson <", value, "merchantperson");
            return (Criteria) this;
        }

        public Criteria andMerchantpersonLessThanOrEqualTo(String value) {
            addCriterion("Merchantperson <=", value, "merchantperson");
            return (Criteria) this;
        }

        public Criteria andMerchantpersonLike(String value) {
            addCriterion("Merchantperson like", value, "merchantperson");
            return (Criteria) this;
        }

        public Criteria andMerchantpersonNotLike(String value) {
            addCriterion("Merchantperson not like", value, "merchantperson");
            return (Criteria) this;
        }

        public Criteria andMerchantpersonIn(List<String> values) {
            addCriterion("Merchantperson in", values, "merchantperson");
            return (Criteria) this;
        }

        public Criteria andMerchantpersonNotIn(List<String> values) {
            addCriterion("Merchantperson not in", values, "merchantperson");
            return (Criteria) this;
        }

        public Criteria andMerchantpersonBetween(String value1, String value2) {
            addCriterion("Merchantperson between", value1, value2, "merchantperson");
            return (Criteria) this;
        }

        public Criteria andMerchantpersonNotBetween(String value1, String value2) {
            addCriterion("Merchantperson not between", value1, value2, "merchantperson");
            return (Criteria) this;
        }

        public Criteria andShIsNull() {
            addCriterion("sh is null");
            return (Criteria) this;
        }

        public Criteria andShIsNotNull() {
            addCriterion("sh is not null");
            return (Criteria) this;
        }

        public Criteria andShEqualTo(String value) {
            addCriterion("sh =", value, "sh");
            return (Criteria) this;
        }

        public Criteria andShNotEqualTo(String value) {
            addCriterion("sh <>", value, "sh");
            return (Criteria) this;
        }

        public Criteria andShGreaterThan(String value) {
            addCriterion("sh >", value, "sh");
            return (Criteria) this;
        }

        public Criteria andShGreaterThanOrEqualTo(String value) {
            addCriterion("sh >=", value, "sh");
            return (Criteria) this;
        }

        public Criteria andShLessThan(String value) {
            addCriterion("sh <", value, "sh");
            return (Criteria) this;
        }

        public Criteria andShLessThanOrEqualTo(String value) {
            addCriterion("sh <=", value, "sh");
            return (Criteria) this;
        }

        public Criteria andShLike(String value) {
            addCriterion("sh like", value, "sh");
            return (Criteria) this;
        }

        public Criteria andShNotLike(String value) {
            addCriterion("sh not like", value, "sh");
            return (Criteria) this;
        }

        public Criteria andShIn(List<String> values) {
            addCriterion("sh in", values, "sh");
            return (Criteria) this;
        }

        public Criteria andShNotIn(List<String> values) {
            addCriterion("sh not in", values, "sh");
            return (Criteria) this;
        }

        public Criteria andShBetween(String value1, String value2) {
            addCriterion("sh between", value1, value2, "sh");
            return (Criteria) this;
        }

        public Criteria andShNotBetween(String value1, String value2) {
            addCriterion("sh not between", value1, value2, "sh");
            return (Criteria) this;
        }

        public Criteria andBankIsNull() {
            addCriterion("bank is null");
            return (Criteria) this;
        }

        public Criteria andBankIsNotNull() {
            addCriterion("bank is not null");
            return (Criteria) this;
        }

        public Criteria andBankEqualTo(String value) {
            addCriterion("bank =", value, "bank");
            return (Criteria) this;
        }

        public Criteria andBankNotEqualTo(String value) {
            addCriterion("bank <>", value, "bank");
            return (Criteria) this;
        }

        public Criteria andBankGreaterThan(String value) {
            addCriterion("bank >", value, "bank");
            return (Criteria) this;
        }

        public Criteria andBankGreaterThanOrEqualTo(String value) {
            addCriterion("bank >=", value, "bank");
            return (Criteria) this;
        }

        public Criteria andBankLessThan(String value) {
            addCriterion("bank <", value, "bank");
            return (Criteria) this;
        }

        public Criteria andBankLessThanOrEqualTo(String value) {
            addCriterion("bank <=", value, "bank");
            return (Criteria) this;
        }

        public Criteria andBankLike(String value) {
            addCriterion("bank like", value, "bank");
            return (Criteria) this;
        }

        public Criteria andBankNotLike(String value) {
            addCriterion("bank not like", value, "bank");
            return (Criteria) this;
        }

        public Criteria andBankIn(List<String> values) {
            addCriterion("bank in", values, "bank");
            return (Criteria) this;
        }

        public Criteria andBankNotIn(List<String> values) {
            addCriterion("bank not in", values, "bank");
            return (Criteria) this;
        }

        public Criteria andBankBetween(String value1, String value2) {
            addCriterion("bank between", value1, value2, "bank");
            return (Criteria) this;
        }

        public Criteria andBankNotBetween(String value1, String value2) {
            addCriterion("bank not between", value1, value2, "bank");
            return (Criteria) this;
        }

        public Criteria andBankcardIsNull() {
            addCriterion("bankcard is null");
            return (Criteria) this;
        }

        public Criteria andBankcardIsNotNull() {
            addCriterion("bankcard is not null");
            return (Criteria) this;
        }

        public Criteria andBankcardEqualTo(String value) {
            addCriterion("bankcard =", value, "bankcard");
            return (Criteria) this;
        }

        public Criteria andBankcardNotEqualTo(String value) {
            addCriterion("bankcard <>", value, "bankcard");
            return (Criteria) this;
        }

        public Criteria andBankcardGreaterThan(String value) {
            addCriterion("bankcard >", value, "bankcard");
            return (Criteria) this;
        }

        public Criteria andBankcardGreaterThanOrEqualTo(String value) {
            addCriterion("bankcard >=", value, "bankcard");
            return (Criteria) this;
        }

        public Criteria andBankcardLessThan(String value) {
            addCriterion("bankcard <", value, "bankcard");
            return (Criteria) this;
        }

        public Criteria andBankcardLessThanOrEqualTo(String value) {
            addCriterion("bankcard <=", value, "bankcard");
            return (Criteria) this;
        }

        public Criteria andBankcardLike(String value) {
            addCriterion("bankcard like", value, "bankcard");
            return (Criteria) this;
        }

        public Criteria andBankcardNotLike(String value) {
            addCriterion("bankcard not like", value, "bankcard");
            return (Criteria) this;
        }

        public Criteria andBankcardIn(List<String> values) {
            addCriterion("bankcard in", values, "bankcard");
            return (Criteria) this;
        }

        public Criteria andBankcardNotIn(List<String> values) {
            addCriterion("bankcard not in", values, "bankcard");
            return (Criteria) this;
        }

        public Criteria andBankcardBetween(String value1, String value2) {
            addCriterion("bankcard between", value1, value2, "bankcard");
            return (Criteria) this;
        }

        public Criteria andBankcardNotBetween(String value1, String value2) {
            addCriterion("bankcard not between", value1, value2, "bankcard");
            return (Criteria) this;
        }

        public Criteria andAddressIsNull() {
            addCriterion("address is null");
            return (Criteria) this;
        }

        public Criteria andAddressIsNotNull() {
            addCriterion("address is not null");
            return (Criteria) this;
        }

        public Criteria andAddressEqualTo(String value) {
            addCriterion("address =", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressNotEqualTo(String value) {
            addCriterion("address <>", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressGreaterThan(String value) {
            addCriterion("address >", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressGreaterThanOrEqualTo(String value) {
            addCriterion("address >=", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressLessThan(String value) {
            addCriterion("address <", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressLessThanOrEqualTo(String value) {
            addCriterion("address <=", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressLike(String value) {
            addCriterion("address like", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressNotLike(String value) {
            addCriterion("address not like", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressIn(List<String> values) {
            addCriterion("address in", values, "address");
            return (Criteria) this;
        }

        public Criteria andAddressNotIn(List<String> values) {
            addCriterion("address not in", values, "address");
            return (Criteria) this;
        }

        public Criteria andAddressBetween(String value1, String value2) {
            addCriterion("address between", value1, value2, "address");
            return (Criteria) this;
        }

        public Criteria andAddressNotBetween(String value1, String value2) {
            addCriterion("address not between", value1, value2, "address");
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