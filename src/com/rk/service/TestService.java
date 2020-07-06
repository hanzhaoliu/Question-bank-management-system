package com.rk.service;

import com.rk.dao.TestDao;
import com.rk.po.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
@Transactional
public class TestService {


    @Autowired
    private TestDao testDao;

    /**
     * 通过uid获取用户做题的记录
     * @param uid
     * @return
     */
    public List<Test> getTestsByUid(String uid){
        return testDao.getTestsByUid(uid);
    }


    /**
     * 插入用户的做题记录
     * @param test
     */
    public void insertTest(Test test){
        testDao.insertTest(test);
    }

}
