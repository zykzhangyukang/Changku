package com.coderman.changku.biz.service;

import com.coderman.changku.biz.modal.ProductCong;
import com.coderman.changku.biz.vo.ProductCongVo;
import com.coderman.changku.sys.commons.Page;

import java.util.List;
import java.util.Map;

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

    /**
     * 根据商品类型获取品牌不重复
     * @param typeid
     * @return
     */
    List<String> loadAllBrandByTypeId(String typeid);

    /**
     * 根据品牌获取商品型号
     * @param productbrand
     * @return
     */
    List<String> loadAllModelByBrand(String productbrand);

    /**
     * 根据型号获取规格
     * @param productmodel
     * @return
     */
    List<String> loadAllTypeByModel(String productmodel);

}
