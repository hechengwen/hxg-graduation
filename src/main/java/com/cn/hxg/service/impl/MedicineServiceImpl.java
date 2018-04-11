package com.cn.hxg.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.cn.hxg.dao.MedicineMapper;
import com.cn.hxg.entity.Medicine;
import com.cn.hxg.service.MedicineService;

import java.util.List;

@Service
public class MedicineServiceImpl implements MedicineService {

    @Autowired
    private MedicineMapper medicineMapper;
    
    public int deleteByPrimaryKey(int key) {
        return medicineMapper.deleteByPrimaryKey(key);
    }
    
    public int insert(Medicine record) {
        return medicineMapper.insert(record);
    }
    
    public int insertSelective(Medicine record) {
        return medicineMapper.insertSelective(record);
    }

    public Medicine selectByPrimaryKey(int key) {
        return medicineMapper.selectByPrimaryKey(key);
    }

    public int updateByPrimaryKeySelective(Medicine record) {
        return medicineMapper.updateByPrimaryKeySelective(record);
    }

    public int updateByPrimaryKey(Medicine record) {
        return medicineMapper.updateByPrimaryKey(record);
    }

    public int getAllTotal(){
        return medicineMapper.getAllTotal();
    }

    public List getAll(Integer pageNum, Integer pageSize,String data){
        return medicineMapper.getAll(pageNum,pageSize,data);
    }
}