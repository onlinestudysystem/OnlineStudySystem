package com.onlineStudySystem.dao;

import com.onlineStudySystem.bean.FootPrintItem;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 足迹的数据库操作接口
 */
public interface FootPrintItemMapper {

        //添加足迹
        public void addFootPrint(FootPrintItem footPrintItem);
        //删除足迹
        public boolean deleteFootPrint(@Param("papperId") String papperId,@Param("userId") String userId);
        //查询所有足迹
        public List<FootPrintItem> queryAllFootPrint(String userId);
        //检测是否今天存在这篇文章
        public boolean checkIsTodayFootprint(FootPrintItem footPrintItem);

        


}
