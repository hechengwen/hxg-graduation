package com.cn.hxg.service.impl;

import com.cn.hxg.entity.Register;
import com.cn.hxg.restful.RestData;
import com.cn.hxg.service.RegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.cn.hxg.dao.MedicalRecordsMapper;
import com.cn.hxg.entity.MedicalRecords;
import com.cn.hxg.service.MedicalRecordsService;

import java.util.List;

@Service
public class MedicalRecordsServiceImpl implements MedicalRecordsService {

    @Autowired
    private MedicalRecordsMapper medicalRecordsMapper;

    @Autowired
    private RegisterService registerService;
    
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

    public List<MedicalRecords> getList(String role,String serialNumber){
        return medicalRecordsMapper.getList(role,serialNumber);
    }

    public RestData update(MedicalRecords record){
        this.insert(record);
        Register register = new Register();
        register.setStatus("1");
        register.setSerialNumber(record.getSerialNumber());
        registerService.updateByPrimaryKeySelective(register);
        return new RestData(1,"success",null);
    }
}