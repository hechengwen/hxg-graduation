package com.cn.hxg.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.cn.hxg.dao.DoctorMapper;
import com.cn.hxg.entity.Doctor;
import com.cn.hxg.service.DoctorService;

@Service
public class DoctorServiceImpl implements DoctorService {

    @Autowired
    private DoctorMapper doctorMapper;
    
    public int deleteByPrimaryKey(String key) {
        return doctorMapper.deleteByPrimaryKey(key);
    }
    
    public int insert(Doctor record) {
        return doctorMapper.insert(record);
    }
    
    public int insertSelective(Doctor record) {
        return doctorMapper.insertSelective(record);
    }

    public Doctor selectByPrimaryKey(String key) {
        return doctorMapper.selectByPrimaryKey(key);
    }

    public int updateByPrimaryKeySelective(Doctor record) {
        return doctorMapper.updateByPrimaryKeySelective(record);
    }

    public int updateByPrimaryKey(Doctor record) {
        return doctorMapper.updateByPrimaryKey(record);
    }
}