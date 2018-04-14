package com.cn.hxg.controller;

import com.cn.hxg.annotation.LoginRequired;
import com.cn.hxg.base.BaseController;
import com.cn.hxg.entity.Doctor;
import com.cn.hxg.entity.Student;
import com.cn.hxg.restful.RestData;
import com.cn.hxg.service.StudentService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Copyright (C), 2017，hxg Tec.
 * Author: hechengwen
 * Version:
 * Date: 2018/4/11 17:04
 * Description:
 * Others:
 */

@Controller
@RequestMapping("/student")
public class StudentController extends BaseController{

    @Autowired
    private StudentService studentService;

    @RequestMapping("/index")
    @LoginRequired
    public ModelAndView index(){
        return new ModelAndView("student_add");
    }

    @RequestMapping("/insert")
    @ResponseBody
    @LoginRequired
    public RestData insert(Student student){
        RestData rest = new RestData();
        if (StringUtils.isEmpty(student.getName()) || StringUtils.isEmpty(student.getTel())){
            rest.setComment("姓名或手机号不能为空");
            rest.setSuccess(0);
            return rest;
        }

        Student old = studentService.getStuByName(student.getName());
        if (old != null) {
            rest.setComment("该学生已经存在");
            rest.setSuccess(0);
            return rest;
        }

        try {
            rest = studentService.saveUser(student);
        }catch (Exception e) {
            rest.setComment(e.getMessage());
            rest.setSuccess(0);
            return rest;
        }

        rest.setSuccess(1);
        return rest;
    }

    @RequestMapping("/getListStudent")
    @LoginRequired
    public ModelAndView getListStudent(@RequestParam(value = "data",required = false)String req){
        ModelAndView modelAndView = new ModelAndView("student_list");

        List<Student> students = studentService.getStuList(req);

        modelAndView.addObject("students",students);
        return modelAndView;
    }

    @RequestMapping("/delete")
    @ResponseBody
    @LoginRequired
    public RestData delete(String sno) {
        Student student = studentService.selectByPrimaryKey(Integer.valueOf(sno));
        if (student == null) {
            return new RestData(0,"记录不存在","");
        }
        try {
            studentService.delUser(student);
        } catch (Exception e) {
            return new RestData(0,e.getMessage(),null);
        }

        return new RestData(1,null,null);
    }
}
