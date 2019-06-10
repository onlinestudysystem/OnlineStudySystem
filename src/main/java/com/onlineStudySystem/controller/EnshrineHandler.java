package com.onlineStudySystem.controller;
import com.onlineStudySystem.service.EnshrineService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;


@Controller("enshrineHandler")
@RequestMapping("/enshrine")
public class EnshrineHandler {

    @Resource
    EnshrineService enshrineService;

    /**
     * 添加收藏，最好用ajax,json交互,点击收藏后，反馈给用户收藏成功。
     * @return
     */
    @RequestMapping("/add")
    public String add(){
        //收藏前检测是否已经收藏过，如果已经收藏，则直接返回文章已在收藏夹信息。queryPapperById判空即可
        return "";
    }





}
