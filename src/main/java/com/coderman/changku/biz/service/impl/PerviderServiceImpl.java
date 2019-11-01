package com.coderman.changku.biz.service.impl;

import com.coderman.changku.biz.commons.BizPage;
import com.coderman.changku.biz.mapper.ProviderMapper;
import com.coderman.changku.biz.modal.Provider;
import com.coderman.changku.biz.modal.ProviderExample;
import com.coderman.changku.biz.service.ProviderService;
import com.coderman.changku.biz.vo.ProviderVo;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by zhangyukang on 2019/11/1 19:52
 */
@Service
public class PerviderServiceImpl implements ProviderService {

    @Autowired
    private ProviderMapper ProviderMapper;

    @Override
    public BizPage<Provider> findPage(ProviderVo ProviderVo, Integer pageNo, Integer pageSize) {
        PageHelper.startPage(pageNo,pageSize);
        ProviderExample ProviderExample = createProviderExample(ProviderVo);
        List<Provider> Providers = ProviderMapper.selectByExample(ProviderExample);
        Page<Provider> ProviderPage= (Page<Provider>) Providers;
        return new BizPage<>(ProviderPage.getTotal(),ProviderPage.getResult());
    }

    /**
     * 封装查询对象
     * @param ProviderVo
     * @return
     */
    private ProviderExample createProviderExample(ProviderVo ProviderVo) {
        ProviderExample ProviderExample = new ProviderExample();
        ProviderExample.Criteria criteria = ProviderExample.createCriteria();
        if(ProviderVo!=null){
            if(ProviderVo.getMerchantname()!=null&&!"".equals(ProviderVo.getMerchantname())){
                criteria.andMerchantnameLike("%"+ProviderVo.getMerchantname()+"%");
            }
            if(ProviderVo.getAddress()!=null&&!"".equals(ProviderVo.getAddress())){
                criteria.andAddressLike("%"+ProviderVo.getAddress()+"%");
            }
            if(ProviderVo.getAddress()!=null&&!"".equals(ProviderVo.getAddress())){
                criteria.andAddressLike("%"+ProviderVo.getAddress()+"%");
            }
            if(ProviderVo.getMerchanttell()!=null&&!"".equals(ProviderVo.getMerchanttell())){
                criteria.andMerchanttellLike("%"+ProviderVo.getMerchanttell()+"%");
            }
            if(ProviderVo.getMerchantperson()!=null&&!"".equals(ProviderVo.getMerchantperson())){
                criteria.andMerchantnameLike("%"+ProviderVo.getMerchantperson()+"%");
            }

        }
        return ProviderExample;
    }

    @Override
    public void add(Provider Provider) {
        ProviderMapper.insertSelective(Provider);
    }

    @Override
    public void delete(String fid) {
        ProviderMapper.deleteByPrimaryKey(fid);
    }

    @Override
    public void update(Provider Provider) {
        ProviderMapper.updateByPrimaryKeySelective(Provider);
    }

    @Override
    public void batchDelete(List<String> list) {
        ProviderExample example = new ProviderExample();
        example.createCriteria().andFidIn(list);
        ProviderMapper.deleteByExample(example);
    }
}
