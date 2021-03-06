package com.cn.hxg.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.cn.hxg.dao.AdminMapper;
import com.cn.hxg.entity.Admin;
import com.cn.hxg.service.AdminService;

import java.util.Collections;
import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {

    private Logger logger = LoggerFactory.getLogger(getClass());

    @Autowired
    private AdminMapper adminMapper;

    public int deleteByPrimaryKey(Integer key) {
        return adminMapper.deleteByPrimaryKey(key);
    }
    @Override
    public int deleteByName(String name) {
        return adminMapper.deleteByName(name);
    }

    public int insert(Admin record) {
        return adminMapper.insert(record);
    }

    public int insertSelective(Admin record) {
        return adminMapper.insertSelective(record);
    }

    public Admin selectByPrimaryKey(Integer key) {
        return adminMapper.selectByPrimaryKey(key);
    }

    public int updateByPrimaryKeySelective(Admin record) {
        return adminMapper.updateByPrimaryKeySelective(record);
    }

    public int updateByPrimaryKey(Admin record) {
        return adminMapper.updateByPrimaryKey(record);
    }

    @Override
    public Admin selectByRole(String role,String userType) {
        List<Admin> admins = null;
        try {
            admins = adminMapper.selectByRole(role,userType);
        } catch (Exception e) {
            logger.error(e.getMessage());
            return null;
        }
        if (admins.size() == 0 || admins == null) {
            return null;
        }
        return admins.get(0);
    }
}