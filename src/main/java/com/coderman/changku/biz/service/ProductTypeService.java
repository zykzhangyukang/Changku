package com.coderman.changku.biz.service;

import com.coderman.changku.biz.modal.ProductMain;

import java.util.List;

/**
 * Created by zhangyukang on 2019/11/1 11:19
 */
public interface ProductTypeService {

    List<ProductMain> listAll();

    void add(ProductMain productMain);

    String finTypeById(String producttype);
}
