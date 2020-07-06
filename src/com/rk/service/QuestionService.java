package com.rk.service;

import com.rk.dao.QuestionDao;
import com.rk.po.Question;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigInteger;
import java.util.List;

@Service
@Transactional
public class QuestionService {

    @Autowired
    private QuestionDao questionDao;

    /**
     * 获得数据库所有题目
     * @return 数据库所有题
     */
    public List<Question> getAllQuestion(){
        return questionDao.getAllQuestion();
    }

    /**
     * 获得一道id>num题目
     * @return 一道题目
     */
    public Question getQuestion(Integer num){
        return questionDao.getQuestion(num);
    }

    /**
     * 获得一道id>num有效题目
     * @param num
     * @return 一道有效题目
     */
    public Question getEffectiveQuestion(Integer num){
        return questionDao.getEffectiveQuestion(num);
    }

    /**
     * 获得一道id<num有效题目
     * @param num
     * @return 一道有效题目
     */
    public Question getEffectiveUpQuestion(Integer num){
        return questionDao.getEffectiveUpQuestion(num);
    }

    /**
     * 随机获得数据库num条题目
     * @param num
     * @return num条题目
     */
    public List<Question> getQuestionToNum(Integer num){
        return questionDao.getQuestionToNum(num);
    }

    /**
     * 随机获得数据库type类型num条题目
     * @param type
     * @param num
     * @return type类型num条题目
     */
    public List<Question> getQuestionToTypeAndNum(Integer type, Integer num){
        return questionDao.getQuestionToTypeAndNum(type, num);
    }

    /**
     * 用户插入一条题目
     * @param question
     */
    public void insertQuestionFromUser(Question question){
        questionDao.insertQuestionFromUser(question);
    }

    /**
     * 管理员插入一条题目
     * @param question
     */
    public void insertQuestionFromAdmin(Question question){
        questionDao.insertQuestionFromAdmin(question);
    }

    /**
     * 管理员修改题目状态
     * @param qid
     * @param qstate
     */
    public void updateQuestionState(BigInteger qid, Integer qstate){
        questionDao.updateQuestionState(qid, qstate);
    }

    /**
     * 通过qid修改该题目的所有内容
     * @param question
     */
    public void updateQuestion(Question question){
        questionDao.updateQuestion(question);
    }

    /**
     * 获得第一条待审核题目
     * @return 第一条待审核题目
     */
    public Question getQuestionOfExamine(){
        return questionDao.getQuestionOfExamine();
    }

    /**
     * 获得所有待审核题目
     * @return
     */
    public List<Question> getAllQuestionOfExamine(){
        return questionDao.getAllQuestionOfExamine();
    }

    /**
     * 通过用户id查询他所有错题
     * @param uid
     * @return 该用户所有错题
     */
    public List<Question> getAllErrorSet(String uid){
        return questionDao.getAllErrorSet(uid);
    }

    /**
     * 通过qid删除题目
     * @param qid
     */
    public void deleteQuestion(BigInteger qid){
        questionDao.deleteQuestion(qid);
    }
}
