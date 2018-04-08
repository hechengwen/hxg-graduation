package com.cn.hxg.service;

import com.cn.hxg.entity.Student;

public interface StudentService {

    int deleteByPrimaryKey(String key);

    int insert(Student record);

    int insertSelective(Student record);

    Student selectByPrimaryKey(String key);

    int updateByPrimaryKeySelective(Student record);

    int updateByPrimaryKey(Student record);

}