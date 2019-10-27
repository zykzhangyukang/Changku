package com.coderman.changku.sys.service;

import com.coderman.changku.sys.modal.User;

import java.util.List;

public interface UserService {
    public List<User> findAll();

    /**
     * 根据用户名获取用户
     * @param username
     * @return
     */
    User findUserByName(String username);
}
