package com.rk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class HrefController {

    @RequestMapping(value="/href")
    public String href(String a){
        return a;
    }

    @RequestMapping(value = "/admin")
    public String admin(String a){
        return "admin/admin"+a;
    }


}
