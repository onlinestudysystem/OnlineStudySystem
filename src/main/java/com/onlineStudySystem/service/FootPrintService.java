package com.onlineStudySystem.service;

import com.onlineStudySystem.bean.FootPrintItem;

import java.util.List;

public interface FootPrintService {

    //添加足迹
    public void addFootPrint(FootPrintItem footPrintItem);
    //删除足迹
    public String deleteFootPrint(String papperId);
    //查询所有足迹
    public List<FootPrintItem> queryAllFootPrint();
}
