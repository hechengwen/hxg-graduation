package com.cn.hxg.dao;

import com.cn.hxg.entity.Student;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface StudentMapper {

    int deleteByPrimaryKey(Integer key);

    int insert(Student record);

    int insertSelective(Student record);

    Student selectByPrimaryKey(Integer key);

    int updateByPrimaryKeySelective(@Param("record") Student record);

    int updateByPrimaryKey(@Param("record") Student record);

    List<Student> getStuByName(@Param("name")String name);

    List<Student> getStuList(@Param("data")String data);

}