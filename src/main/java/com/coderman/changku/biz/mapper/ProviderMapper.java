package com.coderman.changku.biz.mapper;

import com.coderman.changku.biz.modal.Provider;
import com.coderman.changku.biz.modal.ProviderExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ProviderMapper {
    int countByExample(ProviderExample example);

    int deleteByExample(ProviderExample example);

    int deleteByPrimaryKey(String fid);

    int insert(Provider record);

    int insertSelective(Provider record);

    List<Provider> selectByExample(ProviderExample example);

    Provider selectByPrimaryKey(String fid);

    int updateByExampleSelective(@Param("record") Provider record, @Param("example") ProviderExample example);

    int updateByExample(@Param("record") Provider record, @Param("example") ProviderExample example);

    int updateByPrimaryKeySelective(Provider record);

    int updateByPrimaryKey(Provider record);
}