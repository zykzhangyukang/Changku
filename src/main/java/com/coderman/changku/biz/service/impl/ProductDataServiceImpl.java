package com.coderman.changku.biz.service.impl;

import com.coderman.changku.biz.commons.BizPage;
import com.coderman.changku.biz.mapper.ProductsDataMapper;
import com.coderman.changku.biz.modal.ProductsData;
import com.coderman.changku.biz.modal.ProductsDataExample;
import com.coderman.changku.biz.service.ProductDataService;
import com.coderman.changku.biz.vo.ProductsDataVo;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by zhangyukang on 2019/11/3 17:18
 */
@Service
public class ProductDataServiceImpl implements ProductDataService{

    @Autowired
    private ProductsDataMapper productsDataMapper;

    @Override
    public BizPage<ProductsData> findPage(ProductsDataVo productsDataVo, Integer pageNo, Integer pageSize) {
        PageHelper.startPage(pageNo,pageSize);
        ProductsDataExample productsDataExample = new ProductsDataExample();
        ProductsDataExample.Criteria criteria = productsDataExample.createCriteria();
        if(productsDataVo!=null){
            if(productsDataVo.getMerchantname()!=null&&!"".equals(productsDataVo.getMerchantname())){
                criteria.andMerchantnameLike("%"+productsDataVo.getMerchantname()+"%");
            }
            if(productsDataVo.getType()!=null&&!"".equals(productsDataVo.getType())){
                criteria.andTypeLike("%"+productsDataVo.getType()+"%");
            }
            if(productsDataVo.getProducttype()!=null&&!"".equals(productsDataVo.getProducttype())){
                criteria.andProducttypeLike("%"+productsDataVo.getProducttype()+"%");
            }
            if(productsDataVo.getProductbrand()!=null&&!"".equals(productsDataVo.getProductbrand())){
                criteria.andProductbrandLike("%"+productsDataVo.getProductbrand()+"%");
            }
        }
        List<ProductsData> productsData = productsDataMapper.selectByExample(productsDataExample);
        Page<ProductsData> productsData1= (Page<ProductsData>) productsData;
        return new BizPage<>(productsData1.getTotal(),productsData1.getResult());
    }

    @Override
    public void add(ProductsData ProductData) {
        productsDataMapper.insertSelective(ProductData);
    }

    @Override
    public void delete(String fid) {
        productsDataMapper.deleteByPrimaryKey(fid);
    }

    @Override
    public void update(ProductsData ProductData) {
        productsDataMapper.updateByPrimaryKeySelective(ProductData);
    }

    @Override
    public void batchDelete(List<String> list) {

    }

    @Override
    public List<ProductsData> listAll() {
        return productsDataMapper.selectByExample(null);
    }
}
