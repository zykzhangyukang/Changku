package com.coderman.changku.sys.service.Impl;

import com.coderman.changku.sys.commons.Constast;
import com.coderman.changku.sys.commons.RoleJson;
import com.coderman.changku.sys.mapper.*;
import com.coderman.changku.sys.modal.*;
import com.coderman.changku.sys.service.UserService;
import com.coderman.changku.sys.vo.UserVo;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Autowired
    private DepartmentMapper departmentMapper;

    @Autowired
    private RoleUserMapper roleUserMapper;

    @Autowired
    private RoleMapper roleMapper;

    @Autowired
    private UserExtMapper userExtMapper;


    @Override
    public void add(User user) {
        userMapper.insertSelective(user);
    }


    @Transactional
    @Override
    public void delete(Integer id) {
        //删除用户中间表的数据
        RoleUserExample example = new RoleUserExample();
        example.createCriteria().andUidEqualTo(id);
        roleUserMapper.deleteByExample(example);
        userMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void update(User user) {
        userMapper.updateByPrimaryKeySelective(user);
    }

    @Override
    public com.coderman.changku.sys.commons.Page<User> findPage(UserVo userVo, Integer pageNo, int pageSize) {
        PageHelper.startPage(pageNo,pageSize);
        List<User> users=userExtMapper.listUsersById(userVo);
        Page<User> page= (Page<User>) users;
        return new com.coderman.changku.sys.commons.Page<>(page.getTotal(), page.getResult());
    }

    /**
     * 封装用户的查询对象
     * @param userVo
     * @return
     */
    private UserExample createUserExample(UserVo userVo) {
        UserExample userExample = new UserExample();
        UserExample.Criteria criteria = userExample.createCriteria();
        criteria.andTypeEqualTo(Constast.USER_TYPE);
        if(userVo!=null){
            if(userVo.getName()!=null&&!"".equals(userVo.getName())){
                criteria.andNameLike("%"+userVo.getName()+"%");
            }
            if(userVo.getAddress()!=null&&!"".equals(userVo.getAddress())){
                criteria.andAddressLike("%"+userVo.getAddress()+"%");
            }
            if(userVo.getLoginname()!=null&&!"".equals(userVo.getLoginname())){
                criteria.andLoginnameLike("%"+userVo.getLoginname()+"%");
            }
            if(userVo.getRemark()!=null&&!"".equals(userVo.getRemark())){
                criteria.andRemarkLike("%"+userVo.getRemark()+"%");
            }
            if(userVo.getDeptid()!=null&&!"".equals(userVo.getDeptid())){
                criteria.andDeptidEqualTo(userVo.getDeptid());
            }
            if(userVo.getAvailable()!=null&&!"".equals(userVo.getAvailable())){
                criteria.andAvailableEqualTo(userVo.getAvailable());
            }
        }
        return userExample;
    }

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

    @Override
    public Map<String, Object> loadUserRoles(Integer userId) {
        //所有的可用的角色
        RoleExample example = new RoleExample();
        example.createCriteria().andAvailableEqualTo(Constast.AVAILABLE_TRUE);
        List<Role> roles = roleMapper.selectByExample(example);
        List<RoleJson> roleJsons=BuildJson(roles);
        Map<String,Object> map=new HashMap<>();
        map.put("allRoles",roleJsons);
        //用户拥有的角色
        RoleUserExample example1 = new RoleUserExample();
        example1.createCriteria().andUidEqualTo(userId);
        List<RoleUserKey> roleUserKeys = roleUserMapper.selectByExample(example1);
        map.put("haveRoles",roleUserKeys);
        return map;
    }

    @Transactional
    @Override
    public void saveUserRoles(Map<String, Object> map) {
        if(map.get("userId")!=null&&map.get("rids")!=null){
            cleanUserRoles((Integer) map.get("userId"));
            List<Integer> rids= (List<Integer>) map.get("rids");
            for (Integer rid : rids) {
                RoleUserKey roleUserKey = new RoleUserKey();
                roleUserKey.setRid(rid);
                roleUserKey.setUid((Integer) map.get("userId"));
                roleUserMapper.insertSelective(roleUserKey);
            }
        }
    }

    @Transactional
    @Override
    public void cleanUserRoles(int i) {
        RoleUserExample example = new RoleUserExample();
        example.createCriteria().andUidEqualTo(i);
        roleUserMapper.deleteByExample(example);
    }

    @Override
    public void resetPwd(Integer uid) {
        User user = new User();
        user.setId(uid);
        String salt= UUID.randomUUID().toString().toUpperCase();
        user.setSalt(salt);
        user.setPwd(new Md5Hash(Constast.DEFAULT_PASSWORD,salt,Constast.MD5_TIME).toString()); //设置用户的默认密码
        userMapper.updateByPrimaryKeySelective(user);
    }

    @Override
    public List<User> loadManagers(Integer deptid, Integer uid) {
        UserExample example = new UserExample();
        if(uid!=null){
            example.createCriteria().andIdNotEqualTo(uid);
        }
        example.createCriteria().andDeptidEqualTo(deptid);
        List<User> users = userMapper.selectByExample(example);
        return users;
    }

    /**
     * 所有的可用的角色
     * @param roles
     * @return
     */
    private List<RoleJson> BuildJson(List<Role> roles) {
        List<RoleJson> roleJsons=new ArrayList<>();
        if(roles!=null){
            for (Role role : roles) {
                roleJsons.add(new RoleJson(role.getId().toString(),role.getName(),"1"));
            }
        }
        return roleJsons;
    }


}
