package com.onlineStudySystem.service.serviceImpl;

import com.onlineStudySystem.bean.Papper;
import com.onlineStudySystem.dao.EnshrineMapper;
import com.onlineStudySystem.dao.FootPrintItemMapper;
import com.onlineStudySystem.dao.PapperMapper;
import com.onlineStudySystem.service.PapperService;
import com.onlineStudySystem.util.CheckUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;

@Service
public class PapperServiceImpl implements PapperService {
    @Resource
    PapperMapper papperMapper;
    @Resource
    EnshrineMapper enshrineMapper;
    @Resource
    FootPrintItemMapper footPrintItemMapper;


    //查询指定文章
    public Papper queryPapperById(String papperId) {
        return papperId.trim()!=""?papperMapper.queryPapperById(papperId):null;
    }

    //按文章类型查询
    public List<Papper> qeuryPapperyByType(String type) {
        return type.trim()!=""?papperMapper.qeuryPapperyByType(type):null;
    }

    public Map<String,List<Papper>> queryAllPapper() {
        List<Papper> papperList=papperMapper.queryAllPapper();
        Map<String,List<Papper>> papperMap=new HashMap<>();
        for(Papper p:papperList){
            if(papperMap.containsKey(p.getType())){
                List<Papper> pappers=papperMap.get(p.getType());
                pappers.add(p);
                papperMap.put(p.getType(),pappers);
            }else{
                List<Papper> pappers=new ArrayList<>();
                pappers.add(p);
                papperMap.put(p.getType(),pappers);
            }
        }

        return papperMap;
    }

    public String submitPapper(Papper papper) {
        //为文章生成UUID
        papper.setPapperId(UUID.randomUUID().toString());
        papper.setSubmitDate(new Date());
        papper.setEnshrineNumber(0);
        if(!CheckUtil.getInstance().checkIsEmpty(papper)){
            //检测校验是否为空
            return "文章信息未完善！";
        }
        return papperMapper.submitPapper(papper)?"提交成功！":"上传文章失败！请检查网络连接!";
    }

    //修改
    public String revisePapper(Papper papper) {
        //修改的时候记得更新足迹和收藏的
        if (papper.getPapperProfile().trim() != "" && papper.getPapperText() != "" && papper.getTitle() != "") {
           return papperMapper.revisePapper(papper)?"更新成功！":"更新失败，请检重试！";
        } else {
            return "请完善文章信息!";
        }
    }

    public String deletePapper(String papperId) {
        return  papperMapper.deletePapper(papperId)?"删除成功！":"删除失败！请勿重复操作";
    }

    //今日最新发布
    public List<Papper> queryTodayPapper() {
        List<Papper> pappers= papperMapper.queryTodayPapper();
        return null;
    }

    @Override
    public List<Papper> queryTodayPapperByType(String type) {
        return papperMapper.queryTodayPapperByType(type);
    }

    //推荐
    public List<Papper> queryRecommendPapper() {
        List<Papper> pappers=papperMapper.queryRecommendPapper();
        return pappers;
    }

    //模糊查询，依靠文章标题
    public List<Papper> queryPapperInVagueByTitle(String title) {
        if(title.trim()==""){
            return null;
        }
        return papperMapper.queryPapperInVagueByTitle(title);
    }

    @Override
    public List<Papper> queryAuthorPapper(String authorId) {
        return papperMapper.queryAuthorPapper(authorId);
    }


}
