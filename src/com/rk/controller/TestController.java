package com.rk.controller;

import com.rk.DateTrun;
import com.rk.po.Test;
import com.rk.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;



@Controller
public class TestController {



    @Autowired
    private TestService testService;


    /**
     * 通过uid获取用户做题的记录
     * @param uid
     * @return
     */
    @RequestMapping(value = "/getTestsByUid")
    @ResponseBody
    public List<Test> getTestsByUid(String uid){
        return testService.getTestsByUid(uid);
    }


    /**
     * 插入用户的做题记录
     * @param test
     */
    @RequestMapping(value = "/insertTest")
    @ResponseBody
    public void insertTest(Test test){
        test.setTtime(DateTrun.getNowTime());
        testService.insertTest(test);
    }

}
