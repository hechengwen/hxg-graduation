package com.cn.hxg.controller;

import com.cn.hxg.annotation.LoginRequired;
import com.cn.hxg.base.BaseController;
import com.cn.hxg.entity.Admin;
import com.cn.hxg.entity.Doctor;
import com.cn.hxg.entity.Register;
import com.cn.hxg.entity.RegisterData;
import com.cn.hxg.restful.RestData;
import com.cn.hxg.service.DoctorService;
import com.cn.hxg.service.RegisterService;
import org.apache.commons.lang.StringUtils;
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
 * Date: 2018/4/9 16:25
 * Description:
 * Others:门诊挂号控制器
 */
@Controller
@RequestMapping(value = "/register")
public class RegisterContorller extends BaseController {

    private SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    @Autowired
    private DoctorService doctorService;

    @RequestMapping(value = "index")
    @LoginRequired
    public ModelAndView index(){
        ModelAndView modelAndView = new ModelAndView("guahao_add");

        List<Doctor> doctors = doctorService.getDocList(null);

        modelAndView.addObject("doctors",doctors);

        return modelAndView;
    }

    @Autowired
    private RegisterService registerService;

    /**
     * 增加门诊挂号
     * @param register
     * @return
     */
    @RequestMapping("insert")
    @LoginRequired
    @ResponseBody
    public RestData insert(Register register) {
        RestData restData = new RestData();
        Admin admin = (Admin) getRequest().getSession().getAttribute("userInfo");

        if (StringUtils.isEmpty(register.getDoctor()) || StringUtils.isEmpty(register.getRegisteredProject())) {
            restData.setComment("挂号科室或医师姓名必选");
            return restData;
        }

        register.setRegistrationTime(new Date());
        register.setName(admin.getRole());//学生姓名
        register.setStatus("0");

        registerService.insert(register);

        restData.setSuccess(1);
        return restData;
    }

    /**
     * 查询当前登录用户挂号列表
     * @return
     */
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

    /**
     * 门诊就诊列表
     * @param serialNumber
     * @return
     */
    @RequestMapping(value = "getRegisterList")
    @LoginRequired
    public ModelAndView getRegisterList(@RequestParam(value = "serialNumber",required = false)String serialNumber){
        ModelAndView modelAndView = new ModelAndView("menzhenjiuzhen");

        Admin admin = (Admin) getRequest().getSession().getAttribute("userInfo");

        List<RegisterData> registerDatas = registerService.getRegisterList(serialNumber,admin.getRole());

        for (RegisterData registerData : registerDatas) {
            String registerTimeStr = simpleDateFormat.format(registerData.getRegistrationTime());
            registerData.setRegisterTimeStr(registerTimeStr);
        }

        modelAndView.addObject("registerDatas",registerDatas);

        return modelAndView;
    }

    /**
     * 门诊结算
     * @param serialNumber
     * @return
     */
    @RequestMapping(value = "getRegisterSettle")
    @LoginRequired
    public ModelAndView getRegisterSettle(@RequestParam(value = "serialNumber",required = false)String serialNumber){
        ModelAndView modelAndView = new ModelAndView("menzhengjiesuan");
        return modelAndView;
    }

}
