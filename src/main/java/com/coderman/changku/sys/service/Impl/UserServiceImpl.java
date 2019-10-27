package com.coderman.changku.sys.service.Impl;

import com.coderman.changku.sys.mapper.UserMapper;
import com.coderman.changku.sys.modal.User;
import com.coderman.changku.sys.modal.UserExample;
import com.coderman.changku.sys.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Override
    public List<User> findAll() {
        return userMapper.selectByExample(null);
    }

    @Override
    public User findUserByName(String username) {
        UserExample example = new UserExample();
        example.createCriteria().andLoginnameEqualTo(username);
        List<User> users = userMapper.selectByExample(example);
        if(users.size()>0){
            return users.get(0);
        }
        return null;
    }
}
