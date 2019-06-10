package com.onlineStudySystem.service;

import com.onlineStudySystem.bean.Enshrine;

import java.util.List;

public interface EnshrineService {
    //收藏文章
    public String enshrinePapper(Enshrine enshrine);
    //删除收藏的文章
    public String deleteEnshrinePapper(String papperId);
    //查找所有收藏的文章
    public List<Enshrine> queryAllEnshrinePapper();
}
