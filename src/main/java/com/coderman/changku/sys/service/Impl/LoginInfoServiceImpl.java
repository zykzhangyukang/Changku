package com.coderman.changku.sys.service.Impl;

import com.coderman.changku.sys.commons.Page;
import com.coderman.changku.sys.mapper.LoginInfoMapper;
import com.coderman.changku.sys.modal.LoginInfo;
import com.coderman.changku.sys.modal.LoginInfoExample;
import com.coderman.changku.sys.modal.User;
import com.coderman.changku.sys.service.LoginInfoService;
import com.coderman.changku.sys.vo.LoginInfoVo;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class LoginInfoServiceImpl implements LoginInfoService {

    @Autowired
    private LoginInfoMapper loginInfoMapper;

    @Override
    public void delete(Integer id) {
        loginInfoMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Page<LoginInfo> findPage(LoginInfoVo loginInfoVo, Integer pageNo, int pageSize) {

        PageHelper.startPage(pageNo,pageSize);
        LoginInfoExample loginInfoExample = CreateLoginInfoExample(loginInfoVo);
        List<LoginInfo> loginInfos = loginInfoMapper.selectByExample(loginInfoExample);
        com.github.pagehelper.Page<LoginInfo> loginInfoPage= (com.github.pagehelper.Page<LoginInfo>) loginInfos;
        return new Page<>(loginInfoPage.getTotal(),loginInfoPage.getResult());
    }

    @Override
    public void batchDelete(List<Integer> list) {
        LoginInfoExample example = new LoginInfoExample();
        example.createCriteria().andIdIn(list);
        loginInfoMapper.deleteByExample(example);
    }

    @Override
    public void save(LoginInfo loginInfo) {
        loginInfoMapper.insertSelective(loginInfo);
    }

    @Override
    public List<Map<String, Object>> findLastSevenDaysVisitCount(User user) {
        return loginInfoMapper.findLastSevenDaysVisitCount(user);
    }

    /**
     * 构建查询条件
     * @return
     */
    private LoginInfoExample CreateLoginInfoExample(LoginInfoVo loginInfoVo) {
        LoginInfoExample loginInfoExample = new LoginInfoExample();
        loginInfoExample.setOrderByClause("logintime desc");
        LoginInfoExample.Criteria criteria = loginInfoExample.createCriteria();
        if(loginInfoVo!=null){
            if(loginInfoVo.getLoginname()!=null&&!"".equals(loginInfoVo.getLoginname())){
                criteria.andLoginnameLike("%"+loginInfoVo.getLoginname()+"%");
            }
            if(loginInfoVo.getLoginip()!=null&&!"".equals(loginInfoVo.getLoginip())){
                criteria.andLoginipLike("%"+loginInfoVo.getLoginip()+"%");
            }
            if(loginInfoVo.getEndTime()!=null&&!"".equals(loginInfoVo.getEndTime())&&loginInfoVo.getStartTime()!=null&&!"".equals(loginInfoVo.getStartTime())){
                criteria.andLogintimeBetween(loginInfoVo.getStartTime(),loginInfoVo.getEndTime());
            }
        }
        return loginInfoExample;
    }
}
