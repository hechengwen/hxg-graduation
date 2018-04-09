package com.cn.hxg.service;


import com.cn.hxg.entity.Feedback;

public interface FeedbackService {

    int deleteByPrimaryKey(Integer key);

    int insert(Feedback record);

    int insertSelective(Feedback record);

    Feedback selectByPrimaryKey(Integer key);

    int updateByPrimaryKeySelective(Feedback record);

    int updateByPrimaryKey(Feedback record);

}