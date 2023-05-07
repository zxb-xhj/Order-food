package com.xhj.dao;

import com.xhj.bean.User;

import java.util.List;

public interface UserMapper {
    User selectid(Integer id) ;

    void updatebalance(User user);

    void jianbalance(User user);

    List<User> selectuser();

    User selectbalance(User user);

    String selectusername(String name);

    User selectuserid(Integer id);

    int insertuser(User user);

    int deleteid(Integer id);

    int updateuser(User user);

    String selectpwd(Integer id);

    int updatepwd(User user);
}
