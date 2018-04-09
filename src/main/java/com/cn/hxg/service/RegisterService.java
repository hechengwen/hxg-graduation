package com.cn.hxg.service;

import com.cn.hxg.entity.Register;

import java.util.List;

public interface RegisterService {

    int deleteByPrimaryKey(Integer key);

    int insert(Register record);

    int insertSelective(Register record);

    Register selectByPrimaryKey(Integer key);

    int updateByPrimaryKeySelective(Register record);

    int updateByPrimaryKey(Register record);

    List<Register> getStudentRegister(String name);

}