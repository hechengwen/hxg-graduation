package com.cn.hxg.dao;

import com.cn.hxg.entity.Doctor;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface DoctorMapper {

    int deleteByPrimaryKey(String key);

    int insert(Doctor record);

    int insertSelective(Doctor record);

    Doctor selectByPrimaryKey(String key);

    int updateByPrimaryKeySelective(@Param("record") Doctor record);

    int updateByPrimaryKey(@Param("record") Doctor record);

}