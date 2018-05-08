package com.cn.hxg.service.impl;

import com.cn.hxg.entity.RegisterData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.cn.hxg.dao.RegisterMapper;
import com.cn.hxg.entity.Register;
import com.cn.hxg.service.RegisterService;

import java.util.List;

@Service
public class RegisterServiceImpl implements RegisterService {

    @Autowired
    private RegisterMapper registerMapper;
    
    public int deleteByPrimaryKey(Integer key) {
        return registerMapper.deleteByPrimaryKey(key);
    }
    
    public int insert(Register record) {
        return registerMapper.insert(record);
    }
    
    public int insertSelective(Register record) {
        return registerMapper.insertSelective(record);
    }

    public Register selectByPrimaryKey(Integer key) {
        return registerMapper.selectByPrimaryKey(key);
    }

    public int updateByPrimaryKeySelective(Register record) {
        return registerMapper.updateByPrimaryKeySelective(record);
    }

    public int updateByPrimaryKey(Register record) {
        return registerMapper.updateByPrimaryKey(record);
    }

    public List<Register> getStudentRegister(String name){
        return registerMapper.getStudentRegister(name);
    }

    public List<RegisterData> getRegisterList(String serialNumber,String doctorName){
        return registerMapper.getRegisterList(serialNumber,doctorName);
    }
}