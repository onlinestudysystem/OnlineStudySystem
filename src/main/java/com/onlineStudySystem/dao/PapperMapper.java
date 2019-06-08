package com.onlineStudySystem.dao;

import com.onlineStudySystem.bean.Papper;
import com.onlineStudySystem.bean.UserInfo;

import java.util.Date;
import java.util.List;

public interface PapperMapper {

    //根据文章id查询指定的文章
    public Papper queryPapperById(String papperId);

    //根据文章类型查询文章
    public List<Papper> qeuryPapperyByType(String type);

    //查询所有的文章
    public List<Papper> queryAllPapper();

    //上传文章
    public boolean submitPapper();

    //修改指定的文章
    public boolean revisePapper(Papper papper);

    //删除文章
    public boolean deletePapper(String papperId);






}
