package com.rk.controller;

import com.rk.po.Admin;
import com.rk.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
public class AdminController {

    @Autowired
    private AdminService adminService;

    /**
     * 验证管理员身份
     * @param admin
     * @return aid
     */
    @RequestMapping(value = "/adminLogin")
    @ResponseBody
    public String adminLogin(Admin admin, HttpSession session){
        String aid = adminService.adminLogin(admin);
        if(aid != null)
            session.setAttribute("adminID", aid);
        return aid;
    }
}
