package com.cn.hxg.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.cn.hxg.dao.MedicalRecordsMapper;
import com.cn.hxg.entity.MedicalRecords;
import com.cn.hxg.service.MedicalRecordsService;

@Service
public class MedicalRecordsServiceImpl implements MedicalRecordsService {

    @Autowired
    private MedicalRecordsMapper medicalRecordsMapper;
    
    public int deleteByPrimaryKey(String key) {
        return medicalRecordsMapper.deleteByPrimaryKey(key);
    }
    
    public int insert(MedicalRecords record) {
        return medicalRecordsMapper.insert(record);
    }
    
    public int insertSelective(MedicalRecords record) {
        return medicalRecordsMapper.insertSelective(record);
    }

    public MedicalRecords selectByPrimaryKey(String key) {
        return medicalRecordsMapper.selectByPrimaryKey(key);
    }

    public int updateByPrimaryKeySelective(MedicalRecords record) {
        return medicalRecordsMapper.updateByPrimaryKeySelective(record);
    }

    public int updateByPrimaryKey(MedicalRecords record) {
        return medicalRecordsMapper.updateByPrimaryKey(record);
    }
}