package com.cn.hxg.controller;

import com.cn.hxg.annotation.LoginRequired;
import com.cn.hxg.base.BaseController;
import com.cn.hxg.entity.Admin;
import com.cn.hxg.entity.Register;
import com.cn.hxg.restful.RestData;
import com.cn.hxg.service.RegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.List;

/**
 * Copyright (C), 2017，jumore Tec.
 * Author: hechengwen
 * Version:
 * Date: 2018/4/9 16:25
 * Description:
 * Others:挂号控制器
 */
@Controller
@RequestMapping(value = "/register")
public class RegisterContorller extends BaseController {

    @RequestMapping(value = "index")
    @LoginRequired
    public ModelAndView index(){
        return new ModelAndView("guahao_add");
    }

    @Autowired
    private RegisterService registerService;

    @RequestMapping("insert")
    @LoginRequired
    public String insert(Register register) {

        Admin admin = (Admin) getRequest().getSession().getAttribute("userInfo");

        register.setRegistrationTime(new Date());
        register.setName(admin.getRole());//学生姓名

        registerService.insert(register);

        return "redirect:/admin/stuMain";
    }

    @RequestMapping(value = "getStudentRegister")
    @LoginRequired
    @ResponseBody
    public RestData getStudentRegister(){
        RestData restData = new RestData();

        Admin admin = (Admin) getRequest().getSession().getAttribute("userInfo");

        List<Register> registers = registerService.getStudentRegister(admin.getRole());

        restData.setData(registers);
        return restData;
    }
}
