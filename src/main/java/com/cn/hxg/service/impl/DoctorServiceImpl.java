package com.cn.hxg.service.impl;

import com.cn.hxg.dao.DoctorMapper;
import com.cn.hxg.entity.Admin;
import com.cn.hxg.entity.Doctor;
import com.cn.hxg.restful.RestData;
import com.cn.hxg.service.AdminService;
import com.cn.hxg.service.DoctorService;
import com.cn.hxg.utils.MD5;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DoctorServiceImpl implements DoctorService {

    @Autowired
    private DoctorMapper doctorMapper;

    @Autowired
    private AdminService adminService;
    
    public int deleteByPrimaryKey(Integer key) {
        return doctorMapper.deleteByPrimaryKey(key);
    }
    
    public int insert(Doctor record) {
        return doctorMapper.insert(record);
    }
    
    public int insertSelective(Doctor record) {
        return doctorMapper.insertSelective(record);
    }

    public Doctor selectByPrimaryKey(Integer key) {
        return doctorMapper.selectByPrimaryKey(key);
    }

    public int updateByPrimaryKeySelective(Doctor record) {
        return doctorMapper.updateByPrimaryKeySelective(record);
    }

    public int updateByPrimaryKey(Doctor record) {
        return doctorMapper.updateByPrimaryKey(record);
    }

    @Override
    public Doctor getDocByName(String name){
        List<Doctor> doctors = doctorMapper.getDocByName(name);
        if (doctors != null && doctors.size() > 0) {
            return doctors.get(0);
        }
        return null;
    }

    @Override
    public List<Doctor> getDocList(String data){
        return doctorMapper.getDocList(data);
    }

    @Override
    public RestData saveUser(Doctor doctor) throws Exception{
        RestData restData = new RestData();
        this.insert(doctor);

        Admin old = adminService.selectByRole(doctor.getName(),"0");

        if (old != null) {
            throw new Exception("admin 中已经存在该用户");
        }

        Admin admin = new Admin();
        admin.setRole(doctor.getName());
        admin.setUserType("0");
        admin.setPassword(MD5.MD5("123456"));//初始密码
        adminService.insert(admin);
        restData.setSuccess(1);
        return restData;
    }

    @Override
    public RestData delUser(Doctor doctor) throws Exception{
        RestData restData = new RestData();
        this.deleteByPrimaryKey(doctor.getSno());

        Admin admin = adminService.selectByRole(doctor.getName(),"0");

        if (admin == null) {
            throw new Exception("admin 中不存在该用户，删除失败");
        }

        adminService.deleteByName(doctor.getName());
        restData.setSuccess(1);
        return restData;

    }
}