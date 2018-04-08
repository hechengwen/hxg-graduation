package com.cn.hxg.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.cn.hxg.dao.PurchaseHistoryMapper;
import com.cn.hxg.entity.PurchaseHistory;
import com.cn.hxg.service.PurchaseHistoryService;

@Service
public class PurchaseHistoryServiceImpl implements PurchaseHistoryService {

    @Autowired
    private PurchaseHistoryMapper purchaseHistoryMapper;
    
    public int deleteByPrimaryKey(Integer key) {
        return purchaseHistoryMapper.deleteByPrimaryKey(key);
    }
    
    public int insert(PurchaseHistory record) {
        return purchaseHistoryMapper.insert(record);
    }
    
    public int insertSelective(PurchaseHistory record) {
        return purchaseHistoryMapper.insertSelective(record);
    }

    public PurchaseHistory selectByPrimaryKey(Integer key) {
        return purchaseHistoryMapper.selectByPrimaryKey(key);
    }

    public int updateByPrimaryKeySelective(PurchaseHistory record) {
        return purchaseHistoryMapper.updateByPrimaryKeySelective(record);
    }

    public int updateByPrimaryKey(PurchaseHistory record) {
        return purchaseHistoryMapper.updateByPrimaryKey(record);
    }
}