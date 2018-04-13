package com.cn.hxg.dao;

import com.cn.hxg.entity.Doctor;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DoctorMapper {

    int deleteByPrimaryKey(Integer key);

    int insert(Doctor record);

    int insertSelective(Doctor record);

    Doctor selectByPrimaryKey(Integer key);

    int updateByPrimaryKeySelective(@Param("record") Doctor record);

    int updateByPrimaryKey(@Param("record") Doctor record);

    List<Doctor> getDocByName(@Param("name")String name);

    List<Doctor> getDocList(@Param("data")String data);

    List<Doctor> getDocByDep(@Param("department")String department);

}