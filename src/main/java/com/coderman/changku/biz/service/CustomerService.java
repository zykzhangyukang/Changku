package com.coderman.changku.biz.service;

import com.coderman.changku.biz.commons.BizPage;
import com.coderman.changku.biz.modal.Customer;
import com.coderman.changku.biz.vo.CustomerVo;

import java.util.List;

/**
 * Created by zhangyukang on 2019/10/31 10:47
 */
public interface CustomerService {
    /**
     * 查询客户
     * @param customerVo
     * @param pageNo
     * @param pageSize
     * @return
     */
    public BizPage<Customer> findPage(CustomerVo customerVo, Integer pageNo, Integer pageSize);

    /**
     * 添加客户
     * @param customer
     */
    public void add(Customer customer);

    /**
     * 删除客户
     * @param fid
     */
    public void delete(String fid);


    /**
     * 更新客户
     * @param customer
     */
    public void update(Customer customer);

    /**
     * 批量删除
     * @param list
     */
    void batchDelete(List<String> list);
}
