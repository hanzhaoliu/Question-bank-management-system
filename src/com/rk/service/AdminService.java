package com.rk.service;

import com.rk.dao.AdminDao;
import com.rk.po.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class AdminService {

    @Autowired
    private AdminDao adminDao;

    /**
     * 验证管理员身份
     * @param admin
     * @return aid
     */
    public String adminLogin(Admin admin){
        return adminDao.adminLogin(admin);
    }
}
