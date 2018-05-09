package com.cn.hxg.entity;

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
public class MedicalRecords extends BaseObject {

    /**  */
    private Integer id;

    /** 患者姓名 */
    private String stuName;

    /** 就诊医生 */
    private String dcoName;

    /** 就诊日期 */
    private Date jzrq;

    private String jzrqStr;

    /** 病情描述 */
    private String description;

    private Integer serialNumber;
}