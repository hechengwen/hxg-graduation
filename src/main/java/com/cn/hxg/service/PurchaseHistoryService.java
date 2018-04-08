package com.cn.hxg.service;

import com.cn.hxg.entity.PurchaseHistory;

public interface PurchaseHistoryService {

    int deleteByPrimaryKey(Integer key);

    int insert(PurchaseHistory record);

    int insertSelective(PurchaseHistory record);

    PurchaseHistory selectByPrimaryKey(Integer key);

    int updateByPrimaryKeySelective(PurchaseHistory record);

    int updateByPrimaryKey(PurchaseHistory record);

}