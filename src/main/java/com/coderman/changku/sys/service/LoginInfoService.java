package com.coderman.changku.sys.service;

import com.coderman.changku.sys.commons.Page;
import com.coderman.changku.sys.modal.LoginInfo;
import com.coderman.changku.sys.modal.User;
import com.coderman.changku.sys.vo.LoginInfoVo;

import java.util.List;
import java.util.Map;

public interface LoginInfoService {

    /**
     * 删除
     * @param id
     */
     void delete(Integer id);

    /**
     * 查询
     * @param loginInfoVo
     * @param pageNo
     * @param pageSize
     * @return
     */
    Page<LoginInfo> findPage(LoginInfoVo loginInfoVo, Integer pageNo, int pageSize);


    /**
     * 批量删除日志
     * @param list
     */
    void batchDelete(List<Integer> list);

    /**
     * 保存登入信息
     * @param loginInfo
     */
    void save(LoginInfo loginInfo);

    /**
     * 查询用户近期访问记录
     * @param user
     * @return
     */
    List<Map<String,Object>> findLastSevenDaysVisitCount(User user);
}
