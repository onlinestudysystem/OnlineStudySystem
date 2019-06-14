package com.onlineStudySystem.controller;
import com.onlineStudySystem.bean.Enshrine;
import com.onlineStudySystem.bean.Papper;
import com.onlineStudySystem.bean.UserInfo;
import com.onlineStudySystem.service.EnshrineService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;


@Controller("enshrineHandler")
@RequestMapping("/enshrine")
public class EnshrineHandler {

    @Resource
    EnshrineService enshrineService;

    /**
     * 添加收藏，最好用ajax,json交互,点击收藏后，反馈给用户收藏成功。
     * @return
     */
    @RequestMapping(value = "/add",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String add(Papper papper, HttpServletRequest request){
        //收藏前检测是否已经收藏过，如果已经收藏，则直接返回文章已在收藏夹信息。queryPapperById判空即可

        HttpSession session=request.getSession();
        UserInfo userInfo=(UserInfo)session.getAttribute("userInfo");
        Enshrine enshrine=new Enshrine();
        enshrine.setTitle(papper.getTitle());
        enshrine.setUserId(userInfo.getUserId());
        enshrine.setPapperId(papper.getPapperId());
        enshrine.setPapperProfile(papper.getPapperProfile());
        String msg=enshrineService.enshrinePapper(enshrine);
        return "{\"msg\":\""+msg+"\"}";
    }

    /**
     * 取消收藏
     */
    @RequestMapping("/delete/{papperId}/{userId}")
    public String deleteEnshrine(@PathVariable String papperId, @PathVariable String userId, Model model){
        String msg=enshrineService.deleteEnshrinePapper(papperId,userId);
        List<Enshrine> enshrines= enshrineService.queryAllEnshrinePapper(userId);
        model.addAttribute("enshrines",enshrines);
        return "enshrinePage";
    }

    @RequestMapping("/queryEnshrinePage/{userId}")
    public String queryEnshrinePage(@PathVariable String userId, Model model){
        List<Enshrine> enshrines= enshrineService.queryAllEnshrinePapper(userId);
        model.addAttribute("enshrines",enshrines);
        return "enshrinePage";
    }




}
