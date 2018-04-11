package com.cn.hxg.service;

import com.cn.hxg.entity.Admin;

public interface AdminService {

    int deleteByPrimaryKey(String key);

    int deleteByName(String name);

    int insert(Admin record);

    int insertSelective(Admin record);

    Admin selectByPrimaryKey(String key);

    int updateByPrimaryKeySelective(Admin record);

    int updateByPrimaryKey(Admin record);

    Admin selectByRole(String role,String userType);

}