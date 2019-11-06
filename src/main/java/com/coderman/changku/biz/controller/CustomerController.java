
package com.coderman.changku.biz.controller;

import com.coderman.changku.biz.commons.BizPage;
import com.coderman.changku.biz.commons.BizResultObject;
import com.coderman.changku.biz.commons.IDUtils;
import com.coderman.changku.biz.commons.ResultJson;
import com.coderman.changku.biz.modal.Customer;
import com.coderman.changku.biz.service.CustomerService;
import com.coderman.changku.biz.vo.CustomerVo;
import com.coderman.changku.sys.entities.ResultObj;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

/**供应商管理
 * Created by zhangyukang on 2019/10/31 10:50
 */
@RestController
@RequestMapping("/customer")
public class CustomerController {

    @Autowired
    private CustomerService customerService;


    @GetMapping("/findOne")
    public ResultJson findOne(String id){
        Customer customer=customerService.findOne(id);
        return new ResultJson(customer);
    }

    /**
     * 加载所有的客户信息
     * @return
     */
    @GetMapping("/loadAllCustomer")
    public ResultJson loadAllCustomer(){
        List<Customer> customers=customerService.loadAllCustomer();
        return new ResultJson(customers);
    }

    /**
     * 查询客户信息
     * @param customerVo
     * @param page
     * @param limit
     * @return
     */
    @GetMapping("/findPage")
    public ResultJson findPage(CustomerVo customerVo, Integer page, Integer limit){
        BizPage<Customer> customerBizPage = customerService.findPage(customerVo, page, limit);
        return new ResultJson(customerBizPage.getTotal(),customerBizPage.getRows());
    }

    /**
     * 删除
     * @return
     */
    @RequiresPermissions({"customer:delete"})
    @PostMapping("/delete")
    public BizResultObject delete(String id){
        try {
            customerService.delete(id.toString());
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
                customerService.batchDelete(list);
            }else {
                customerService.delete(ids);
            }
        }catch (Exception e){
            e.printStackTrace();
            return BizResultObject.DELETE_ERROR;
        }
        return BizResultObject.DELETE_SUCCESS;
    }
    /**
     * 添加
     * @param customer
     * @return
     */
    @RequiresPermissions({"customer:add"})
    @PostMapping("/add")
    public BizResultObject add(Customer customer){
        try {
            customer.setFid(IDUtils.getGUID());
            customerService.add(customer);
            return BizResultObject.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return BizResultObject.ADD_FAIL;
        }
    }
    /**
     * 更新客户信息
     * @param customer
     * @return
     */
    @RequiresPermissions({"customer:update"})
    @PostMapping("/update")
    public BizResultObject update(String id,Customer customer){
        try {
            customer.setFid(id);
            customerService.update(customer);
            return BizResultObject.UPDATE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return BizResultObject.UPDATE_FAIL;
        }
    }
}
