package com.cn.hxg.service.impl;

import com.cn.hxg.entity.Admin;
import com.cn.hxg.entity.Doctor;
import com.cn.hxg.restful.RestData;
import com.cn.hxg.service.AdminService;
import com.cn.hxg.utils.MD5;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.cn.hxg.dao.StudentMapper;
import com.cn.hxg.entity.Student;
import com.cn.hxg.service.StudentService;

import java.util.List;

@Service
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentMapper studentMapper;
    @Autowired
    private AdminService adminService;

    public int deleteByPrimaryKey(Integer key) {
        return studentMapper.deleteByPrimaryKey(key);
    }

    public int insert(Student record) {
        return studentMapper.insert(record);
    }

    public int insertSelective(Student record) {
        return studentMapper.insertSelective(record);
    }

    public Student selectByPrimaryKey(Integer key) {
        return studentMapper.selectByPrimaryKey(key);
    }

    public int updateByPrimaryKeySelective(Student record) {
        return studentMapper.updateByPrimaryKeySelective(record);
    }

    public int updateByPrimaryKey(Student record) {
        return studentMapper.updateByPrimaryKey(record);
    }

    @Override
    public Student getStuByName(String name) {
        List<Student> students = studentMapper.getStuByName(name);
        if (students != null && students.size() > 0) {
            return students.get(0);
        }
        return null;
    }

    @Override
    public RestData saveUser(Student student) throws Exception{
        RestData restData = new RestData();
        this.insert(student);

        Admin old = adminService.selectByRole(student.getName(),"1");

        if (old != null) {
            throw new Exception("admin 中已经存在该用户");
        }

        Admin admin = new Admin();
        admin.setUserType("1");
        admin.setRole(student.getName());
        admin.setPassword(MD5.MD5("123456"));//初始密码
        adminService.insert(admin);
        restData.setSuccess(1);
        return restData;
    }

    @Override
    public List<Student> getStuList(String data){
        return studentMapper.getStuList(data);
    }

    @Override
    public RestData delUser(Student student) throws Exception{
        RestData restData = new RestData();
        this.deleteByPrimaryKey(student.getSno());

        Admin admin = adminService.selectByRole(student.getName(),"1");

        if (admin == null) {
            throw new Exception("admin 中不存在该用户，删除失败");
        }

        adminService.deleteByName(student.getName());
        restData.setSuccess(1);
        return restData;
    }
}