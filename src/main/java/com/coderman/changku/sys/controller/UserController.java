package com.coderman.changku.sys.controller;

import com.coderman.changku.sys.commons.Page;
import com.coderman.changku.sys.commons.Result;
import com.coderman.changku.sys.entities.ResultObj;
import com.coderman.changku.sys.modal.User;
import com.coderman.changku.sys.service.UserService;
import com.coderman.changku.sys.vo.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 用户管理
 */
@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;


    /**
     * 给用户分配角色
     * @return
     */
    @GetMapping("/saveUserRoles")
    public ResultObj saveUserRoles(@RequestParam(name = "userIdAndRole",required = true) String userIdAndRole){
        Integer userId= null;
        try {
            if(userIdAndRole.contains("-")){
                Map<String,Object> roleMap=new HashMap<>();
                List<Integer> rids=new ArrayList<>();
                String userIdstr = userIdAndRole.split("-")[0];
                userId=Integer.parseInt(userIdstr);
                //解析UID
                String substring = userIdAndRole.substring(userIdstr.length() + 1, userIdAndRole.length()-userIdstr.length() + 1);
                String[] ps = substring.split("-");
                for (String id : ps) {
                    rids.add(Integer.parseInt(id));
                }
                roleMap.put("userId",userId) ;
                roleMap.put("rids",rids);
                userService.saveUserRoles(roleMap);
            }else {
                //清除用户的角色
                userService.cleanUserRoles(Integer.parseInt(userIdAndRole));
            }
            return ResultObj.ROLE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ROLE_ERROR;
        }
    }
    /**
     * 获取所有的可用的角色
     * @return
     */
    @GetMapping("/loadUserRoles")
    public Result loadUserRoles(Integer userId){
        Map<String, Object> map = userService.loadUserRoles(userId);
        return new Result(map);
    }

    /**
     * 删除用户信息
     * @param id
     * @return
     */
    @PostMapping("/delete")
    public ResultObj delete(Integer id){
        try {
            userService.delete(id);
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }

    /**
     * 更新用户信息
     * @param user
     * @return
     */
    @PostMapping("/update")
    public ResultObj update(User user){
        try {
            userService.update(user);
            return ResultObj.UPDATE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.UPDATE_FAIL;
        }
    }

    /**
     * 添加用户信息
     * @param user
     * @return
     */
    @PostMapping("/add")
    public ResultObj add(User user){
        try {
            userService.add(user);
            return ResultObj.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_FAIL;
        }
    }

    /**
     * 查询用户信息
     * @param userVo
     * @param pageNo
     * @param pageSize
     * @return
     */
    @GetMapping("/listUsers")
    public Result findPage(UserVo userVo,
                           @RequestParam(name = "page",required = false,defaultValue = "1") Integer pageNo,
                           @RequestParam(name = "limit",required = false,defaultValue = "20") int pageSize){
        Page page = userService.findPage(userVo, pageNo, pageSize);
        return new Result(page.getTotal(),page.getRows());
    }




}
