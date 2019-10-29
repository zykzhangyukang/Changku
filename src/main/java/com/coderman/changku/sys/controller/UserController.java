package com.coderman.changku.sys.controller;

import com.coderman.changku.sys.commons.Constast;
import com.coderman.changku.sys.commons.Page;
import com.coderman.changku.sys.commons.Result;
import com.coderman.changku.sys.entities.ResultObj;
import com.coderman.changku.sys.modal.User;
import com.coderman.changku.sys.service.UserService;
import com.coderman.changku.sys.vo.UserVo;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.*;

/**
 * 用户管理
 */
@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * 重置用户的密码
     * @param uid
     * @return
     */
    @PostMapping("/resetPwd")
    public ResultObj resetPws(Integer uid){
        try {
            userService.resetPwd(uid);
            return ResultObj.RESET_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.RESET_ERROR;
        }
    }
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
     * 加载用户的上级领导
     * @return
     */
    @GetMapping("/loadManagers")
    public Result loadManagers(Integer deptid,Integer uid){
        List<User> managers=userService.loadManagers(deptid,uid);
        return new Result(managers);
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
            user.setType(Constast.USER_TYPE);
            user.setHiredate(new Date(System.currentTimeMillis()));
            user.setMgr(1);//默认的管理者
            String salt=UUID.randomUUID().toString().toUpperCase();
            user.setSalt(salt);
            user.setPwd(new Md5Hash(Constast.DEFAULT_PASSWORD,salt,Constast.MD5_TIME).toString()); //设置用户的默认密码
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
