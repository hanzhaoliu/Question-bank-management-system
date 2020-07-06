package com.rk.controller;

import com.rk.po.Error;
import com.rk.service.AnswerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.math.BigInteger;

@Controller
public class AnswerController {

    @Autowired
    private AnswerService answerService;

    /**
     * 查询答案是否正确
     * @param qid
     * @param qanswer
     * @return qid or null
     */
    @RequestMapping(value = "/TFanswer")
    @ResponseBody
    public BigInteger TFanswer(BigInteger qid, Integer qanswer, HttpSession session){
        BigInteger id = answerService.TFanswer(qid, qanswer+1);
        //System.out.println(id);
        if(id == null){
            Error error = new Error();
            error.setQid(qid);
            error.setUid((String)session.getAttribute("userID"));
            answerService.insertError(error);
        }
        return id;
    }

    /**
     * 将错题插入错题集
     * @param error
     */
    public void insertError(Error error){
        answerService.insertError(error);
    }

}
