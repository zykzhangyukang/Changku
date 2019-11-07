package com.coderman.changku.biz.controller;

import com.coderman.changku.biz.commons.BizPage;
import com.coderman.changku.biz.commons.IDUtils;
import com.coderman.changku.biz.commons.ResultJson;
import com.coderman.changku.biz.dto.ProductDataDTO;
import com.coderman.changku.biz.dto.ProductOutFormDTO;
import com.coderman.changku.biz.mapper.CustomerMapper;
import com.coderman.changku.biz.mapper.ProductsOutCongMapper;
import com.coderman.changku.biz.mapper.ProductsOutmainMapper;
import com.coderman.changku.biz.modal.*;
import com.coderman.changku.biz.service.ProductsOutCongService;
import com.coderman.changku.biz.service.ProductsService;
import com.coderman.changku.biz.vo.ProductOutRecardVo;
import com.coderman.changku.sys.commons.Page;
import com.coderman.changku.sys.commons.WebUtil;
import com.coderman.changku.sys.modal.User;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;
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
    private ProductsOutCongService productsOutCongService;

    @Autowired
    private  ProductsOutCongMapper productsOutCongMapper;

    @Autowired
    private CustomerMapper customerMapper;


    /**
     * 出库记录详情表
     * @return
     */
    @GetMapping("/listOutRecord")
    public ResultJson listOutRecord(ProductOutRecardVo productOutRecardVo,
                                    Integer page, Integer limit){
        BizPage<ProductsOutCong> products=  productsOutCongService.findPage(productOutRecardVo,page,limit);
        return new ResultJson(products.getTotal(),products.getRows());
    }


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
        //出库商品记录
        if(!CollectionUtils.isEmpty(list)){
            for (ProductDataDTO productDataDTO : list) {
                ProductsOutCong productsOutCong = new ProductsOutCong();
                BeanUtils.copyProperties(productDataDTO,productsOutCong);
                productsOutCong.setFid(IDUtils.getGUID());
                productsOutCong.setFfid(productsOutmain.getFid());//外键
                productsOutCong.setManager(productDataDTO.getManager());
                productsOutCong.setOperator(productDataDTO.getManager());
                BigDecimal singlePrice = productDataDTO.getProductsingleprice();
                productsOutCong.setProductallprice(singlePrice.multiply(new BigDecimal(Integer.parseInt(productDataDTO.getOutcount()))));
                productsOutCongMapper.insertSelective(productsOutCong);
            }
        }
        //减少商品的库存和总价
        productsService.deProductStock(list);

        return new ResultJson();
    }
}
