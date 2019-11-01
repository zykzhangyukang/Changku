package com.coderman.changku.biz.service;

import com.coderman.changku.biz.commons.BizPage;
import com.coderman.changku.biz.modal.Provider;
import com.coderman.changku.biz.vo.ProviderVo;

import java.util.List;

/**
 * Created by zhangyukang on 2019/11/1 19:52
 */
public interface ProviderService {
    /**
     * 查询客户
     * @param ProviderVo
     * @param pageNo
     * @param pageSize
     * @return
     */
    public BizPage<Provider> findPage(ProviderVo ProviderVo, Integer pageNo, Integer pageSize);

    /**
     * 添加客户
     * @param Provider
     */
    public void add(Provider Provider);

    /**
     * 删除客户
     * @param fid
     */
    public void delete(String fid);


    /**
     * 更新客户
     * @param Provider
     */
    public void update(Provider Provider);

    /**
     * 批量删除
     * @param list
     */
    void batchDelete(List<String> list);
}
