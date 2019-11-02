package com.coderman.changku.biz.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * Created by zhangyukang on 2019/11/2 12:14
 */
@Mapper
public interface ProductConfigExtMapper {

    @Select(value = "SELECT DISTINCT productbrand  FROM oa_product_cong WHERE typeid=#{typeid}")
    List<String> loadAllBrandByTypeId(String typeid);

    @Select(value = "SELECT DISTINCT productmodel  FROM oa_product_cong WHERE productbrand=#{productbrand}")
    List<String> loadAllModelByBrand(String productbrand);


    @Select(value = "SELECT DISTINCT type  FROM oa_product_cong WHERE productmodel=#{productmodel}")
    List<String> loadAllTypeByModel(String productmodel);
}
