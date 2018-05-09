package com.cn.hxg.dao;

import com.cn.hxg.entity.MedicalRecords;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MedicalRecordsMapper {

    int deleteByPrimaryKey(String key);

    int insert(MedicalRecords record);

    int insertSelective(MedicalRecords record);

    MedicalRecords selectByPrimaryKey(String key);

    int updateByPrimaryKeySelective(@Param("record") MedicalRecords record);

    int updateByPrimaryKey(@Param("record") MedicalRecords record);

    List<MedicalRecords> getList(@Param("data")String data,@Param("serialNumber")String serialNumber);

}