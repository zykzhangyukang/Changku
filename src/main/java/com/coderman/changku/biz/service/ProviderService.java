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
     * 查询供应商
     * @param ProviderVo
     * @param pageNo
     * @param pageSize
     * @return
     */
    public BizPage<Provider> findPage(ProviderVo ProviderVo, Integer pageNo, Integer pageSize);

    /**
     * 添加供应商
     * @param Provider
     */
    public void add(Provider Provider);

    /**
     * 删除供应商
     * @param fid
     */
    public void delete(String fid);


    /**
     * 更新供应商
     * @param Provider
     */
    public void update(Provider Provider);

    /**
     * 批量删除
     * @param list
     */
    void batchDelete(List<String> list);

    /**
     * 查询所有供应商
     * @return
     */
    List<Provider> listAll();
    
}
