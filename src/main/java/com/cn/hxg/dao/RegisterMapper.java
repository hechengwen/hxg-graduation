package com.cn.hxg.dao;

import com.cn.hxg.entity.Register;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface RegisterMapper {

    int deleteByPrimaryKey(Integer key);

    int insert(Register record);

    int insertSelective(Register record);

    Register selectByPrimaryKey(Integer key);

    int updateByPrimaryKeySelective(@Param("record") Register record);

    int updateByPrimaryKey(@Param("record") Register record);

}