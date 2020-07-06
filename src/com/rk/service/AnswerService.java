package com.rk.service;

import com.rk.dao.AnswerDao;
import com.rk.po.Error;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigInteger;

@Service
@Transactional
public class AnswerService {

    @Autowired
    private AnswerDao answerDao;

    /**
     * 查询答案是否正确
     * @param qid
     * @param qanswer
     * @return qid or null
     */
    public BigInteger TFanswer(BigInteger qid, Integer qanswer){
        return answerDao.TFanswer(qid, qanswer);
    }

    /**
     * 将错题插入错题集
     * @param error
     */
    public void insertError(Error error){
        answerDao.insertError(error);
    }
}
