package com.coderman.changku.biz.service.impl;

import com.coderman.changku.biz.commons.BizPage;
import com.coderman.changku.biz.mapper.CustomerMapper;
import com.coderman.changku.biz.mapper.ProductsOutCongMapper;
import com.coderman.changku.biz.mapper.ProductsOutmainMapper;
import com.coderman.changku.biz.modal.ProductsOutCong;
import com.coderman.changku.biz.modal.ProductsOutCongExample;
import com.coderman.changku.biz.modal.ProductsOutmain;
import com.coderman.changku.biz.service.ProductsOutCongService;
import com.coderman.changku.biz.vo.ProductOutRecardVo;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.List;

/**
 * Created by zhangyukang on 2019/11/7 15:59
 */
@Service
public class productsOutCongServiceImpl implements ProductsOutCongService {

    @Autowired
    private ProductsOutCongMapper productsOutCongMapper;

    @Autowired
    private ProductsOutmainMapper productsOutmainMapper;

    @Override
    public BizPage<ProductsOutCong> findPage(ProductOutRecardVo recardVo, Integer pageNo, Integer pageSize) {
        ProductsOutCongExample productsOutCongExample = new ProductsOutCongExample();
        PageHelper.startPage(pageNo,pageSize);
        ProductsOutCongExample.Criteria criteria = productsOutCongExample.createCriteria();
        if(recardVo!=null){
            if(recardVo.getProductbrand()!=null&&recardVo.getProductbrand()!=""){
                criteria.andProductbrandLike("%"+recardVo.getProductbrand()+"%");
            }
        }
        List<ProductsOutCong> productsOutCongs = productsOutCongMapper.selectByExample(productsOutCongExample);
        if(!CollectionUtils.isEmpty(productsOutCongs)){
            for (ProductsOutCong productsOutCong : productsOutCongs) {
                String ffid = productsOutCong.getFfid();
                ProductsOutmain productsOutmain = productsOutmainMapper.selectByPrimaryKey(ffid);
                String customername = productsOutmain.getCustomername();
                productsOutCong.setCustomername(customername);
            }
        }
        Page<ProductsOutCong> productsOutCongs1= (Page<ProductsOutCong>) productsOutCongs;
        return new BizPage<>(productsOutCongs1.getTotal(),productsOutCongs1.getResult());
    }

    @Override
    public void add(ProductsOutCong productsOutCong) {

    }

    @Override
    public void delete(String fid) {

    }

    @Override
    public void update(ProductsOutCong productsOutCong) {

    }

    @Override
    public void batchDelete(List<String> list) {

    }
}
