package com.cn.hxg.dao;

import com.cn.hxg.entity.Student;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface StudentMapper {

    int deleteByPrimaryKey(String key);

    int insert(Student record);

    int insertSelective(Student record);

    Student selectByPrimaryKey(String key);

    int updateByPrimaryKeySelective(@Param("record") Student record);

    int updateByPrimaryKey(@Param("record") Student record);

}