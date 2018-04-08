package com.cn.hxg.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.cn.hxg.dao.AdminMapper;
import com.cn.hxg.entity.Admin;
import com.cn.hxg.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;
    
    public int deleteByPrimaryKey(String key) {
        return adminMapper.deleteByPrimaryKey(key);
    }
    
    public int insert(Admin record) {
        return adminMapper.insert(record);
    }
    
    public int insertSelective(Admin record) {
        return adminMapper.insertSelective(record);
    }

    public Admin selectByPrimaryKey(String key) {
        return adminMapper.selectByPrimaryKey(key);
    }

    public int updateByPrimaryKeySelective(Admin record) {
        return adminMapper.updateByPrimaryKeySelective(record);
    }

    public int updateByPrimaryKey(Admin record) {
        return adminMapper.updateByPrimaryKey(record);
    }
}