package com.onlineStudySystem.service;

import com.onlineStudySystem.bean.Papper;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 关于文章的服务层操作类
 */
public interface PapperService {
    //根据文章id查询指定的文章
    public Papper queryPapperById(String papperId);

    //根据文章类型查询文章
    public List<Papper> qeuryPapperyByType(String type);

    //查询所有的文章
    public Map<String,List<Papper>> queryAllPapper();

    //上传文章
    public String submitPapper(Papper papper);

    //修改指定的文章
    public String revisePapper(Papper papper);

    //删除文章
    public String deletePapper(String papperId);

    //寻找今日文章
    public List<Papper> queryTodayPapper();

    //按类型寻找今日文章
    public List<Papper> queryTodayPapperByType(String type);

    //按收藏量寻找推荐文章
    public List<Papper> queryRecommendPapper();

    //根据文章title 模糊查询文章
    public List<Papper> queryPapperInVagueByTitle(String title);

    //查询作者所有文章
    public List<Papper> queryAuthorPapper(String authorId);


}
