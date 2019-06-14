package com.onlineStudySystem.dao;

import com.onlineStudySystem.bean.Enshrine;
import com.onlineStudySystem.bean.Papper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EnshrineMapper {
    //收藏文章
    public boolean enshrinePapper(Enshrine enshrine);
    //删除收藏的文章
    public boolean deleteEnshrinePapper(@Param("papperId") String papperId,@Param("userId") String userId);
    //查找所有收藏的文章
    public List<Enshrine> queryAllEnshrinePapper(String userId );
    //查找指定收藏的文章（依靠papperId）
    public int queryPapperById(@Param("papperId") String papperId,@Param("userId") String userId);

}
