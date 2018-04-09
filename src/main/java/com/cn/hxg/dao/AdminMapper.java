package com.cn.hxg.dao;

import com.cn.hxg.entity.Admin;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AdminMapper {

    int deleteByPrimaryKey(String key);

    int insert(Admin record);

    int insertSelective(Admin record);

    Admin selectByPrimaryKey(String key);

    int updateByPrimaryKeySelective(@Param("record") Admin record);

    int updateByPrimaryKey(@Param("record") Admin record);

    List<Admin> selectByRole(@Param("role")String role,@Param("userType")String userType);

}