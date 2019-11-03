package com.coderman.changku.biz.controller;

import com.coderman.changku.biz.commons.BizPage;
import com.coderman.changku.biz.commons.BizResultObject;
import com.coderman.changku.biz.commons.IDUtils;
import com.coderman.changku.biz.commons.ResultJson;
import com.coderman.changku.biz.modal.ProductsData;
import com.coderman.changku.biz.service.ProductDataService;
import com.coderman.changku.biz.vo.ProductsDataVo;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**已入库的商品库存管理
 * Created by zhangyukang on 2019/11/3 17:25
 */
@RestController
@RequestMapping("/productsData")
public class ProductsDataController {

    @Autowired
    private ProductDataService productDataService;


    @GetMapping("/listAll")
    public ResultJson listAll(){
        List<ProductsData> productDatas=productDataService.listAll();
        return new ResultJson(productDatas);
    }
    /**
     * 查询客户信息
     * @param productDataVo
     * @param page
     * @param limit
     * @return
     */
    @GetMapping("/findPage")
    public ResultJson findPage(ProductsDataVo productDataVo, Integer page, Integer limit){
        BizPage<ProductsData> productDataBizPage = productDataService.findPage(productDataVo, page, limit);
        return new ResultJson(productDataBizPage.getTotal(),productDataBizPage.getRows());
    }

    /**
     * 删除
     * @return
     */
    @RequiresPermissions({"productData:delete"})
    @PostMapping("/delete")
    public BizResultObject delete(String id){
        try {
            productDataService.delete(id.toString());
            return BizResultObject.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return BizResultObject.DELETE_ERROR;
        }
    }
    /**
     * 批量删除删除
     * @return
     */
    @RequiresPermissions({"notice:batchDelete"})
    @PostMapping("/batchDelete")
    public BizResultObject batchDelete(String ids){
        List<String> list=new ArrayList<>();
        try {
            if(ids!=null&&ids.contains(",")){
                String[] idStrs = ids.split(",");
                for (String idStr : idStrs) {
                    list.add(idStr);
                }
                productDataService.batchDelete(list);
            }else {
                productDataService.delete(ids);
            }
        }catch (Exception e){
            e.printStackTrace();
            return BizResultObject.DELETE_ERROR;
        }
        return BizResultObject.DELETE_SUCCESS;
    }
    /**
     * 添加
     * @param productData
     * @return
     */
    @RequiresPermissions({"productData:add"})
    @PostMapping("/add")
    public BizResultObject add(ProductsData productData){
        try {
            productData.setFid(IDUtils.getGUID());
            productData.setAddtime(new Date().toString());
            productDataService.add(productData);
            return BizResultObject.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return BizResultObject.ADD_FAIL;
        }
    }
    /**
     * 更新客户信息
     * @param productData
     * @return
     */
    @RequiresPermissions({"productData:update"})
    @PostMapping("/update")
    public BizResultObject update(String id,ProductsData productData){
        try {
            productData.setFid(id);
            productDataService.update(productData);
            return BizResultObject.UPDATE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return BizResultObject.UPDATE_FAIL;
        }
    }
}
