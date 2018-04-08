package com.cn.hxg.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.cn.hxg.dao.StudentMapper;
import com.cn.hxg.entity.Student;
import com.cn.hxg.service.StudentService;

@Service
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentMapper studentMapper;
    
    public int deleteByPrimaryKey(String key) {
        return studentMapper.deleteByPrimaryKey(key);
    }
    
    public int insert(Student record) {
        return studentMapper.insert(record);
    }
    
    public int insertSelective(Student record) {
        return studentMapper.insertSelective(record);
    }

    public Student selectByPrimaryKey(String key) {
        return studentMapper.selectByPrimaryKey(key);
    }

    public int updateByPrimaryKeySelective(Student record) {
        return studentMapper.updateByPrimaryKeySelective(record);
    }

    public int updateByPrimaryKey(Student record) {
        return studentMapper.updateByPrimaryKey(record);
    }
}