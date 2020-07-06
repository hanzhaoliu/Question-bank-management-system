package com.rk.dao;

import com.rk.po.Question;
import com.rk.po.User;

import java.util.List;

public interface UserDao {

    /**
     * 验证用户正确性
     * @param user
     * @return Uid or null
     */
    public String loginValidate(User user);

    /**
     * 通过Uid获取用户信息
     * @param uid
     * @return 用户信息
     */
    public User getUser(String uid);

    /**
     * 验证账号是否存在
     * @param uid
     * @return Uid or null
     */
    public String validateUser(String uid);

    /**
     * 插入新用户
     * @param user
     */
    public void insertUser(User user);

    /**
     * 通过Uid修改Uname
     * @param user
     */
    public void updateUserName(User user);

    /**
     * 通过Uid修改Upwd
     * @param user
     */
    public void updateUserPwd(User user);

    /**
     * 通过Uid查询错题集
     * @param uid
     * @return 错题集
     */
    public List<Question> getErrorSet(String uid);

}
