package com.cn.hxg.service.impl;

import com.cn.hxg.dao.FeedbackMapper;
import com.cn.hxg.entity.Feedback;
import com.cn.hxg.service.FeedbackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FeedbackServiceImpl implements FeedbackService {

    @Autowired
    private FeedbackMapper feedbackMapper;
    
    public int deleteByPrimaryKey(Integer key) {
        return feedbackMapper.deleteByPrimaryKey(key);
    }
    
    public int insert(Feedback record) {
        return feedbackMapper.insert(record);
    }
    
    public int insertSelective(Feedback record) {
        return feedbackMapper.insertSelective(record);
    }

    public Feedback selectByPrimaryKey(Integer key) {
        return feedbackMapper.selectByPrimaryKey(key);
    }

    public int updateByPrimaryKeySelective(Feedback record) {
        return feedbackMapper.updateByPrimaryKeySelective(record);
    }

    public int updateByPrimaryKey(Feedback record) {
        return feedbackMapper.updateByPrimaryKey(record);
    }

    public List<Feedback> getList(String id){
        return feedbackMapper.getList(id);
    }
}