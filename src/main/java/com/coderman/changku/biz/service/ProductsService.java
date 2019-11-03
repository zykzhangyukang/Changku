package com.coderman.changku.biz.service;

import com.coderman.changku.biz.modal.Products;
import com.coderman.changku.biz.vo.ProductsVo;
import com.coderman.changku.sys.commons.Page;

/**
 * Created by zhangyukang on 2019/11/2 10:39
 */
public interface ProductsService {

    void add(ProductsVo productsVo);

    void delete(String id);

    Page<Products> listProducts(ProductsVo productCongVo, Integer page, Integer limit);

    void saveOrUpdate(ProductsVo productsVo);
}
