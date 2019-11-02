package com.coderman.changku.biz.service.impl;

import com.coderman.changku.biz.commons.BizPage;
import com.coderman.changku.biz.mapper.ProductsMapper;
import com.coderman.changku.biz.modal.ProductCong;
import com.coderman.changku.biz.modal.Products;
import com.coderman.changku.biz.modal.ProductsExample;
import com.coderman.changku.biz.service.ProductsService;
import com.coderman.changku.biz.vo.ProductsVo;
import com.coderman.changku.sys.commons.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by zhangyukang on 2019/11/2 10:40
 */
@Service
public class ProductsServiceImpl implements ProductsService {

    @Autowired
    private ProductsMapper productsMapper;

    @Override
    public void add(ProductsVo productsVo) {
        productsMapper.insertSelective(productsVo);
    }

    @Override
    public void delete(String id) {
        productsMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Page<Products> listProducts(ProductsVo productsVo, Integer page, Integer limit) {
        ProductsExample productsExample = createProductsExample(productsVo);
        PageHelper.startPage(page,limit);
        List<Products> products = productsMapper.selectByExample(productsExample);
        com.github.pagehelper.Page<Products> productsPage= (com.github.pagehelper.Page<Products>) products;
        return new Page<>(productsPage.getTotal(),productsPage.getResult());
    }

    private ProductsExample createProductsExample(ProductsVo productsVo) {
        ProductsExample productsExample = new ProductsExample();
        ProductsExample.Criteria criteria = productsExample.createCriteria();
        if(productsVo!=null){
            if(productsVo.getMerchantname()!=null&&!"".equals(productsVo.getMerchantname())){
                criteria.andMerchantnameLike("%"+productsVo.getMerchantname()+"%");
            }
            if(productsVo.getProductbrand()!=null&&!"".equals(productsVo.getProductbrand())){
                criteria.andProductbrandLike("%"+productsVo.getProductbrand()+"%");
            }
            if(productsVo.getProducttype()!=null&&!"".equals(productsVo.getProducttype())){
                criteria.andProducttypeLike("%"+productsVo.getProducttype()+"%");
            }
            if(productsVo.getManager()!=null&&!"".equals(productsVo.getManager())){
                criteria.andManagerLike("%"+productsVo.getManager()+"%");
            }
        }
        return productsExample;
    }
}
