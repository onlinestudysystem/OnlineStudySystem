package com.onlineStudySystem.controller;

import com.onlineStudySystem.bean.Papper;
import com.onlineStudySystem.bean.ValidationGroup.SearchPapperGroup;
import com.onlineStudySystem.service.PapperService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;


/**
 * 关于文章操作的控制器
 */
@Controller
@RequestMapping("/papper")
public class PapperHandler {
    private final Logger logger= Logger.getLogger(PapperHandler.class);

    @Resource
    PapperService papperService;

    //加载首页(默认加载全部文章)
    @RequestMapping("/homePage/{type}")
    public String getHomePage(@PathVariable("type") String type, Model model) {
        System.out.println(type);
        //默认获取所有的文章（不分类）
        if(type.equals("queryAllPapper")){
            model.addAttribute("allPappers",papperService.queryAllPapper());
            logger.info("首页：queryAllPapper");
        }
        else if(type.equals("todayPappers")){
            model.addAttribute("todayPappers",papperService.queryTodayPapper());
            logger.info("获取今日发布");
        }
        return "homePage";
    }

    /**
        进行模糊查询指令
     */
    @RequestMapping(value = "/queryPapperByTitle" )

    public String queryPapperByTitle(@Validated(SearchPapperGroup.class) Papper papper, BindingResult bindingResult, Model model){
        if(bindingResult.hasErrors()){
            for(ObjectError error:bindingResult.getAllErrors()){
                System.err.println(error.getObjectName()+":"+error.getDefaultMessage());
            }
            //带着错误信息回去
            return "login";
        }
         model.addAttribute(papperService.queryPapperInVagueByTitle(papper.getTitle()));
         return "homePage";
    }

    /**
     *
     */





}
