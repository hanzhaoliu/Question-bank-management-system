package com.rk.controller;

import com.rk.po.Question;
import com.rk.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.math.BigInteger;
import java.util.List;

@Controller
public class QuestionController {

    @Autowired
    private QuestionService questionService;

    /**
     * 获得数据库所有题目
     * @return 数据库所有题
     */
    @RequestMapping(value = "/getAllQuestion")
    @ResponseBody
    public List<Question> getAllQuestion(){
        return questionService.getAllQuestion();
    }

    /**
     * 获得一道id>num题目
     * @return 一道题目
     */
    @RequestMapping(value = "/getQuestion")
    @ResponseBody
    public Question getQuestion(Integer num){
        return questionService.getQuestion(num);
    }

    /**
     * 获得一道id>num有效题目
     * @param num
     * @return 一道有效题目
     */
    @RequestMapping(value = "/getEffectiveQuestion")
    @ResponseBody
    public Question getEffectiveQuestion(Integer num){
        return questionService.getEffectiveQuestion(num);
    }

    /**
     * 获得一道id<num有效题目
     * @param num
     * @return 一道有效题目
     */
    @RequestMapping(value = "/getEffectiveUpQuestion")
    @ResponseBody
    public Question getEffectiveUpQuestion(Integer num){
        return questionService.getEffectiveUpQuestion(num);
    }

    /**
     * 随机获得数据库num条题目
     * @param num
     * @return num条题目
     */
    @RequestMapping(value = "/getQuestionToNum")
    @ResponseBody
    public List<Question> getQuestionToNum(Integer num){
        return questionService.getQuestionToNum(num);
    }

    /**
     * 随机获得数据库type类型num条题目
     * @param type
     * @param num
     * @return type类型num条题目
     */
    @RequestMapping(value = "/getQuestionToTypeAndNum")
    @ResponseBody
    public List<Question> getQuestionToTypeAndNum(Integer type, Integer num){
        return questionService.getQuestionToTypeAndNum(type, num);
    }

    /**
     * 用户插入一条题目
     * @param question
     */
    @RequestMapping(value = "/insertQuestionFromUser")
    @ResponseBody
    public void insertQuestionFromUser(Question question){
        questionService.insertQuestionFromUser(question);
    }

    /**
     * 管理员插入一条题目
     * @param question
     */
    @RequestMapping(value = "/insertQuestionFromAdmin")
    @ResponseBody
    public void insertQuestionFromAdmin(Question question){
        //System.out.println(question.getQtext());
        questionService.insertQuestionFromAdmin(question);
    }

    /**
     * 管理员修改题目状态
     * @param qid
     * @param qstate
     */
    @RequestMapping(value = "/updateQuestionState")
    @ResponseBody
    public void updateQuestionState(BigInteger qid, Integer qstate){
        questionService.updateQuestionState(qid, qstate);
    }

    /**
     * 通过qid修改该题目的所有内容
     * @param question
     */
    @RequestMapping(value = "/updateQuestion")
    public void updateQuestion(Question question){
        questionService.updateQuestion(question);
    }

    /**
     * 获得第一条待审核题目
     * @return 第一条待审核题目
     */
    @RequestMapping(value = "/getQuestionOfExamine")
    @ResponseBody
    public Question getQuestionOfExamine(){
        return questionService.getQuestionOfExamine();
    }

    /**
     * 获得所有待审核题目
     * @return
     */
    @RequestMapping(value = "/getAllQuestionOfExamine")
    @ResponseBody
    public List<Question> getAllQuestionOfExamine(){
        return questionService.getAllQuestionOfExamine();
    }

    /**
     * 通过用户id查询他所有错题
     * @param
     * @return 该用户所有错题
     */
    @RequestMapping(value = "/getAllErrorSet")
    @ResponseBody
    public List<Question> getAllErrorSet(HttpSession session){
        String uid = (String)session.getAttribute("userID");
        return questionService.getAllErrorSet(uid);
    }

    /**
     * 通过qid删除题目
     * @param qid
     */
    @RequestMapping(value = "/deleteQuestion")
    @ResponseBody
    public void deleteQuestion(BigInteger qid){
        questionService.deleteQuestion(qid);
    }
}
