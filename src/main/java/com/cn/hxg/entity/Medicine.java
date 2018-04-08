package com.cn.hxg.entity;

import java.util.Date;
import java.math.BigDecimal;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.EqualsAndHashCode;

import com.cn.hxg.base.BaseObject;


@Data
@EqualsAndHashCode(callSuper = false)
@AllArgsConstructor
@NoArgsConstructor
public class Medicine extends BaseObject {

    /** 药品编号 */
    private String drugNum;

    /** 药品名称 */
    private String drugName;

    /** 生产日期 */
    private Date productionDate;

    /** 有效日期 */
    private Date effectiveDate;

    /** 生产企业 */
    private String productionEnterprise;

    /** 价格 */
    private BigDecimal price;

    /** 数量 */
    private Integer number;

    /** 进货单位 */
    private String stockUnits;

    /** 联系人 */
    private String contactPerson;


}