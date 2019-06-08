package com.onlineStudySystem.service;

import com.onlineStudySystem.bean.UserInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserInfoService {
    //注册
    public String registUserInfo(UserInfo userInfo);
    //登录
    public UserInfo loginUser(@Param("username") String username, @Param("password") String password);
    //根据昵称模糊查询
    public List<UserInfo> queryUserInfoInVague(UserInfo userInfo);
    //查询全部用户
    public  List<UserInfo> queryAllUserInfo();
    //修改账号信息
    public String reviseUserInfo(UserInfo userInfo);
    //得到所有用户数量
    public int countUserNum();
    //根据用户id获取用户
    public UserInfo queryUserInfoById(int id);

}
