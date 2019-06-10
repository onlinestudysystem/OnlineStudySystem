package com.onlineStudySystem.service;

import com.onlineStudySystem.bean.Enshrine;
import com.onlineStudySystem.bean.Papper;

import java.util.List;

public interface EnshrineService {
    //收藏文章
    public String enshrinePapper(Enshrine enshrine);
    //删除收藏的文章
    public String deleteEnshrinePapper(String papperId);
    //查找所有收藏的文章
    public List<Enshrine> queryAllEnshrinePapper();
    //查找指定收藏的文章（依靠papperIdc）
    public Papper queryPapperById(String papperId);
}
