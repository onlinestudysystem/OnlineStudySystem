package com.onlineStudySystem.service;

import com.onlineStudySystem.bean.FootPrintItem;
import com.onlineStudySystem.bean.Papper;

import java.util.List;
import java.util.Map;

public interface FootPrintService {

    //添加足迹
    public void addFootPrint(Papper papper,String userId );
    //删除足迹
    public String deleteFootPrint(String papperId,String userId);
    //查询所有足迹
    public Map<String,List<FootPrintItem>> queryAllFootPrint(String userId);
}
