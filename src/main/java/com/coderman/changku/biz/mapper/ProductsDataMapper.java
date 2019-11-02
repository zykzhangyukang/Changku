package com.coderman.changku.biz.mapper;

import com.coderman.changku.biz.modal.ProductsData;
import com.coderman.changku.biz.modal.ProductsDataExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ProductsDataMapper {
    int countByExample(ProductsDataExample example);

    int deleteByExample(ProductsDataExample example);

    int deleteByPrimaryKey(String fid);

    int insert(ProductsData record);

    int insertSelective(ProductsData record);

    List<ProductsData> selectByExample(ProductsDataExample example);

    ProductsData selectByPrimaryKey(String fid);

    int updateByExampleSelective(@Param("record") ProductsData record, @Param("example") ProductsDataExample example);

    int updateByExample(@Param("record") ProductsData record, @Param("example") ProductsDataExample example);

    int updateByPrimaryKeySelective(ProductsData record);

    int updateByPrimaryKey(ProductsData record);
}