package com.coderman.changku.biz.mapper;

import com.coderman.changku.biz.modal.ProductCong;
import com.coderman.changku.biz.modal.ProductCongExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ProductCongMapper {
    int countByExample(ProductCongExample example);

    int deleteByExample(ProductCongExample example);

    int deleteByPrimaryKey(String fid);

    int insert(ProductCong record);

    int insertSelective(ProductCong record);

    List<ProductCong> selectByExample(ProductCongExample example);

    ProductCong selectByPrimaryKey(String fid);

    int updateByExampleSelective(@Param("record") ProductCong record, @Param("example") ProductCongExample example);

    int updateByExample(@Param("record") ProductCong record, @Param("example") ProductCongExample example);

    int updateByPrimaryKeySelective(ProductCong record);

    int updateByPrimaryKey(ProductCong record);
}