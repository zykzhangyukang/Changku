package com.coderman.changku.biz.service;

import com.coderman.changku.biz.commons.BizPage;
import com.coderman.changku.biz.modal.Unit;
import com.coderman.changku.biz.vo.UnitVo;

import java.util.List;

/**
 * Created by zhangyukang on 2019/11/2 17:50
 */
public interface UnitService {
    /**
     * 查询单位
     * @param unitVo
     * @param pageNo
     * @param pageSize
     * @return
     */
    public BizPage<Unit> findPage(UnitVo unitVo, Integer pageNo, Integer pageSize);

    /**
     * 添加单位
     * @param unit
     */
    public void add(Unit unit);

    /**
     * 删除单位
     * @param fid
     */
    public void delete(String fid);


    /**
     * 更新单位
     * @param unit
     */
    public void update(Unit unit);

    /**
     * 查询所有的单位
     * @return
     */
    List<Unit> listUnits();

}
