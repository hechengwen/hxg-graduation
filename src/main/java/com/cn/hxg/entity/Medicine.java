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
    private Integer drugNum;

    /** 药品名称 */
    private String drugName;

    /** 药品类型 */
    private String drugType;

    /** 生产日期 */
    private String productionDate;

    /** 有效期 */
    private String effectiveDate;

    /** 生产企业 */
    private String productionEnterprise;

    /** 购买价格 */
    private BigDecimal buyPrice;

    /** 销售价格 */
    private BigDecimal sellerPrice;

    /** 进货数量 */
    private String number;

    /** 进货单位 */
    private String stockUnits;

    /** 联系人 */
    private String contactPerson;


}