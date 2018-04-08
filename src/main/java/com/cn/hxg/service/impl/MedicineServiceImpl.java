package com.cn.hxg.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.cn.hxg.dao.MedicineMapper;
import com.cn.hxg.entity.Medicine;
import com.cn.hxg.service.MedicineService;

@Service
public class MedicineServiceImpl implements MedicineService {

    @Autowired
    private MedicineMapper medicineMapper;
    
    public int deleteByPrimaryKey(String key) {
        return medicineMapper.deleteByPrimaryKey(key);
    }
    
    public int insert(Medicine record) {
        return medicineMapper.insert(record);
    }
    
    public int insertSelective(Medicine record) {
        return medicineMapper.insertSelective(record);
    }

    public Medicine selectByPrimaryKey(String key) {
        return medicineMapper.selectByPrimaryKey(key);
    }

    public int updateByPrimaryKeySelective(Medicine record) {
        return medicineMapper.updateByPrimaryKeySelective(record);
    }

    public int updateByPrimaryKey(Medicine record) {
        return medicineMapper.updateByPrimaryKey(record);
    }
}