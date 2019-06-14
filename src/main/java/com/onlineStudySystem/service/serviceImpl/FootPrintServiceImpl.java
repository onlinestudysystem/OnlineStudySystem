package com.onlineStudySystem.service.serviceImpl;

import com.onlineStudySystem.bean.FootPrintItem;
import com.onlineStudySystem.bean.Papper;
import com.onlineStudySystem.dao.FootPrintItemMapper;
import com.onlineStudySystem.service.FootPrintService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class FootPrintServiceImpl implements FootPrintService {
    @Resource
    FootPrintItemMapper footPrintItemMapper;

    //添加足迹
    public void addFootPrint(Papper papper,String userId) {
        FootPrintItem footPrintItem=new FootPrintItem();
        footPrintItem.setUserId(userId);
        footPrintItem.setPapperId(papper.getPapperId());
        footPrintItem.setPapperProfile(papper.getPapperProfile());
        footPrintItem.setTitle(papper.getTitle());
        //检测该用户今天有没有逛过这篇文章
        footPrintItem.setReadDate(new Date());
        if(footPrintItemMapper.checkIsTodayFootprint(footPrintItem)<=0)
            footPrintItemMapper.addFootPrint(footPrintItem);
    }

    /**
     *   删除足迹
      * @param papperId 足迹中，文章的id
     * @return 删除是否成功信息，用于回馈给用户
     */
    public String deleteFootPrint(String papperId,String userId) {
        return footPrintItemMapper.deleteFootPrint(papperId,userId)?"删除成功":"删除失败，请刷新页面再重试！";
    }

    //查询所有足迹
    public Map<String,List<FootPrintItem>> queryAllFootPrint(String userId) {
        List<FootPrintItem> footPrintItems=footPrintItemMapper.queryAllFootPrint(userId);
        Map<String,List<FootPrintItem>>treeMap=new TreeMap<>(new SortByTimeStr());
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
        //便利并获取item的时间
        for(FootPrintItem footPrintItem:footPrintItems){
            //将时间转为字符串
            String d=simpleDateFormat.format(footPrintItem.getReadDate());
            if(treeMap.containsKey(d)){
                List<FootPrintItem> items=treeMap.get(d);
                items.add(footPrintItem);
                treeMap.put(d,items);
            }else{
                List<FootPrintItem> items=new ArrayList<>();
                items.add(footPrintItem);
                treeMap.put(d,items);
            }
        }
        return treeMap;
    }

    //实现比较器
    private class SortByTimeStr implements Comparator<String> //使用泛型
    {

        public int compare(String o1, String o2) {
            //将字符串格式的日期转为date对象
            SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
            Date date1=null;
            Date date2=null;
            try {
                date1=simpleDateFormat.parse(o1);
                date2=simpleDateFormat.parse(o2);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            return date1.after(date2)?-1:(date1.before(date2)?1:0);
        }
    }

}
