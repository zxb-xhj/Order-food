package com.xhj.service;

import com.xhj.bean.User;
import com.xhj.dao.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {

    @Autowired
    UserMapper userMapper;

    public User selectid(Integer id){
        return userMapper.selectid(id);
    }

    public void updatebalance(User user){
        userMapper.updatebalance(user);
    }

    public void jianbalance(User user){
        userMapper.jianbalance(user);
    }

    public List<User> selectuser(){
        return userMapper.selectuser();
    }

    public User selectbalance(User user){
        return userMapper.selectbalance(user);
    }

    public String selectusername(String name){
        return userMapper.selectusername(name);
    }

    public User selectuserid(Integer id){
        return userMapper.selectuserid(id);
    }

    public String selectpwd(Integer id){
        return userMapper.selectpwd(id);
    }

    public int insertuser(User user){
        return userMapper.insertuser(user);
    }

    public int deleteid(Integer id){
        return userMapper.deleteid(id);
    }

    public int updateuser(User user){
        return userMapper.updateuser(user);
    }

    public int updatepwd(User user){
        return userMapper.updatepwd(user);
    }

}
