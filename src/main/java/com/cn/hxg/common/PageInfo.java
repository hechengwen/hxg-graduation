package com.cn.hxg.common;

import lombok.Data;

import java.util.List;

@Data
public class PageInfo<T> {

    // 每页多少行记录
    private int pageSize = 20;
    // 当前第几页
    private int pageNo = 1;
    // 记录总数
    private int totalRows = -1;
    // 开始记录数
    private int startRow;
    // 结束记录数
    private int endRow;
    // 总页数
    private int totalPages;
    // 记录集合
    private List<T> resultList;
    // 记录集合
    private List<T> loans;

    public PageInfo() {
    }

    public PageInfo(int pageNo) {
        if (pageNo < 1) {
            pageNo = 1;
        }
        int v_endrownum = pageNo * pageSize;
        this.startRow = v_endrownum - pageSize;
    }

    public PageInfo(Integer pageNo, Integer pageSize) {
        if (pageNo==null||pageNo < 1) {
            pageNo = this.pageNo;
        }
        if (pageSize==null||pageSize < 1) {
            pageSize=this.pageSize;
        }
        int v_endrownum = pageNo * pageSize;
        this.startRow = v_endrownum - pageSize;
        if (pageSize != 0)
            this.pageSize = pageSize;
    }

    public PageInfo(Integer startRow, Integer pageSize, boolean isManage) {
        if(isManage){
            this.startRow = startRow;
            this.pageSize = pageSize;
        }
    }

    public PageInfo(int pageNo, int pageSize, List<T> resultList, int totalRows) {
        super();
        if (pageNo < 1) {
            pageNo = 1;
        }
        if (pageSize < 1) {
            pageSize = 10;
        }
        this.pageNo = pageNo;
        this.pageSize = pageSize;
        this.resultList = resultList;
        this.totalRows = totalRows;
    }
}
