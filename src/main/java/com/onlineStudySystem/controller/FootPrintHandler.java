package com.onlineStudySystem.controller;

import com.google.gson.Gson;
import com.onlineStudySystem.bean.FootPrintItem;
import com.onlineStudySystem.bean.UserInfo;
import com.onlineStudySystem.service.FootPrintService;
import org.springframework.stereotype.Controller;
import org.springframework.test.web.servlet.result.FlashAttributeResultMatchers;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * 足迹控制器
 */

@Controller
@RequestMapping("/footPrint")
public class FootPrintHandler {
    private Gson gsonUtils=new Gson();

    @Resource
    FootPrintService footPrintService;
    /**
     * 查看所有足迹
     * @return
     */
    @RequestMapping(value = "/queryAllFootPrint")
    public String queryAllFootPrint(HttpServletRequest request, Model model){
        HttpSession session=request.getSession();
        UserInfo userInfo=(UserInfo) session.getAttribute("userInfo");
        Map<String,List<FootPrintItem>> allFootPrint=footPrintService.queryAllFootPrint(userInfo.getUserId());
        model.addAttribute("allFootPrint",allFootPrint);
        return "footPrint";
}

    /**
     * 删除足迹
     */
    @RequestMapping(value="/deleteFootPrint/{papperId}" )
    public String deleteFootPrint(@PathVariable String papperId, HttpServletRequest request,Model model){
        FootPrintItem footPrintItem = new FootPrintItem();
        footPrintItem.setPapperId(papperId);
        HttpSession session=request.getSession();
        UserInfo userInfo=(UserInfo) session.getAttribute("userInfo");
        footPrintService.deleteFootPrint(footPrintItem.getPapperId(),userInfo.getUserId());
        Map<String,List<FootPrintItem>> allFootPrint=footPrintService.queryAllFootPrint(userInfo.getUserId());
        model.addAttribute("allFootPrint",allFootPrint);
        return "footPrint";
    }


}
