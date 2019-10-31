package com.coderman.changku.biz.service.impl;

import com.coderman.changku.biz.commons.BizPage;
import com.coderman.changku.biz.mapper.CustomerMapper;
import com.coderman.changku.biz.modal.Customer;
import com.coderman.changku.biz.modal.CustomerExample;
import com.coderman.changku.biz.service.CustomerService;
import com.coderman.changku.biz.vo.CustomerVo;
import com.coderman.changku.sys.modal.NoticeExample;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by zhangyukang on 2019/10/31 10:47
 */
@Service
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    private CustomerMapper customerMapper;

    @Override
    public BizPage<Customer> findPage(CustomerVo customerVo, Integer pageNo, Integer pageSize) {
        PageHelper.startPage(pageNo,pageSize);
        CustomerExample customerExample = createCustomerExample(customerVo);
        List<Customer> customers = customerMapper.selectByExample(customerExample);
        Page<Customer> customerPage= (Page<Customer>) customers;
        return new BizPage<>(customerPage.getTotal(),customerPage.getResult());
    }

    /**
     * 封装查询对象
     * @param customerVo
     * @return
     */
    private CustomerExample createCustomerExample(CustomerVo customerVo) {
        CustomerExample customerExample = new CustomerExample();
        CustomerExample.Criteria criteria = customerExample.createCriteria();
        if(customerVo!=null){
            if(customerVo.getCustomername()!=null&&!"".equals(customerVo.getCustomername())){
                criteria.andCustomernameLike("%"+customerVo.getCustomername()+"%");
            }
            if(customerVo.getAddress()!=null&&!"".equals(customerVo.getAddress())){
                criteria.andAddressLike("%"+customerVo.getAddress()+"%");
            }
            if(customerVo.getCarpinpai()!=null&&!"".equals(customerVo.getCarpinpai())){
                criteria.andCarpinpaiLike("%"+customerVo.getCarpinpai()+"%");
            }
            if(customerVo.getCustomertell()!=null&&!"".equals(customerVo.getCustomertell())){
                criteria.andCustomertellLike("%"+customerVo.getCustomertell()+"%");
            }
            if(customerVo.getCarno()!=null&&!"".equals(customerVo.getCarno())){
                criteria.andCarnoLike("%"+customerVo.getCarno()+"%");
            }

        }
        return customerExample;
    }

    @Override
    public void add(Customer customer) {
        customerMapper.insertSelective(customer);
    }

    @Override
    public void delete(String fid) {
        customerMapper.deleteByPrimaryKey(fid);
    }

    @Override
    public void update(Customer customer) {
        customerMapper.updateByPrimaryKeySelective(customer);
    }

    @Override
    public void batchDelete(List<String> list) {
        CustomerExample example = new CustomerExample();
        example.createCriteria().andFidIn(list);
        customerMapper.deleteByExample(example);
    }
}
