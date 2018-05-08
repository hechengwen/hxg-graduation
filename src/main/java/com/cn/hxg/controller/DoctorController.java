package com.cn.hxg.controller;

import com.cn.hxg.annotation.LoginRequired;
import com.cn.hxg.base.BaseController;
import com.cn.hxg.entity.Doctor;
import com.cn.hxg.restful.RestData;
import com.cn.hxg.service.DoctorService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Date;
import java.util.List;

/**
 * Copyright (C), 2017，hxg Tec.
 * Author: huxiaogang
 * Version:
 * Date: 2018/4/8 19:12
 * Description:
 * Others:
 */
@Controller
@RequestMapping("/doctor")
public class DoctorController extends BaseController{

    @Autowired
    private DoctorService doctorService;

    @RequestMapping("/index")
    @LoginRequired
    public ModelAndView index(){
        return new ModelAndView("yishi_add");
    }

    /**
     * ajax 增加医师
     * @param doctor
     * @return
     */
    @RequestMapping("/insert")
    @ResponseBody
    @LoginRequired
    public RestData insert(Doctor doctor){
        RestData rest = new RestData();

        if (StringUtils.isEmpty(doctor.getName()) || StringUtils.isEmpty(doctor.getTel())){
            rest.setComment("姓名或手机号不能为空");
            rest.setSuccess(0);
            return rest;
        }

        Doctor old = doctorService.getDocByName(doctor.getName());
        if (old != null) {
            rest.setComment("该医师已经存在");
            rest.setSuccess(0);
            return rest;
        }

        try {
            rest = doctorService.saveUser(doctor);
        }catch (Exception e) {
            rest.setSuccess(0);
            rest.setComment(e.getMessage());
            return rest;
        }

        rest.setSuccess(1);
        return rest;
    }


    /**
     * 按照sno或name（模糊查询）查询医师列表
     * @param req
     * @return
     */
    @RequestMapping("/getListDoctor")
    @LoginRequired
    public ModelAndView getListDoctor(@RequestParam(value = "data",required = false)String req){
        ModelAndView modelAndView = new ModelAndView("yishi_list");

        List<Doctor> doctors = doctorService.getDocList(req);

        modelAndView.addObject("doctors",doctors);

        return modelAndView;
    }

    /**
     * 删除医师
     * @param sno
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    @LoginRequired
    public RestData delete(String sno) {
        Doctor doctor = doctorService.selectByPrimaryKey(Integer.valueOf(sno));
        if (doctor == null) {
            return new RestData(0,"记录不存在","");
        }
        try {
            doctorService.delUser(doctor);
        } catch (Exception e) {
            return new RestData(0,e.getMessage(),null);
        }

        return new RestData(1,null,null);
    }

    /**
     * 根据部门查询医师
     * @param department
     * @return
     */
    @RequestMapping("/getDocByDep")
    @ResponseBody
    @LoginRequired
    public RestData getDocByDep(String department) {
        RestData restData = new RestData();
        try {
            department = URLDecoder.decode(department,"UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        List<Doctor> doctors = doctorService.getDocByDep(department);
        restData.setData(doctors);
        restData.setSuccess(1);
        return restData;
    }


}
