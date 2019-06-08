package com.onlineStudySystem.service.serviceImpl;

import com.onlineStudySystem.bean.UserInfo;
import com.onlineStudySystem.dao.UserInfoMapper;
import com.onlineStudySystem.service.UserInfoService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.UUID;

@Service
public class UserInfoServiceImpl implements UserInfoService {
    @Resource
    UserInfoMapper userInfoMapper;



    public String registUserInfo(UserInfo userInfo) {
        //生成userId
        userInfo.setUserId(UUID.randomUUID().toString());

        if(userInfo.getUsername().trim()!=""&&userInfo.getName().trim()!=""
                &&userInfo.getPassword()!=""&&userInfo.getEmail().trim()!=""){
            //首先要校验用户是否已经被注册
            return  userInfoMapper.checkUserExist(userInfo.getUsername())>0?"该用户已经被注册！":(userInfoMapper.registUserInfo(userInfo)>0?"注册成功":"注册失败，请检查网路链接是否正常!");
        }
        return "注册失败,请完善信息！";
    }

    public UserInfo loginUser(String username, String password) {
        return null;
    }

    public List<UserInfo> queryUserInfoInVague(UserInfo userInfo) {
        return null;
    }

    public List<UserInfo> queryAllUserInfo() {
        return null;
    }

    public String reviseUserInfo(UserInfo userInfo) {
        return null;
    }

    public int countUserNum() {
        return 0;
    }

    public UserInfo queryUserInfoById(int id) {
        return null;
    }


}
