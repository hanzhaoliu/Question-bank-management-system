package com.rk.dao;

import com.rk.po.Admin;

public interface AdminDao {

    /**
     * 验证管理员身份
     * @param admin
     * @return aid
     */
    public String adminLogin(Admin admin);
}
