package com.cn.hxg.controller;

import com.cn.hxg.base.BaseController;
import com.cn.hxg.entity.Admin;
import com.cn.hxg.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Copyright (C), 2017，jumore Tec.
 * Author: hechengwen
 * Version:
 * Date: 2018/4/8 17:42
 * Description:
 * Others:
 */
@RequestMapping("admin")
@Controller
public class AdminController extends BaseController{

    @Autowired
    private AdminService adminService;

    @RequestMapping("/test")
    public void test(){
        Admin admin = new Admin();
        admin.setPassword("123546");
        admin.setRole("admin");
        adminService.insert(admin);
    }
}


