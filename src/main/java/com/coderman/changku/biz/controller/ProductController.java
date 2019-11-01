package com.coderman.changku.biz.controller;

import com.coderman.changku.biz.commons.BizResultObject;
import com.coderman.changku.biz.commons.IDUtils;
import com.coderman.changku.biz.commons.ResultJson;
import com.coderman.changku.biz.modal.ProductCong;
import com.coderman.changku.biz.modal.ProductMain;
import com.coderman.changku.biz.service.ProductCongService;
import com.coderman.changku.biz.service.ProductTypeService;
import com.coderman.changku.biz.vo.ProductCongVo;
import com.coderman.changku.sys.commons.Page;
import com.coderman.changku.sys.commons.WebUtil;
import com.coderman.changku.sys.modal.User;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
import java.util.List;

/**商品
 * Created by zhangyukang on 2019/11/1 10:57
 */
@RestController
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductTypeService productTypeService;

    @Autowired
    private ProductCongService productCongService;


    /**
     * 添加商品配置
     * @return
     */
    @PostMapping("/addConfig")
    public BizResultObject addConfig(ProductCong productCong){
        productCong.setFid(IDUtils.getGUID());
        User user = (User) WebUtil.getSession().getAttribute("user");
        productCong.setFcor(user.getName());
        try {
            productCongService.add(productCong);
            return BizResultObject.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return BizResultObject.ADD_FAIL;
        }
    }
    /**
     * 删除产品配置信息
     * @return
     */
    @PostMapping("/deleteConfig")
    public BizResultObject deleteConfig(String id){
        try {
            productCongService.delete(id);
            return BizResultObject.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return BizResultObject.DELETE_ERROR;
        }
    }
    /**
     * 修改产品配置信息
     * @return
     */
    @PostMapping("/updateConfig")
    public BizResultObject updateConfig(String id,ProductCong productCong){
        productCong.setFid(id);
        try {
            productCongService.update(productCong);
            return BizResultObject.UPDATE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return BizResultObject.UPDATE_FAIL;
        }
    }
    /**
     * 查询商品配置
     * @param productCongVo
     * @param page
     * @param limit
     * @return
     */
    @GetMapping("/listProductConfigs")
    public ResultJson listProductConfigs(ProductCongVo productCongVo,Integer page,Integer limit){
        Page<ProductCong> productCongPage=productCongService.findProductConfs(productCongVo,page,limit);
        return new ResultJson(productCongPage.getTotal(),productCongPage.getRows());
    }

    /**
     * 显示商品的类别
     * @return
     */
    @GetMapping("/listProductType")
    public ResultJson listProductType(){
        List<ProductMain> productMainList=productTypeService.listAll();
        return new ResultJson(productMainList);
    }
    /**
     * 添加商品类别
     * @return
     */
    @RequiresPermissions({"product:addType"})
    @PostMapping("/addType")
    public BizResultObject addType(ProductMain productMain){
        try {
            productMain.setFid(IDUtils.getGUID());
            productMain.setAddtime(new Date().toString());
             User user= (User) WebUtil.getSession().getAttribute("user");
            productMain.setOperator(user.getName());
            productTypeService.add(productMain);
            return BizResultObject.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return BizResultObject.ADD_FAIL;
        }
    }
}
