package com.onlineStudySystem.controller;

import com.onlineStudySystem.bean.FootPrintItem;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 足迹控制器
 */
@RequestMapping("/footPrint")
@Controller
public class FootPrintHandler {

    /**
     * 查看所有足迹
     * @return
     */
    @RequestMapping("/queryAllFootPrint")
    public String queryAllFootPrint(){
        //实现具体逻辑
        return "footPrint";
    }

    /**
     * 删除足迹
     */
    @RequestMapping("/deleteFootPrint")
    public String deleteFootPrint(FootPrintItem footPrintItem){
        //具体逻辑s
        return "footPrint";
    }

}
