package com.coderman.changku.biz.controller;

import com.coderman.changku.biz.commons.BizPage;
import com.coderman.changku.biz.commons.BizResultObject;
import com.coderman.changku.biz.commons.IDUtils;
import com.coderman.changku.biz.commons.ResultJson;
import com.coderman.changku.biz.modal.Provider;
import com.coderman.changku.biz.service.ProviderService;
import com.coderman.changku.biz.vo.ProviderVo;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by zhangyukang on 2019/11/1 19:57
 */
@RestController
@RequestMapping("/provider")
public class ProviderController {

    @Autowired
    private ProviderService providerService;


    @GetMapping("/listAll")
    public ResultJson listAll(){
        List<Provider> providers=providerService.listAll();
        return new ResultJson(providers);
    }
    /**
     * 查询客户信息
     * @param providerVo
     * @param page
     * @param limit
     * @return
     */
    @GetMapping("/findPage")
    public ResultJson findPage(ProviderVo providerVo, Integer page, Integer limit){
        BizPage<Provider> providerBizPage = providerService.findPage(providerVo, page, limit);
        return new ResultJson(providerBizPage.getTotal(),providerBizPage.getRows());
    }

    /**
     * 删除
     * @return
     */
    @RequiresPermissions({"provider:delete"})
    @PostMapping("/delete")
    public BizResultObject delete(String id){
        try {
            providerService.delete(id.toString());
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
                providerService.batchDelete(list);
            }else {
                providerService.delete(ids);
            }
        }catch (Exception e){
            e.printStackTrace();
            return BizResultObject.DELETE_ERROR;
        }
        return BizResultObject.DELETE_SUCCESS;
    }
    /**
     * 添加
     * @param provider
     * @return
     */
    @RequiresPermissions({"provider:add"})
    @PostMapping("/add")
    public BizResultObject add(Provider provider){
        try {
            provider.setFid(IDUtils.getGUID());
            provider.setAddtime(new Date().toString());
            providerService.add(provider);
            return BizResultObject.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return BizResultObject.ADD_FAIL;
        }
    }
    /**
     * 更新客户信息
     * @param provider
     * @return
     */
    @RequiresPermissions({"provider:update"})
    @PostMapping("/update")
    public BizResultObject update(String id,Provider provider){
        try {
            provider.setFid(id);
            providerService.update(provider);
            return BizResultObject.UPDATE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return BizResultObject.UPDATE_FAIL;
        }
    }
}
