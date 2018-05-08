package com.cn.hxg.controller;

import com.cn.hxg.base.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Copyright (C), 2017，hxg Tec.
 * Author: huxiaogang
 * Version:
 * Date: 2018/4/10 19:52
 * Description:
 * Others:就诊记录管理
 */
@Controller
@RequestMapping("medicalRecords")
public class MedicalRecordsController extends BaseController{

    @RequestMapping("/index")
    public ModelAndView index(){
        return new ModelAndView("menzhenjiuzhen");
    }

}
