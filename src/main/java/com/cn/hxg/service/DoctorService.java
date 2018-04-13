package com.cn.hxg.service;

import com.cn.hxg.entity.Doctor;
import com.cn.hxg.restful.RestData;

import java.util.List;

public interface DoctorService {

    int deleteByPrimaryKey(Integer key);

    int insert(Doctor record);

    int insertSelective(Doctor record);

    Doctor selectByPrimaryKey(Integer key);

    int updateByPrimaryKeySelective(Doctor record);

    int updateByPrimaryKey(Doctor record);

    Doctor getDocByName(String name);

    List<Doctor> getDocList(String data);

    List<Doctor> getDocByDep(String department);

    RestData saveUser(Doctor doctor) throws Exception;

    RestData delUser(Doctor doctor) throws Exception;
}