package com.cn.hxg.dao;

import com.cn.hxg.entity.Medicine;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MedicineMapper {

    int deleteByPrimaryKey(int key);

    int insert(Medicine record);

    int insertSelective(Medicine record);

    Medicine selectByPrimaryKey(int key);

    int updateByPrimaryKeySelective(@Param("record") Medicine record);

    int updateByPrimaryKey(@Param("record") Medicine record);

    List getAll(@Param("pageNum")Integer pageNum,@Param("pageSize")Integer pageSize,@Param("data") String data);

    int getAllTotal();

}