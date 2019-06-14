package com.onlineStudySystem.service;

import com.onlineStudySystem.bean.Enshrine;
import com.onlineStudySystem.bean.Papper;

import java.util.List;

public interface EnshrineService {
    //收藏文章
    public String enshrinePapper(Enshrine enshrine);
    //删除收藏的文章
    public String deleteEnshrinePapper(String papperId,String userId);
    //查找所有收藏的文章
    public List<Enshrine> queryAllEnshrinePapper(String userId);

}
