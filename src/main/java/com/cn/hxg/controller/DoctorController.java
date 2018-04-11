package com.cn.hxg.controller;

import com.cn.hxg.entity.Doctor;
import com.cn.hxg.service.DoctorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;

/**
 * Copyright (C), 2017，jumore Tec.
 * Author: hechengwen
 * Version:
 * Date: 2018/4/8 19:12
 * Description:
 * Others:
 */
@Controller
@RequestMapping("doctor")
public class DoctorController {

    @Autowired
    private DoctorService doctorService;

    @RequestMapping("/insert")
    public void insert(){
        Doctor doctor = new Doctor();
        doctor.setEmail("hangzhou@qq.com");
        doctor.setSex("man");
        doctor.setTel("17710363894");
        doctorService.insert(doctor);
    }
}
