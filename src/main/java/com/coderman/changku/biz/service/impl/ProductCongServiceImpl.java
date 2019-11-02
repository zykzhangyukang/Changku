package com.coderman.changku.biz.service.impl;

import com.coderman.changku.biz.mapper.ProductConfigExtMapper;
import com.coderman.changku.biz.mapper.ProductCongMapper;
import com.coderman.changku.biz.modal.ProductCong;
import com.coderman.changku.biz.modal.ProductCongExample;
import com.coderman.changku.biz.service.ProductCongService;
import com.coderman.changku.biz.vo.ProductCongVo;
import com.coderman.changku.sys.commons.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * Created by zhangyukang on 2019/11/1 10:58
 */
@Service
public class ProductCongServiceImpl implements ProductCongService {

    @Autowired
    private ProductCongMapper productCongMapper;

    @Autowired
    private ProductConfigExtMapper productConfigExtMapper;

    @Override
    public Page<ProductCong> findProductConfs(ProductCongVo productCongVo, Integer page, Integer limit) {
        PageHelper.startPage(page,limit);
        ProductCongExample example = createProductCongExample(productCongVo);
        List<ProductCong> productCongs = productCongMapper.selectByExample(example);
        com.github.pagehelper.Page<ProductCong> productCongs1= (com.github.pagehelper.Page<ProductCong>) productCongs;
        return new Page<>(productCongs1.getTotal(),productCongs1.getResult());
    }

    @Override
    public void update(ProductCong productCong) {
        productCongMapper.updateByPrimaryKeySelective(productCong);
    }

    @Override
    public void delete(String fid) {
        productCongMapper.deleteByPrimaryKey(fid);
    }

    @Override
    public void add(ProductCong productCong) {
        productCongMapper.insertSelective(productCong);
    }

    @Override
    public List<String> loadAllBrandByTypeId(String typeid) {
        List<String> productCongs = productConfigExtMapper.loadAllBrandByTypeId(typeid);
        return productCongs;
    }

    @Override
    public List<String> loadAllModelByBrand(String productbrand) {
        List<String> model = productConfigExtMapper.loadAllModelByBrand(productbrand);
        return model;
    }

    @Override
    public List<String> loadAllTypeByModel(String productmodel) {
        List<String> typeByModel = productConfigExtMapper.loadAllTypeByModel(productmodel);
        return typeByModel;
    }

    private ProductCongExample createProductCongExample(ProductCongVo productCongVo) {
        ProductCongExample example = new ProductCongExample();
        ProductCongExample.Criteria criteria = example.createCriteria();
        if(productCongVo!=null){
            if(productCongVo.getProductbrand()!=null&&!"".equals(productCongVo.getProductbrand())){
                criteria.andProductbrandLike("%"+productCongVo.getProductbrand()+"%");
            }
            if(productCongVo.getTypeid()!=null&&!"".equals(productCongVo.getTypeid())){
                criteria.andTypeidEqualTo(productCongVo.getTypeid());
            }
            if(productCongVo.getProductmodel()!=null&&!"".equals(productCongVo.getProductmodel())){
                criteria.andProductmodelLike("%"+productCongVo.getProductmodel()+"%");
            }
            if(productCongVo.getType()!=null&&!"".equals(productCongVo.getType())){
                criteria.andTypeLike("%"+productCongVo.getType()+"%");
            }
        }
        return example;
    }
}
