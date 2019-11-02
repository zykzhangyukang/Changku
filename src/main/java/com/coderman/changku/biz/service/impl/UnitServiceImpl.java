package com.coderman.changku.biz.service.impl;

import com.coderman.changku.biz.commons.BizPage;
import com.coderman.changku.biz.mapper.UnitMapper;
import com.coderman.changku.biz.modal.Unit;
import com.coderman.changku.biz.modal.UnitExample;
import com.coderman.changku.biz.service.UnitService;
import com.coderman.changku.biz.vo.UnitVo;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by zhangyukang on 2019/11/2 17:51
 */
@Service
public class UnitServiceImpl implements UnitService {

    @Autowired
    private UnitMapper unitMapper;

    @Override
    public BizPage<Unit> findPage(UnitVo unitVo, Integer pageNo, Integer pageSize) {
        UnitExample unitExample = new UnitExample();
        PageHelper.startPage(pageNo,pageSize);
        UnitExample.Criteria criteria = unitExample.createCriteria();
        if(unitVo!=null){
            if(unitVo.getTitle()!=null&&!"".equals(unitVo.getTitle())){
                criteria.andTitleLike("%"+unitVo.getTitle()+"%");
            }
        }
        List<Unit> units = unitMapper.selectByExample(unitExample);
        Page<Unit> page= (Page<Unit>) units;
        return new BizPage<>(page.getTotal(),page.getResult());
    }

    @Override
    public void add(Unit unit) {
        unitMapper.insertSelective(unit);
    }

    @Override
    public void delete(String fid) {
        unitMapper.deleteByPrimaryKey(fid);
    }

    @Override
    public void update(Unit unit) {
        unitMapper.updateByPrimaryKeySelective(unit);
    }

    @Override
    public List<Unit> listUnits() {
        return unitMapper.selectByExample(null);
    }
}
