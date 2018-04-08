package com.cn.hxg.service;

import com.cn.hxg.entity.Doctor;

public interface DoctorService {

    int deleteByPrimaryKey(String key);

    int insert(Doctor record);

    int insertSelective(Doctor record);

    Doctor selectByPrimaryKey(String key);

    int updateByPrimaryKeySelective(Doctor record);

    int updateByPrimaryKey(Doctor record);

}