package com.cn.hxg.controller;

import com.cn.hxg.annotation.LoginRequired;
import com.cn.hxg.base.BaseController;
import com.cn.hxg.entity.Admin;
import com.cn.hxg.entity.MedicalRecords;
import com.cn.hxg.entity.Register;
import com.cn.hxg.entity.RegisterData;
import com.cn.hxg.restful.RestData;
import com.cn.hxg.service.MedicalRecordsService;
import com.cn.hxg.service.RegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * 
 * Author: huxiaogang
 * Version:
 * Date: 2018/4/10 19:52
 * Description:
 * Others:就诊记录管理
 */
@Controller
@RequestMapping("medicalRecords")
public class MedicalRecordsController extends BaseController{

    @Autowired
    private MedicalRecordsService medicalRecordsService;

    @Autowired
    private RegisterService registerService;

    private SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    @RequestMapping("getList")
    @LoginRequired
    public ModelAndView getList(@RequestParam(value = "serialNumber",required = false)String serialNumber){
        ModelAndView model = new ModelAndView("menzhen_list");
        Admin admin = (Admin) getRequest().getSession().getAttribute("userInfo");
        String role = admin.getRole();
        if (admin.getUserType().equalsIgnoreCase("0")) {
            role = null;//管理员可以查看全部
        }
        List<MedicalRecords> list = medicalRecordsService.getList(role,serialNumber);
        for (MedicalRecords medicalRecords : list) {
            medicalRecords.setJzrqStr(format.format(medicalRecords.getJzrq()));
        }
        model.addObject("list",list);
        return model;
    }

    @RequestMapping("insert")
    @ResponseBody
    @LoginRequired
    public RestData insert(MedicalRecords medicalRecords){
        RestData restData;
        Admin admin = (Admin) getRequest().getSession().getAttribute("userInfo");
        medicalRecords.setDcoName(admin.getRole());
        medicalRecords.setJzrq(new Date());
        restData = medicalRecordsService.update(medicalRecords);
        return restData;
    }

    @RequestMapping("model")
    @LoginRequired
    public ModelAndView model(String serialNumber){
        ModelAndView model = new ModelAndView("kaiyao_form");
        Register register = registerService.selectByPrimaryKey(Integer.valueOf(serialNumber));
        model.addObject("serialNumber",register.getSerialNumber());
        model.addObject("name",register.getName());
        return model;
    }
}
