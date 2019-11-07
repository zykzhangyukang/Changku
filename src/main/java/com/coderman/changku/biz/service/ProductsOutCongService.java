package com.coderman.changku.biz.service;

import com.coderman.changku.biz.commons.BizPage;
import com.coderman.changku.biz.modal.ProductsOutCong;
import com.coderman.changku.biz.vo.ProductOutRecardVo;

import java.util.List;

/**
 * Created by zhangyukang on 2019/11/7 15:57
 */
public interface ProductsOutCongService {
    /**
     * 查询商品库存
     * @param pageNo
     * @param pageSize
     * @return
     */
    public BizPage<ProductsOutCong> findPage(ProductOutRecardVo recardVo, Integer pageNo, Integer pageSize);

    /**
     * 添加商品库存
     */
    public void add(ProductsOutCong productsOutCong);

    /**
     * 删除商品库存
     * @param fid
     */
    public void delete(String fid);


    /**
     * 更新商品库存
     */
    public void update(ProductsOutCong productsOutCong);

    /**
     * 批量删除
     * @param list
     */
    void batchDelete(List<String> list);
}
