package com.rk.service;

import com.rk.dao.UserDao;
import com.rk.po.Question;
import com.rk.po.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class UserService {

    @Autowired
    private UserDao userDao;

    /**
     * 验证用户正确性
     * @param user
     * @return Uid or null
     */
    public String loginValidate(User user){
        return userDao.loginValidate(user);
    }

    /**
     * 通过Uid获取用户信息
     * @param uid
     * @return 用户信息
     */
    public User getUser(String uid){
        return userDao.getUser(uid);
    }

    /**
     * 验证账号是否存在
     * @param uid
     * @return Uid or null
     */
    public String validateUser(String uid){
        return userDao.validateUser(uid);
    }

    /**
     * 插入新用户
     * @param user
     */
    public void insertUser(User user){
        userDao.insertUser(user);
    }

    /**
     * 通过Uid修改Uname
     * @param user
     */
    public void updateUserName(User user){
        userDao.updateUserName(user);
    }

    /**
     * 通过Uid修改Upwd
     * @param user
     */
    public void updateUserPwd(User user){
        userDao.updateUserPwd(user);
    }

    /**
     * 通过Uid查询错题集
     * @param uid
     * @return 错题集
     */
    public List<Question> getErrorSet(String uid){
        return userDao.getErrorSet(uid);
    }

}
