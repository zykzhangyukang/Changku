package com.coderman.changku.biz.mapper;

import com.coderman.changku.biz.modal.ProductMain;
import com.coderman.changku.biz.modal.ProductMainExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProductMainMapper {
    int countByExample(ProductMainExample example);

    int deleteByExample(ProductMainExample example);

    int deleteByPrimaryKey(String fid);

    int insert(ProductMain record);

    int insertSelective(ProductMain record);

    List<ProductMain> selectByExample(ProductMainExample example);

    ProductMain selectByPrimaryKey(String fid);

    int updateByExampleSelective(@Param("record") ProductMain record, @Param("example") ProductMainExample example);

    int updateByExample(@Param("record") ProductMain record, @Param("example") ProductMainExample example);

    int updateByPrimaryKeySelective(ProductMain record);

    int updateByPrimaryKey(ProductMain record);
}