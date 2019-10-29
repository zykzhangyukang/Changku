package com.coderman.changku.sys.service;

import com.coderman.changku.sys.commons.Page;
import com.coderman.changku.sys.commons.RoleJson;
import com.coderman.changku.sys.modal.User;
import com.coderman.changku.sys.vo.UserVo;

import java.util.List;
import java.util.Map;

public interface UserService {


    /**
     * 创建用户信息
     * @param user
     */
    public void add(User user);

    /**
     * 删除用户信息
     * @param id
     */
    public void delete(Integer id);

    /**
     * 更新用户信息
     * @param user
     */
    public void update(User user);

    /**
     * 查询用户
     * @param userVo
     * @param pageNo
     * @param pageSize
     * @return
     */
    public Page findPage(UserVo userVo, Integer pageNo, int pageSize);

    /**
     * 查询所有的用户
     * @return
     */
    public List<User> findAll();

    /**
     * 根据用户名获取用户
     * @param username
     * @return
     */
    User findUserByName(String username);


    /**
     * 用户拥有的角色
     * @param userId
     * @return
     */
    Map<String,Object> loadUserRoles(Integer userId);

    /**
     * 给用户分配角色
     * @param roleMap
     */
    void saveUserRoles(Map<String, Object> roleMap);

    /**
     * 清空用户的所有角色
     * @param i
     */
    void cleanUserRoles(int i);
}
