package com.coderman.changku.biz.mapper;

import com.coderman.changku.biz.modal.ProductsOutCong;
import com.coderman.changku.biz.modal.ProductsOutCongExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ProductsOutCongMapper {
    int countByExample(ProductsOutCongExample example);

    int deleteByExample(ProductsOutCongExample example);

    int deleteByPrimaryKey(String fid);

    int insert(ProductsOutCong record);

    int insertSelective(ProductsOutCong record);

    List<ProductsOutCong> selectByExample(ProductsOutCongExample example);

    ProductsOutCong selectByPrimaryKey(String fid);

    int updateByExampleSelective(@Param("record") ProductsOutCong record, @Param("example") ProductsOutCongExample example);

    int updateByExample(@Param("record") ProductsOutCong record, @Param("example") ProductsOutCongExample example);

    int updateByPrimaryKeySelective(ProductsOutCong record);

    int updateByPrimaryKey(ProductsOutCong record);
}