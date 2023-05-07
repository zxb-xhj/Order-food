package com.xhj.controller;

import com.alibaba.fastjson.JSON;
import com.xhj.bean.User;
import com.xhj.service.ShoppingService;
import com.xhj.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
public class UserController {

    @Autowired
    UserService userService;

    @Autowired
    ShoppingService shoppingService;

    @GetMapping("/index1")
    public String ss(){
        return "index1";
    }

    @GetMapping("/selectuserid/{id}")
    public void selectid(@PathVariable(value = "id") Integer id, HttpServletResponse response) throws IOException {
        User user = userService.selectid(id);
        System.out.println(user);
        String jsonuser = JSON.toJSONString(user);
        response.setContentType("text/json;charset=utf-8");
        response.getWriter().write(jsonuser);

    }

    @GetMapping("/updatebalance")
    public void updatebalance(@RequestParam(value = "id") Integer id,
                              @RequestParam(value = "balance") Integer balance,
                              HttpServletResponse response) throws IOException {
        User user1 = new User(id, balance);
        userService.updatebalance(user1);
        response.setContentType("text/json;charset=utf-8");
        response.getWriter().write("success");
    }

    @GetMapping("/userlogin")
    public void selectuser(@RequestParam(value ="name")String name,
                             @RequestParam(value ="pwd")String pwd,
                             HttpServletResponse response){
        List<User> users = userService.selectuser();
        try {
            for(User user : users){
                if(name.equals(user.getName())&&pwd.equals(user.getPwd())){
                    String jsonuser = JSON.toJSONString(user);
                    System.out.println(user);
                    response.setContentType("text/json;charset=utf-8");
                    response.getWriter().write(jsonuser);
                }else{
                    response.setContentType("text/json;charset=utf-8");
                    response.getWriter().write("");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @PostMapping("/insertuser")
    public void insertuser(@RequestParam(value = "name")String name,
                           @RequestParam(value = "pwd")String pwd,
                           HttpServletResponse response) throws IOException {
        System.out.println(name);
        System.out.println(pwd);
        System.out.println(name.length());
        if (name.length()<=16&&pwd.length()<=16){
            if (!name.equals(userService.selectusername(name))){
                userService.insertuser(new User(name,pwd));
                response.setContentType("text/json;charset=utf-8");
                response.getWriter().write("success");
            }else {
                response.setContentType("text/json;charset=utf-8");
                response.getWriter().write("");
            }
        }else {
            response.setContentType("text/json;charset=utf-8");
            response.getWriter().write("");
        }

    }

    @PostMapping("/xiugaimima")
    public void xiugaimima(@RequestParam(value = "id")Integer id,
                           @RequestParam(value = "pwd")String pwd,
                           @RequestParam(value = "userpwd")String userpwd,
                           HttpServletResponse response) throws IOException {
        System.out.println(id+" ,"+pwd+" ,"+userpwd);
        if (userpwd.equals(userService.selectpwd(id))) {
            userService.updatepwd(new User(id,pwd));
            response.setContentType("text/json;charset=utf-8");
            response.getWriter().write("success");
        }

    }

    @GetMapping("/sss")
    public String sss(){

//        userService.insertuser(user);
        return "zhuce";
    }

    @GetMapping("/deletegw")
    @ResponseBody
    public void deletegw(HttpServletResponse response) throws IOException {
        shoppingService.deleteall();
        response.setContentType("text/json;charset=utf-8");
        response.getWriter().write("success");
    }


}

