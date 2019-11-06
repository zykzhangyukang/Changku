package com.coderman.changku.biz.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ProductsOutmainExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public ProductsOutmainExample() {
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

        public Criteria andCustomernameIsNull() {
            addCriterion("CustomerName is null");
            return (Criteria) this;
        }

        public Criteria andCustomernameIsNotNull() {
            addCriterion("CustomerName is not null");
            return (Criteria) this;
        }

        public Criteria andCustomernameEqualTo(String value) {
            addCriterion("CustomerName =", value, "customername");
            return (Criteria) this;
        }

        public Criteria andCustomernameNotEqualTo(String value) {
            addCriterion("CustomerName <>", value, "customername");
            return (Criteria) this;
        }

        public Criteria andCustomernameGreaterThan(String value) {
            addCriterion("CustomerName >", value, "customername");
            return (Criteria) this;
        }

        public Criteria andCustomernameGreaterThanOrEqualTo(String value) {
            addCriterion("CustomerName >=", value, "customername");
            return (Criteria) this;
        }

        public Criteria andCustomernameLessThan(String value) {
            addCriterion("CustomerName <", value, "customername");
            return (Criteria) this;
        }

        public Criteria andCustomernameLessThanOrEqualTo(String value) {
            addCriterion("CustomerName <=", value, "customername");
            return (Criteria) this;
        }

        public Criteria andCustomernameLike(String value) {
            addCriterion("CustomerName like", value, "customername");
            return (Criteria) this;
        }

        public Criteria andCustomernameNotLike(String value) {
            addCriterion("CustomerName not like", value, "customername");
            return (Criteria) this;
        }

        public Criteria andCustomernameIn(List<String> values) {
            addCriterion("CustomerName in", values, "customername");
            return (Criteria) this;
        }

        public Criteria andCustomernameNotIn(List<String> values) {
            addCriterion("CustomerName not in", values, "customername");
            return (Criteria) this;
        }

        public Criteria andCustomernameBetween(String value1, String value2) {
            addCriterion("CustomerName between", value1, value2, "customername");
            return (Criteria) this;
        }

        public Criteria andCustomernameNotBetween(String value1, String value2) {
            addCriterion("CustomerName not between", value1, value2, "customername");
            return (Criteria) this;
        }

        public Criteria andCustomertellIsNull() {
            addCriterion("CustomerTell is null");
            return (Criteria) this;
        }

        public Criteria andCustomertellIsNotNull() {
            addCriterion("CustomerTell is not null");
            return (Criteria) this;
        }

        public Criteria andCustomertellEqualTo(String value) {
            addCriterion("CustomerTell =", value, "customertell");
            return (Criteria) this;
        }

        public Criteria andCustomertellNotEqualTo(String value) {
            addCriterion("CustomerTell <>", value, "customertell");
            return (Criteria) this;
        }

        public Criteria andCustomertellGreaterThan(String value) {
            addCriterion("CustomerTell >", value, "customertell");
            return (Criteria) this;
        }

        public Criteria andCustomertellGreaterThanOrEqualTo(String value) {
            addCriterion("CustomerTell >=", value, "customertell");
            return (Criteria) this;
        }

        public Criteria andCustomertellLessThan(String value) {
            addCriterion("CustomerTell <", value, "customertell");
            return (Criteria) this;
        }

        public Criteria andCustomertellLessThanOrEqualTo(String value) {
            addCriterion("CustomerTell <=", value, "customertell");
            return (Criteria) this;
        }

        public Criteria andCustomertellLike(String value) {
            addCriterion("CustomerTell like", value, "customertell");
            return (Criteria) this;
        }

        public Criteria andCustomertellNotLike(String value) {
            addCriterion("CustomerTell not like", value, "customertell");
            return (Criteria) this;
        }

        public Criteria andCustomertellIn(List<String> values) {
            addCriterion("CustomerTell in", values, "customertell");
            return (Criteria) this;
        }

        public Criteria andCustomertellNotIn(List<String> values) {
            addCriterion("CustomerTell not in", values, "customertell");
            return (Criteria) this;
        }

        public Criteria andCustomertellBetween(String value1, String value2) {
            addCriterion("CustomerTell between", value1, value2, "customertell");
            return (Criteria) this;
        }

        public Criteria andCustomertellNotBetween(String value1, String value2) {
            addCriterion("CustomerTell not between", value1, value2, "customertell");
            return (Criteria) this;
        }

        public Criteria andCarpinpaiIsNull() {
            addCriterion("CarPinPai is null");
            return (Criteria) this;
        }

        public Criteria andCarpinpaiIsNotNull() {
            addCriterion("CarPinPai is not null");
            return (Criteria) this;
        }

        public Criteria andCarpinpaiEqualTo(String value) {
            addCriterion("CarPinPai =", value, "carpinpai");
            return (Criteria) this;
        }

        public Criteria andCarpinpaiNotEqualTo(String value) {
            addCriterion("CarPinPai <>", value, "carpinpai");
            return (Criteria) this;
        }

        public Criteria andCarpinpaiGreaterThan(String value) {
            addCriterion("CarPinPai >", value, "carpinpai");
            return (Criteria) this;
        }

        public Criteria andCarpinpaiGreaterThanOrEqualTo(String value) {
            addCriterion("CarPinPai >=", value, "carpinpai");
            return (Criteria) this;
        }

        public Criteria andCarpinpaiLessThan(String value) {
            addCriterion("CarPinPai <", value, "carpinpai");
            return (Criteria) this;
        }

        public Criteria andCarpinpaiLessThanOrEqualTo(String value) {
            addCriterion("CarPinPai <=", value, "carpinpai");
            return (Criteria) this;
        }

        public Criteria andCarpinpaiLike(String value) {
            addCriterion("CarPinPai like", value, "carpinpai");
            return (Criteria) this;
        }

        public Criteria andCarpinpaiNotLike(String value) {
            addCriterion("CarPinPai not like", value, "carpinpai");
            return (Criteria) this;
        }

        public Criteria andCarpinpaiIn(List<String> values) {
            addCriterion("CarPinPai in", values, "carpinpai");
            return (Criteria) this;
        }

        public Criteria andCarpinpaiNotIn(List<String> values) {
            addCriterion("CarPinPai not in", values, "carpinpai");
            return (Criteria) this;
        }

        public Criteria andCarpinpaiBetween(String value1, String value2) {
            addCriterion("CarPinPai between", value1, value2, "carpinpai");
            return (Criteria) this;
        }

        public Criteria andCarpinpaiNotBetween(String value1, String value2) {
            addCriterion("CarPinPai not between", value1, value2, "carpinpai");
            return (Criteria) this;
        }

        public Criteria andCartypeIsNull() {
            addCriterion("CarType is null");
            return (Criteria) this;
        }

        public Criteria andCartypeIsNotNull() {
            addCriterion("CarType is not null");
            return (Criteria) this;
        }

        public Criteria andCartypeEqualTo(String value) {
            addCriterion("CarType =", value, "cartype");
            return (Criteria) this;
        }

        public Criteria andCartypeNotEqualTo(String value) {
            addCriterion("CarType <>", value, "cartype");
            return (Criteria) this;
        }

        public Criteria andCartypeGreaterThan(String value) {
            addCriterion("CarType >", value, "cartype");
            return (Criteria) this;
        }

        public Criteria andCartypeGreaterThanOrEqualTo(String value) {
            addCriterion("CarType >=", value, "cartype");
            return (Criteria) this;
        }

        public Criteria andCartypeLessThan(String value) {
            addCriterion("CarType <", value, "cartype");
            return (Criteria) this;
        }

        public Criteria andCartypeLessThanOrEqualTo(String value) {
            addCriterion("CarType <=", value, "cartype");
            return (Criteria) this;
        }

        public Criteria andCartypeLike(String value) {
            addCriterion("CarType like", value, "cartype");
            return (Criteria) this;
        }

        public Criteria andCartypeNotLike(String value) {
            addCriterion("CarType not like", value, "cartype");
            return (Criteria) this;
        }

        public Criteria andCartypeIn(List<String> values) {
            addCriterion("CarType in", values, "cartype");
            return (Criteria) this;
        }

        public Criteria andCartypeNotIn(List<String> values) {
            addCriterion("CarType not in", values, "cartype");
            return (Criteria) this;
        }

        public Criteria andCartypeBetween(String value1, String value2) {
            addCriterion("CarType between", value1, value2, "cartype");
            return (Criteria) this;
        }

        public Criteria andCartypeNotBetween(String value1, String value2) {
            addCriterion("CarType not between", value1, value2, "cartype");
            return (Criteria) this;
        }

        public Criteria andCarnoIsNull() {
            addCriterion("CarNo is null");
            return (Criteria) this;
        }

        public Criteria andCarnoIsNotNull() {
            addCriterion("CarNo is not null");
            return (Criteria) this;
        }

        public Criteria andCarnoEqualTo(String value) {
            addCriterion("CarNo =", value, "carno");
            return (Criteria) this;
        }

        public Criteria andCarnoNotEqualTo(String value) {
            addCriterion("CarNo <>", value, "carno");
            return (Criteria) this;
        }

        public Criteria andCarnoGreaterThan(String value) {
            addCriterion("CarNo >", value, "carno");
            return (Criteria) this;
        }

        public Criteria andCarnoGreaterThanOrEqualTo(String value) {
            addCriterion("CarNo >=", value, "carno");
            return (Criteria) this;
        }

        public Criteria andCarnoLessThan(String value) {
            addCriterion("CarNo <", value, "carno");
            return (Criteria) this;
        }

        public Criteria andCarnoLessThanOrEqualTo(String value) {
            addCriterion("CarNo <=", value, "carno");
            return (Criteria) this;
        }

        public Criteria andCarnoLike(String value) {
            addCriterion("CarNo like", value, "carno");
            return (Criteria) this;
        }

        public Criteria andCarnoNotLike(String value) {
            addCriterion("CarNo not like", value, "carno");
            return (Criteria) this;
        }

        public Criteria andCarnoIn(List<String> values) {
            addCriterion("CarNo in", values, "carno");
            return (Criteria) this;
        }

        public Criteria andCarnoNotIn(List<String> values) {
            addCriterion("CarNo not in", values, "carno");
            return (Criteria) this;
        }

        public Criteria andCarnoBetween(String value1, String value2) {
            addCriterion("CarNo between", value1, value2, "carno");
            return (Criteria) this;
        }

        public Criteria andCarnoNotBetween(String value1, String value2) {
            addCriterion("CarNo not between", value1, value2, "carno");
            return (Criteria) this;
        }

        public Criteria andCardistanceIsNull() {
            addCriterion("CarDistance is null");
            return (Criteria) this;
        }

        public Criteria andCardistanceIsNotNull() {
            addCriterion("CarDistance is not null");
            return (Criteria) this;
        }

        public Criteria andCardistanceEqualTo(Double value) {
            addCriterion("CarDistance =", value, "cardistance");
            return (Criteria) this;
        }

        public Criteria andCardistanceNotEqualTo(Double value) {
            addCriterion("CarDistance <>", value, "cardistance");
            return (Criteria) this;
        }

        public Criteria andCardistanceGreaterThan(Double value) {
            addCriterion("CarDistance >", value, "cardistance");
            return (Criteria) this;
        }

        public Criteria andCardistanceGreaterThanOrEqualTo(Double value) {
            addCriterion("CarDistance >=", value, "cardistance");
            return (Criteria) this;
        }

        public Criteria andCardistanceLessThan(Double value) {
            addCriterion("CarDistance <", value, "cardistance");
            return (Criteria) this;
        }

        public Criteria andCardistanceLessThanOrEqualTo(Double value) {
            addCriterion("CarDistance <=", value, "cardistance");
            return (Criteria) this;
        }

        public Criteria andCardistanceIn(List<Double> values) {
            addCriterion("CarDistance in", values, "cardistance");
            return (Criteria) this;
        }

        public Criteria andCardistanceNotIn(List<Double> values) {
            addCriterion("CarDistance not in", values, "cardistance");
            return (Criteria) this;
        }

        public Criteria andCardistanceBetween(Double value1, Double value2) {
            addCriterion("CarDistance between", value1, value2, "cardistance");
            return (Criteria) this;
        }

        public Criteria andCardistanceNotBetween(Double value1, Double value2) {
            addCriterion("CarDistance not between", value1, value2, "cardistance");
            return (Criteria) this;
        }

        public Criteria andMoneyIsNull() {
            addCriterion("Money is null");
            return (Criteria) this;
        }

        public Criteria andMoneyIsNotNull() {
            addCriterion("Money is not null");
            return (Criteria) this;
        }

        public Criteria andMoneyEqualTo(Integer value) {
            addCriterion("Money =", value, "money");
            return (Criteria) this;
        }

        public Criteria andMoneyNotEqualTo(Integer value) {
            addCriterion("Money <>", value, "money");
            return (Criteria) this;
        }

        public Criteria andMoneyGreaterThan(Integer value) {
            addCriterion("Money >", value, "money");
            return (Criteria) this;
        }

        public Criteria andMoneyGreaterThanOrEqualTo(Integer value) {
            addCriterion("Money >=", value, "money");
            return (Criteria) this;
        }

        public Criteria andMoneyLessThan(Integer value) {
            addCriterion("Money <", value, "money");
            return (Criteria) this;
        }

        public Criteria andMoneyLessThanOrEqualTo(Integer value) {
            addCriterion("Money <=", value, "money");
            return (Criteria) this;
        }

        public Criteria andMoneyIn(List<Integer> values) {
            addCriterion("Money in", values, "money");
            return (Criteria) this;
        }

        public Criteria andMoneyNotIn(List<Integer> values) {
            addCriterion("Money not in", values, "money");
            return (Criteria) this;
        }

        public Criteria andMoneyBetween(Integer value1, Integer value2) {
            addCriterion("Money between", value1, value2, "money");
            return (Criteria) this;
        }

        public Criteria andMoneyNotBetween(Integer value1, Integer value2) {
            addCriterion("Money not between", value1, value2, "money");
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

        public Criteria andAllsumEqualTo(BigDecimal value) {
            addCriterion("allsum =", value, "allsum");
            return (Criteria) this;
        }

        public Criteria andAllsumNotEqualTo(BigDecimal value) {
            addCriterion("allsum <>", value, "allsum");
            return (Criteria) this;
        }

        public Criteria andAllsumGreaterThan(BigDecimal value) {
            addCriterion("allsum >", value, "allsum");
            return (Criteria) this;
        }

        public Criteria andAllsumGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("allsum >=", value, "allsum");
            return (Criteria) this;
        }

        public Criteria andAllsumLessThan(BigDecimal value) {
            addCriterion("allsum <", value, "allsum");
            return (Criteria) this;
        }

        public Criteria andAllsumLessThanOrEqualTo(BigDecimal value) {
            addCriterion("allsum <=", value, "allsum");
            return (Criteria) this;
        }

        public Criteria andAllsumIn(List<BigDecimal> values) {
            addCriterion("allsum in", values, "allsum");
            return (Criteria) this;
        }

        public Criteria andAllsumNotIn(List<BigDecimal> values) {
            addCriterion("allsum not in", values, "allsum");
            return (Criteria) this;
        }

        public Criteria andAllsumBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("allsum between", value1, value2, "allsum");
            return (Criteria) this;
        }

        public Criteria andAllsumNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("allsum not between", value1, value2, "allsum");
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

        public Criteria andAddtimeIsNull() {
            addCriterion("addtime is null");
            return (Criteria) this;
        }

        public Criteria andAddtimeIsNotNull() {
            addCriterion("addtime is not null");
            return (Criteria) this;
        }

        public Criteria andAddtimeEqualTo(Date value) {
            addCriterion("addtime =", value, "addtime");
            return (Criteria) this;
        }

        public Criteria andAddtimeNotEqualTo(Date value) {
            addCriterion("addtime <>", value, "addtime");
            return (Criteria) this;
        }

        public Criteria andAddtimeGreaterThan(Date value) {
            addCriterion("addtime >", value, "addtime");
            return (Criteria) this;
        }

        public Criteria andAddtimeGreaterThanOrEqualTo(Date value) {
            addCriterion("addtime >=", value, "addtime");
            return (Criteria) this;
        }

        public Criteria andAddtimeLessThan(Date value) {
            addCriterion("addtime <", value, "addtime");
            return (Criteria) this;
        }

        public Criteria andAddtimeLessThanOrEqualTo(Date value) {
            addCriterion("addtime <=", value, "addtime");
            return (Criteria) this;
        }

        public Criteria andAddtimeIn(List<Date> values) {
            addCriterion("addtime in", values, "addtime");
            return (Criteria) this;
        }

        public Criteria andAddtimeNotIn(List<Date> values) {
            addCriterion("addtime not in", values, "addtime");
            return (Criteria) this;
        }

        public Criteria andAddtimeBetween(Date value1, Date value2) {
            addCriterion("addtime between", value1, value2, "addtime");
            return (Criteria) this;
        }

        public Criteria andAddtimeNotBetween(Date value1, Date value2) {
            addCriterion("addtime not between", value1, value2, "addtime");
            return (Criteria) this;
        }

        public Criteria andRemarkIsNull() {
            addCriterion("remark is null");
            return (Criteria) this;
        }

        public Criteria andRemarkIsNotNull() {
            addCriterion("remark is not null");
            return (Criteria) this;
        }

        public Criteria andRemarkEqualTo(String value) {
            addCriterion("remark =", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkNotEqualTo(String value) {
            addCriterion("remark <>", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkGreaterThan(String value) {
            addCriterion("remark >", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkGreaterThanOrEqualTo(String value) {
            addCriterion("remark >=", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkLessThan(String value) {
            addCriterion("remark <", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkLessThanOrEqualTo(String value) {
            addCriterion("remark <=", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkLike(String value) {
            addCriterion("remark like", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkNotLike(String value) {
            addCriterion("remark not like", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkIn(List<String> values) {
            addCriterion("remark in", values, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkNotIn(List<String> values) {
            addCriterion("remark not in", values, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkBetween(String value1, String value2) {
            addCriterion("remark between", value1, value2, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkNotBetween(String value1, String value2) {
            addCriterion("remark not between", value1, value2, "remark");
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

        public Criteria andMyallsumIsNull() {
            addCriterion("myallsum is null");
            return (Criteria) this;
        }

        public Criteria andMyallsumIsNotNull() {
            addCriterion("myallsum is not null");
            return (Criteria) this;
        }

        public Criteria andMyallsumEqualTo(BigDecimal value) {
            addCriterion("myallsum =", value, "myallsum");
            return (Criteria) this;
        }

        public Criteria andMyallsumNotEqualTo(BigDecimal value) {
            addCriterion("myallsum <>", value, "myallsum");
            return (Criteria) this;
        }

        public Criteria andMyallsumGreaterThan(BigDecimal value) {
            addCriterion("myallsum >", value, "myallsum");
            return (Criteria) this;
        }

        public Criteria andMyallsumGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("myallsum >=", value, "myallsum");
            return (Criteria) this;
        }

        public Criteria andMyallsumLessThan(BigDecimal value) {
            addCriterion("myallsum <", value, "myallsum");
            return (Criteria) this;
        }

        public Criteria andMyallsumLessThanOrEqualTo(BigDecimal value) {
            addCriterion("myallsum <=", value, "myallsum");
            return (Criteria) this;
        }

        public Criteria andMyallsumIn(List<BigDecimal> values) {
            addCriterion("myallsum in", values, "myallsum");
            return (Criteria) this;
        }

        public Criteria andMyallsumNotIn(List<BigDecimal> values) {
            addCriterion("myallsum not in", values, "myallsum");
            return (Criteria) this;
        }

        public Criteria andMyallsumBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("myallsum between", value1, value2, "myallsum");
            return (Criteria) this;
        }

        public Criteria andMyallsumNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("myallsum not between", value1, value2, "myallsum");
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