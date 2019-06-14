package com.onlineStudySystem.controller;

import com.google.gson.Gson;
import com.onlineStudySystem.bean.FootPrintItem;
import com.onlineStudySystem.bean.Papper;
import com.onlineStudySystem.bean.UserInfo;
import com.onlineStudySystem.bean.ValidationGroup.SearchPapperGroup;
import com.onlineStudySystem.bean.ValidationGroup.SubmitPapperGroup;
import com.onlineStudySystem.service.CommentItemService;
import com.onlineStudySystem.service.FootPrintService;
import com.onlineStudySystem.service.PapperService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * 关于文章操作的控制器
 */
@Controller
@RequestMapping("/papper")
public class PapperHandler {
    private final Logger logger= Logger.getLogger(PapperHandler.class);
    private Gson gsonUtils=new Gson();

    @Resource
    PapperService papperService;
    @Resource
    FootPrintService footPrintService;
    @Resource
    CommentItemService commentItemService;

    //加载首页(默认加载全部文章)
    @RequestMapping("/homePage")
    public String getHomePage(Model model) {
            model.addAttribute("allPappers",papperService.queryAllPapper());
            //获取热点文章(收藏数最多的)
            model.addAttribute("hotPappers",papperService.queryRecommendPapper());
            return "homePage";
    }

    /**
     * 今日发布界面
     * @param model
     * @return
     */
    @RequestMapping("/todayPapper")
    public String getTodayPapper(Model model){
            List<Papper> papperList=papperService.queryTodayPapper();
            model.addAttribute("pappers",papperList);
            return "todayPapper";
    }


    @RequestMapping("/todayPapper/{type}")
    public String getTodayPapperByType(@PathVariable String type,Model model){
           List<Papper> pappers=papperService.queryTodayPapperByType(type);
           model.addAttribute("pappers",pappers);
           return "todayPapper";

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
            return "homePage";
        }
        System.err.println(papper.getTitle());
         model.addAttribute("pappers",papperService.queryPapperInVagueByTitle(papper.getTitle()));
         return "searchPapper";
    }

    /**
     *查看指定的文章
     */
    @RequestMapping("/queryPapperById/{papperId}")
    public String queryPapperById(@PathVariable("papperId") String papperId, Model model, HttpServletRequest request){
        HttpSession session=request.getSession();
        UserInfo user=(UserInfo)session.getAttribute("userInfo");
        Papper papper=papperService.queryPapperById(papperId);
        model.addAttribute("papper",papper);
        //获取这篇文章所有评论
        model.addAttribute("commentItems",  commentItemService.queryCommentInPapper(papperId));
       //添加文章进入足迹
        footPrintService.addFootPrint(papper,user.getUserId());
       //返回文章显示界面
       return "papperPage";
    }



    /**
     * 作者获取管理界面
     */
    @RequestMapping(value = "/queryManagePapperForm/{authorId}",method = RequestMethod.GET)
    public String queryManagePapperForm(@PathVariable String authorId,Model model){
        //查询该作者所有的文章
        List<Papper> pappers=papperService.queryAuthorPapper(authorId);
        //查询该作者获得的所有comment
        model.addAttribute("commentItems",commentItemService.queryCommentByUserId(authorId));
        model.addAttribute("pappers",pappers);
        return "ManagePapperPage";
    }
    /**
     * 删除文章
     */
     @RequestMapping(value = "/deletePapper",produces = "application/json;charset=utf-8")
     @ResponseBody
     public String deletePapper(String papperId,HttpServletRequest request){
             System.err.println(papperId);
         String msg=papperService.deletePapper(papperId);
         return "{\"msg\":\""+msg+"\"}";
     }
//    /**
//     * 更新后刷新当前全部文章方法
//     */
//    @RequestMapping(value = "/refreshPappers",produces = "application/json;charset=utf-8")
//    @ResponseBody
//    public List<Papper> refreshPappersAfterDelete(HttpServletRequest request){
//        HttpSession httpSession=request.getSession();
//        UserInfo userInfo=(UserInfo)httpSession.getAttribute("userInfo");
//        String userId=userInfo.getUserId();
//        return papperService.queryAuthorPapper(userId);
//    }

    /**
     *发布文章
     */
    @RequestMapping(value = "/submitPapper",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String submitPapper(@Validated(SubmitPapperGroup.class)Papper papper,BindingResult bindingResult,HttpServletRequest request){
        Map<String,String> msgMap=new HashMap<>();
        HttpSession httpSession=request.getSession();
        UserInfo userInfo=(UserInfo)httpSession.getAttribute("userInfo");
        String userId=userInfo.getUserId();
        papper.setAuthorId(userId);
        if(bindingResult.hasErrors()){
            for(ObjectError error:bindingResult.getAllErrors()){
                logger.error(error.getObjectName()+":"+error.getDefaultMessage());
                msgMap.put(error.getObjectName(),error.getDefaultMessage());
            }
            return gsonUtils.toJson(msgMap);
        }
        msgMap.put("msg",papperService.submitPapper(papper));
        return gsonUtils.toJson(msgMap);
    }

    /**
     * 获取编辑文章的jsp
     */
    @RequestMapping(value = "/queryEditForm/{papperId}",method = RequestMethod.GET)
    public String queryEditForm(@PathVariable String papperId, Model model){
        Papper papper=papperService.queryPapperById(papperId);
        model.addAttribute("papper",papper);
        return "editPapper";
    }

    /**
     * 编辑修改文章
     */
    @RequestMapping(value = "/edit/{papperId}",method = RequestMethod.POST)
    public String editPapper(@Validated(SubmitPapperGroup.class) Papper papper,BindingResult bindingResult,HttpServletRequest request,Model model ){

        if(bindingResult.hasErrors()){
            for(ObjectError error:bindingResult.getAllErrors()){
                logger.error(error.getObjectName()+":"+error.getDefaultMessage());
            }
            return "editPapper";
        }

        HttpSession httpSession=request.getSession();
        UserInfo userInfo=(UserInfo)httpSession.getAttribute("userInfo");
        String userId=userInfo.getUserId();
        papper.setAuthorId(userId);
        System.err.println(papper);
        String msg=papperService.revisePapper(papper);
        model.addAttribute("msg",msg);
       return "editPapper";
    }




}
