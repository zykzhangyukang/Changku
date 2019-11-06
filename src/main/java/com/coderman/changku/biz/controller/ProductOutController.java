package com.coderman.changku.biz.controller;

import com.coderman.changku.biz.commons.IDUtils;
import com.coderman.changku.biz.commons.ResultJson;
import com.coderman.changku.biz.dto.ProductDataDTO;
import com.coderman.changku.biz.dto.ProductOutFormDTO;
import com.coderman.changku.biz.mapper.CustomerMapper;
import com.coderman.changku.biz.mapper.ProductsOutmainMapper;
import com.coderman.changku.biz.modal.ProductMain;
import com.coderman.changku.biz.modal.ProductsData;
import com.coderman.changku.biz.modal.ProductsOutmain;
import com.coderman.changku.biz.service.ProductsService;
import com.coderman.changku.sys.commons.WebUtil;
import com.coderman.changku.sys.modal.User;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 商品出库
 * Created by zhangyukang on 2019/11/6 13:49
 */
@RestController
@RequestMapping("/product/out")
public class ProductOutController {

    @Autowired
    private ProductsOutmainMapper productsOutmainMapper;

    @Autowired
    private ProductsService productsService;

    @Autowired
    private CustomerMapper customerMapper;

    @PostMapping("/doOut")
    public ResultJson doOut(ProductOutFormDTO productOutFormDTO){

        //出库记录（主库：用户详情）
        User user = (User) WebUtil.getSession().getAttribute("user");

        ProductsOutmain productsOutmain = new ProductsOutmain();
        BeanUtils.copyProperties(productOutFormDTO,productsOutmain);
        productsOutmain.setFid(IDUtils.getGUID());
        productsOutmain.setOperator(user.getName());
        productsOutmain.setManager(user.getName());
        productsOutmain.setCustomername(customerMapper.findName(productOutFormDTO.getCustomername()));
        productsOutmainMapper.insertSelective(productsOutmain);
        Gson gson = new Gson();
        List<ProductDataDTO> list= gson.fromJson(productOutFormDTO.getItems(),new TypeToken<List<ProductDataDTO>>(){}.getType());
        System.out.println(list);
        //减少商品的库存
        productsService.deProductStock(list);

        return new ResultJson();
    }
}
