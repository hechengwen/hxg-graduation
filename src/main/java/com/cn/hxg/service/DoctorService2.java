package com.cn.hxg.service;

import java.util.List;

import com.cn.hxg.entity.Doctor;
import com.cn.hxg.restful.RestData;

public interface DoctorService2 {
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
