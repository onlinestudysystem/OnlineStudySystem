package com.onlineStudySystem.dao;

import com.onlineStudySystem.bean.Enshrine;

import java.util.List;

public interface EnshrineMapper {
    //收藏文章
    public boolean enshrinePapper(Enshrine enshrine);
    //删除收藏的文章
    public boolean deleteEnshrinePapper(String papperId);
    //查找所有收藏的文章
    public List<Enshrine> queryAllEnshrinePapper();



}
