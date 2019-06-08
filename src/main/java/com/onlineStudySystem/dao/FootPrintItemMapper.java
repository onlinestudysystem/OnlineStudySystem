package com.onlineStudySystem.dao;

import com.onlineStudySystem.bean.FootPrintItem;

import java.util.List;

/**
 * 足迹的数据库操作接口
 */
public interface FootPrintItemMapper {

        //添加足迹
        public void addFootPrint(String papperId);
        //删除足迹
        public boolean deleteFootPrint(String papperId);
        //查询所有足迹
        public List<FootPrintItem> queryAllFootPrint();
        


}
