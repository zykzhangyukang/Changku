package com.coderman.changku.biz.service;

import com.coderman.changku.biz.commons.BizPage;
import com.coderman.changku.biz.modal.ProductsData;
import com.coderman.changku.biz.vo.ProductsDataVo;

import java.util.List;

/**
 * Created by zhangyukang on 2019/11/3 17:17
 */
public interface ProductDataService {
    /**
     * 查询商品库存
     * @param pageNo
     * @param pageSize
     * @return
     */
    public BizPage<ProductsData> findPage(ProductsDataVo productsDataVo, Integer pageNo, Integer pageSize);

    /**
     * 添加商品库存
     * @param ProductData
     */
    public void add(ProductsData ProductData);

    /**
     * 删除商品库存
     * @param fid
     */
    public void delete(String fid);


    /**
     * 更新商品库存
     * @param ProductData
     */
    public void update(ProductsData ProductData);

    /**
     * 批量删除
     * @param list
     */
    void batchDelete(List<String> list);

    /**
     * 查询所有商品库存
     * @return
     */
    List<ProductsData> listAll();
}
