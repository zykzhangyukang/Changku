package com.coderman.changku.sys.mapper;

import com.coderman.changku.sys.modal.User;
import com.coderman.changku.sys.vo.UserVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserExtMapper {

    List<User> listUsersById(UserVo userVo);
}
