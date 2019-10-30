package com.coderman.changku.sys.controller;

import com.coderman.changku.sys.commons.Page;
import com.coderman.changku.sys.commons.Result;
import com.coderman.changku.sys.entities.ResultObj;
import com.coderman.changku.sys.modal.LoginInfo;
import com.coderman.changku.sys.service.LoginInfoService;
import com.coderman.changku.sys.vo.LoginInfoVo;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/loginInfo")
public class LoginInfoController {

    @Autowired
    private LoginInfoService loginInfoService;

    /**
     * 查询日志记录
     * @param loginInfoVo
     * @param pageNo
     * @param pageSize
     * @return
     */
    @GetMapping("/listLoginInfo")
    public Result listLoginInfo(LoginInfoVo loginInfoVo,
                                @RequestParam(name = "page",required = false,defaultValue = "1") Integer pageNo,
                                @RequestParam(name = "limit",required = false,defaultValue = "20") int pageSize){
        Page<LoginInfo> page= loginInfoService.findPage(loginInfoVo,pageNo,pageSize);
        return new Result(page.getTotal(),page.getRows());
    }

    /**
     * 批量删除删除
     * @return
     */
    @RequiresPermissions({"loginInfo:batchDelete"})
    @PostMapping("/batchDelete")
    public ResultObj batchDelete(String ids){
        List<Integer> list=new ArrayList<>();
        try {
            if(ids!=null&&!"".equals(ids)&&ids.contains(",")){
                String[] idStrs = ids.split(",");
                for (String idStr : idStrs) {
                    list.add(Integer.parseInt(idStr));
                }
                loginInfoService.batchDelete(list);
            }else {
                loginInfoService.delete(Integer.parseInt(ids));
            }
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
        return ResultObj.DELETE_SUCCESS;
    }
    /**
     * 删除日志记录
     * @param id
     * @return
     */
    @RequiresPermissions({"loginInfo:delete"})
    @PostMapping("/delete")
    public ResultObj deleteLoginfo(Integer id){
        try {
            loginInfoService.delete(id);
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            return ResultObj.DELETE_ERROR;
        }
    }

}
