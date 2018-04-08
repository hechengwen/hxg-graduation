package com.cn.hxg.dao;

import com.cn.hxg.entity.Medicine;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface MedicineMapper {

    int deleteByPrimaryKey(String key);

    int insert(Medicine record);

    int insertSelective(Medicine record);

    Medicine selectByPrimaryKey(String key);

    int updateByPrimaryKeySelective(@Param("record") Medicine record);

    int updateByPrimaryKey(@Param("record") Medicine record);

}