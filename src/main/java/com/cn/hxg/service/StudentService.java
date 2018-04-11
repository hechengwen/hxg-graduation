package com.cn.hxg.service;

import com.cn.hxg.entity.Student;
import com.cn.hxg.restful.RestData;

import java.util.List;

public interface StudentService {

    int deleteByPrimaryKey(Integer key);

    int insert(Student record);

    int insertSelective(Student record);

    Student selectByPrimaryKey(Integer key);

    int updateByPrimaryKeySelective(Student record);

    int updateByPrimaryKey(Student record);

    Student getStuByName(String name);

    RestData saveUser(Student student) throws Exception;

    List<Student> getStuList(String data);

    RestData delUser(Student student) throws Exception;
}