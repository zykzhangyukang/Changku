package com.coderman.changku.biz.service;

import com.coderman.changku.biz.modal.ProductCong;
import com.coderman.changku.biz.vo.ProductCongVo;
import com.coderman.changku.sys.commons.Page;

/**
 * Created by zhangyukang on 2019/11/1 10:58
 */
public interface ProductCongService {
    /**
     * 查询商品的配置
     * @param productCongVo
     * @param page
     * @param limit
     * @return
     */
    Page<ProductCong> findProductConfs(ProductCongVo productCongVo, Integer page, Integer limit);

    /**
     * 修改产品的配置
     * @param productCong
     */
    void update(ProductCong productCong);


    /**
     * 删除商品配置
     * @param fid
     */
    void delete(String fid);


    /**
     * 添加商品配置
     * @param productCong
     */
    void add(ProductCong productCong);
}
