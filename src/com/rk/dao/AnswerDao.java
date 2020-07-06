package com.rk.dao;

import com.rk.po.Error;
import org.apache.ibatis.annotations.Param;

import java.math.BigInteger;

public interface AnswerDao {

    /**
     * 查询答案是否正确
     * @param qid
     * @param qanswer
     * @return qid or null
     */
    public BigInteger TFanswer(@Param("qid") BigInteger qid, @Param("qanswer") Integer qanswer);

    /**
     * 将错题插入错题集
     * @param error
     */
    public void insertError(Error error);
}
