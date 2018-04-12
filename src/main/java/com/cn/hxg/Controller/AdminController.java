package com.cn.hxg.controller;

import com.cn.hxg.annotation.LoginRequired;
import com.cn.hxg.base.BaseController;
import com.cn.hxg.entity.Admin;
import com.cn.hxg.entity.Doctor;
import com.cn.hxg.entity.StuAndDoc;
import com.cn.hxg.entity.Student;
import com.cn.hxg.restful.RestData;
import com.cn.hxg.service.AdminService;
import com.cn.hxg.service.DoctorService;
import com.cn.hxg.service.StudentService;
import com.cn.hxg.utils.MD5;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.management.relation.Role;

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
public class AdminController extends BaseController {

    @Autowired
    private AdminService adminService;

    @Autowired
    private DoctorService doctorService;

    @Autowired
    private StudentService studentService;

    @RequestMapping("persionalInfo")
    @LoginRequired
    public ModelAndView persionalInfo() {
        ModelAndView modelAndView = new ModelAndView("gerenxinxi");
        Admin admin = (Admin) getRequest().getSession().getAttribute("userInfo");

        Doctor doctor = doctorService.getDocByName(admin.getRole());
        modelAndView.addObject("doctor", doctor);
        return modelAndView;
    }

    @RequestMapping(value = "modifyIndex")
    @LoginRequired
    public ModelAndView modifyIndex() {
        ModelAndView modelAndView = new ModelAndView("modify_psd");
        return modelAndView;
    }

    @RequestMapping(value = "oldPassword")
    @LoginRequired
    @ResponseBody
    public RestData oldPasswordCheck(String oldPassword) {
        RestData restData = new RestData();
        Admin admin = (Admin) getRequest().getSession().getAttribute("userInfo");

        if (!MD5.MD5(oldPassword.trim()).equals(admin.getPassword())) {
            return restData;
        }
        restData.setSuccess(1);
        return restData;
    }

    @RequestMapping("modifyPassword")
    @ResponseBody
    @LoginRequired
    public RestData modifyPassword(String newPassword,String again) {
        RestData restData = new RestData();

        if (StringUtils.isEmpty(newPassword) || StringUtils.isEmpty(again)) {
            restData.setComment("新密码不能为空");
            return restData;
        }

        if (!newPassword.equals(again)) {
            restData.setComment("两次密码输入不一致");
            return restData;
        }

        Admin admin = (Admin) getRequest().getSession().getAttribute("userInfo");

        if (MD5.MD5(newPassword).equals(admin.getPassword())) {
            restData.setComment("新密码不能与老密码相同");
            return restData;
        }

        admin.setPassword(MD5.MD5(newPassword));

        adminService.updateByPrimaryKeySelective(admin);

        // 修改密码后退出登录
        getRequest().getSession().invalidate();

        restData.setSuccess(1);
        return restData;
    }

    @RequestMapping("/insert")
    @ResponseBody
    @LoginRequired
    public RestData insert(StuAndDoc stuAndDoc) {
        RestData restData = new RestData();

        String username = stuAndDoc.getUsername();
        String password = stuAndDoc.getPassword();
        String userType = stuAndDoc.getUserType();
        if (StringUtils.isBlank(username) || StringUtils.isBlank(password) || StringUtils.isBlank(userType)) {
            restData.setComment("用户名或密码不能为空");
            restData.setSuccess(0);
            return restData;
        }

        Admin admin = adminService.selectByRole(username, userType);
        if (admin != null) {
            restData.setComment("用户已经存在");
            restData.setSuccess(0);
            return restData;
        }

        Admin admin1 = new Admin();
        admin1.setPassword(MD5.MD5(password));
        admin1.setRole(username);
        admin1.setUserType(userType);
        adminService.insert(admin1);

        // 管理员和医生
        if ("0".equals(userType)) {
            Doctor doctor = new Doctor();
            doctor.setTel(stuAndDoc.getTel());
            doctor.setSex(stuAndDoc.getSex());
            doctor.setEmail(stuAndDoc.getEmail());
            doctor.setBirth(stuAndDoc.getBirth());
            doctor.setName(stuAndDoc.getUsername());
            doctor.setCynf(stuAndDoc.getCynf());

            doctorService.insert(doctor);
            // 学生
        } else if ("1".equals(userType)) {
            Student student = new Student();
            student.setName(stuAndDoc.getUsername());
            student.setSex(stuAndDoc.getSex());
            student.setBirth(stuAndDoc.getBirth());
            student.setRxsj(stuAndDoc.getRxsj());
            student.setXz(stuAndDoc.getXz());
            student.setBj(stuAndDoc.getBj());
            student.setRoom(stuAndDoc.getRoom());
            student.setTel(stuAndDoc.getTel());
            student.setEmail(stuAndDoc.getEmail());

            studentService.insert(student);

        }

        restData.setSuccess(1);
        return restData;
    }

    @RequestMapping("index")
    public String index() {
        Admin admin = (Admin) getRequest().getSession().getAttribute("userInfo");
        if (admin == null) {
            return "index";
        }
        return "redirect:/admin/stuMain";
    }

    @RequestMapping(value = "login")
    @ResponseBody
    public RestData login(String username, String password, String userType) {

        RestData restData = new RestData();

        if (StringUtils.isBlank(username) || StringUtils.isBlank(password)) {
            restData.setComment("用户名或密码不能为空");
            restData.setSuccess(0);
            return restData;
        }

        Admin admin = adminService.selectByRole(username, userType);

        if (admin == null) {
            restData.setComment("用户名不存在");
            restData.setSuccess(0);
            return restData;
        }

        if (!MD5.MD5(password.trim()).equals(admin.getPassword())) {
            logger.info("密码错误...");
            restData.setComment("密码错误");
            restData.setSuccess(0);
            return restData;
        }

        // 登陆成功设置session
        getRequest().getSession().setAttribute("userInfo", admin);
        getRequest().getSession().setAttribute("g_name", admin.getRole());

        restData.setSuccess(1);
        restData.setData(userType);
        return restData;
    }

    @RequestMapping(value = "/logout")
    @LoginRequired
    public ModelAndView logout() {
        getRequest().getSession().invalidate();
        return new ModelAndView("index");
    }

    @RequestMapping(value = "/sysMain")
    @LoginRequired
    public ModelAndView sysMain() {
        ModelAndView model = new ModelAndView("main");

        Admin admin = (Admin) getRequest().getSession().getAttribute("userInfo");

        model.addObject("username", admin.getRole());

        return model;
    }

    @RequestMapping(value = "/stuMain")
    @LoginRequired
    public ModelAndView stuMain() {
        ModelAndView model = new ModelAndView("stu_main");

        Admin admin = (Admin) getRequest().getSession().getAttribute("userInfo");

        model.addObject("username", admin.getRole());

        return model;
    }
}


