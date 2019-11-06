package com.coderman.changku.biz.mapper;

import com.coderman.changku.biz.modal.ProductsOutmain;
import com.coderman.changku.biz.modal.ProductsOutmainExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ProductsOutmainMapper {
    int countByExample(ProductsOutmainExample example);

    int deleteByExample(ProductsOutmainExample example);

    int deleteByPrimaryKey(String fid);

    int insert(ProductsOutmain record);

    int insertSelective(ProductsOutmain record);

    List<ProductsOutmain> selectByExample(ProductsOutmainExample example);

    ProductsOutmain selectByPrimaryKey(String fid);

    int updateByExampleSelective(@Param("record") ProductsOutmain record, @Param("example") ProductsOutmainExample example);

    int updateByExample(@Param("record") ProductsOutmain record, @Param("example") ProductsOutmainExample example);

    int updateByPrimaryKeySelective(ProductsOutmain record);

    int updateByPrimaryKey(ProductsOutmain record);
}