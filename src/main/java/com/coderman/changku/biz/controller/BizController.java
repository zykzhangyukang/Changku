package com.coderman.changku.biz.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by zhangyukang on 2019/10/31 11:14
 */
@Controller
@RequestMapping("/biz")
public class BizController {

    /**
     * 跳转到字典详情管理页面
     * @return
     */
    @GetMapping("/toUnitManager")
    public String toUnitManager(){
        return "biz/unit/unit";
    }
    /**
     * 跳转到库存详情管理页面
     * @return
     */
    @GetMapping("/toProductsDataManager")
    public String toProductsDataManager(){
        return "biz/product-in/productsdata";
    }

    /**
     * 跳转到入库管理页面
     * @return
     */
    @GetMapping("/toProductsManager")
    public String toProductsManager(){
        return "biz/product-in/products";
    }
    /**
     * 跳转到供应商管理页面
     * @return
     */
    @GetMapping("/toProviderManager")
    public String toProviderManager(){
        return "biz/provider/provider";
    }

    /**
     * 跳转到商品管理页面
     * @return
     */
    @GetMapping("/toProductManager")
    public String toProductManager(){
        return "biz/product/product";
    }

    /**
     * 跳转到商品管理页面左边
     * @return
     */
    @GetMapping("/toProductLeft")
    public String toProductLeft(){
        return "biz/product/productleft";
    }

    /**
     * 跳转到商品管理右边
     * @return
     */
    @GetMapping("/toProductRight")
    public String toProductRight(){
        return "biz/product/productright";
    }
    /**
     * 跳转到客户管理页面
     * @return
     */
    @GetMapping("/toCustomerManager")
    public String toCustomerManager(){
        return "biz/customer/customer";
    }
}
