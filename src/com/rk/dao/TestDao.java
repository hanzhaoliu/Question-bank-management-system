package com.rk.dao;

import com.rk.po.Test;

import java.util.List;

public interface TestDao {

    /**
     * 通过uid获取用户做题的记录
     * @param uid
     * @return
     */
    public List<Test> getTestsByUid(String uid);


    /**
     * 插入用户的做题记录
     * @param test
     */
    public void insertTest(Test test);

}
