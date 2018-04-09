package com.cn.hxg.entity;

import java.util.Date;

import com.cn.hxg.base.BaseObject;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.EqualsAndHashCode;



@Data
@EqualsAndHashCode(callSuper = false)
@AllArgsConstructor
@NoArgsConstructor
public class Feedback extends BaseObject {

    /**  */
    private Integer id;

    /** 反馈人 */
    private String stuName;

    /** 反馈意见 */
    private String desc;

    /** 反馈时间 */
    private Date feedTime;


}