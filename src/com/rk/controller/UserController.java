package com.rk.controller;

import com.rk.po.User;
import com.rk.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpSession;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/loginValidate")
    @ResponseBody
    public synchronized String loginValidate(User user, HttpSession session) {
        String uid = userService.loginValidate(user);
        if(user.getUid().equals(uid))
            session.setAttribute("userID", uid);
        return uid;
    }

    @RequestMapping(value = "/validateUser")
    @ResponseBody
    public String validateUser(String uid){
        return userService.validateUser(uid);
    }

    @RequestMapping(value = "/insertUser")
    @ResponseBody
    public synchronized void insertUser(User user){
        userService.insertUser(user);
    }
}
