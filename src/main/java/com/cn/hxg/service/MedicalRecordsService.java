package com.cn.hxg.service;

import com.cn.hxg.entity.MedicalRecords;

public interface MedicalRecordsService {

    int deleteByPrimaryKey(String key);

    int insert(MedicalRecords record);

    int insertSelective(MedicalRecords record);

    MedicalRecords selectByPrimaryKey(String key);

    int updateByPrimaryKeySelective(MedicalRecords record);

    int updateByPrimaryKey(MedicalRecords record);

}