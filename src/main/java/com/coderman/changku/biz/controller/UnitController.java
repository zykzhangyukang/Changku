package com.coderman.changku.biz.controller;

import com.coderman.changku.biz.commons.BizPage;
import com.coderman.changku.biz.commons.BizResultObject;
import com.coderman.changku.biz.commons.IDUtils;
import com.coderman.changku.biz.commons.ResultJson;
import com.coderman.changku.biz.modal.Unit;
import com.coderman.changku.biz.service.UnitService;
import com.coderman.changku.biz.vo.UnitVo;
import com.coderman.changku.sys.commons.WebUtil;
import com.coderman.changku.sys.modal.User;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
import java.util.List;

/**
 * Created by zhangyukang on 2019/11/2 17:59
 */
@RestController
@RequestMapping("/unit")
public class UnitController {
    @Autowired
    private UnitService unitService;

    

    @GetMapping("/listUnits")
    public ResultJson listUnits(){
        List<Unit> units=unitService.listUnits();
        return new ResultJson(units);
    }
    /**
     * 查询 字典信息
     * @param unitVo
     * @param page
     * @param limit
     * @return
     */
    @GetMapping("/findPage")
    public ResultJson findPage(UnitVo unitVo, Integer page, Integer limit){
        BizPage<Unit> unitBizPage = unitService.findPage(unitVo, page, limit);
        return new ResultJson(unitBizPage.getTotal(),unitBizPage.getRows());
    }

    /**
     * 删除
     * @return
     */
    @RequiresPermissions({"unit:delete"})
    @PostMapping("/delete")
    public BizResultObject delete(String id){
        try {
            unitService.delete(id.toString());
            return BizResultObject.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return BizResultObject.DELETE_ERROR;
        }
    }

    /**
     * 添加
     * @param unit
     * @return
     */
    @RequiresPermissions({"unit:add"})
    @PostMapping("/add")
    public BizResultObject add(Unit unit){
        try {
            User user = (User) WebUtil.getSession().getAttribute("user");
            unit.setFid(IDUtils.getGUID());
            unit.setCreator(user.getName());
            unit.setCreateTime(new Date());
            unitService.add(unit);
            return BizResultObject.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return BizResultObject.ADD_FAIL;
        }
    }
    /**
     * 更新 字典信息
     * @param unit
     * @return
     */
    @RequiresPermissions({"unit:update"})
    @PostMapping("/update")
    public BizResultObject update(String id,Unit unit){
        try {
            unit.setFid(id);
            unitService.update(unit);
            return BizResultObject.UPDATE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return BizResultObject.UPDATE_FAIL;
        }
    }
}
