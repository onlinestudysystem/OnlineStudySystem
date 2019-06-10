package com.onlineStudySystem.service.serviceImpl;

import com.onlineStudySystem.bean.FootPrintItem;
import com.onlineStudySystem.dao.FootPrintItemMapper;
import com.onlineStudySystem.service.FootPrintService;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

public class FootPrintServiceImpl implements FootPrintService {
    @Resource
    FootPrintItemMapper footPrintItemMapper;

    //添加足迹
    public void addFootPrint(FootPrintItem footPrintItem) {
        footPrintItem.setReadDate(new Date());
        footPrintItemMapper.addFootPrint(footPrintItem);
    }

    /**
     *   删除足迹
      * @param papperId 足迹中，文章的id
     * @return 删除是否成功信息，用于回馈给用户
     */
    public String deleteFootPrint(String papperId) {
        return null;
    }

    //查询所有足迹
    public List<FootPrintItem> queryAllFootPrint() {
        return null;
    }
}
