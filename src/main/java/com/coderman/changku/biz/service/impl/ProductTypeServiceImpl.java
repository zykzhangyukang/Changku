package com.coderman.changku.biz.service.impl;

import com.coderman.changku.biz.mapper.ProductMainMapper;
import com.coderman.changku.biz.modal.ProductMain;
import com.coderman.changku.biz.modal.ProductMainExample;
import com.coderman.changku.biz.service.ProductTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by zhangyukang on 2019/11/1 11:20
 */
@Service
public class ProductTypeServiceImpl implements ProductTypeService {
    @Autowired
    private ProductMainMapper productMainMapper;
    @Override
    public List<ProductMain> listAll() {
        return productMainMapper.selectByExample(null);
    }

    @Override
    public void add(ProductMain productMain) {
        productMainMapper.insertSelective(productMain);
    }

    @Override
    public String finTypeById(String producttype) {
        ProductMainExample example = new ProductMainExample();
        example.createCriteria().andFidEqualTo(producttype);
        List<ProductMain> productMainList = productMainMapper.selectByExample(example);
        if(productMainList.size()>0){
            return productMainList.get(0).getProducttype();
        }
        return null;
    }
}
