package com.cn.hxg.entity;

import java.math.BigDecimal;
import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.EqualsAndHashCode;

import com.cn.hxg.base.BaseObject;


@Data
@EqualsAndHashCode(callSuper = false)
@AllArgsConstructor
@NoArgsConstructor
public class Register extends BaseObject {

    /** 流水号 */
    private Integer serialNumber;

    /** 挂号时间 */
    private Date registrationTime;

    /** 挂号项目 */
    private String registeredProject;

    /** 预约医生 */
    private String doctor;

    /** 学生姓名 */
    private String name;

    /** 挂号费 */
    private BigDecimal cost;

}