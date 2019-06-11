package com.onlineStudySystem.controller;

import com.onlineStudySystem.bean.UserInfo;
import com.onlineStudySystem.bean.ValidationGroup.LoginValidationGroup;
import com.onlineStudySystem.bean.ValidationGroup.RegistValidationGroup;
import com.onlineStudySystem.service.UserInfoService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

/**
 * 用户操作的控制器
 */
@Controller("userHandler")
@RequestMapping("/user")
public class UserHandler {
    private Logger logger = Logger.getLogger(UserHandler.class);

    @Resource
    UserInfoService userInfoService;

    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public String getLoginForm(Model model){
        //提前准备号userInfo实例，利用springForm对其数据绑定
        model.addAttribute("userInfo",new UserInfo());
        return "login";
    }

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login(@Validated(LoginValidationGroup.class) UserInfo userInfo, BindingResult bindingResult, Model model){
        //校验字段出错，返回login.jsp
        if(bindingResult.hasErrors()){
           return "login";
        }

        //step1:判断是否登录成功，登录失败则返回login.jsp并提示失败信息


        //step2:登录成功则把userInfo信息记录在HttpSession的attribute中

        //step3:

        //返回到主界面
        return "homePage";
    }

    /**
     * 注册
     */
     @RequestMapping("/regist")
     public String regist(@Validated(RegistValidationGroup.class) UserInfo userInfo,BindingResult bindingResult,Model model){
         //校验注册信息有误不
         if(bindingResult.hasErrors()){
             for(ObjectError e:bindingResult.getAllErrors()){
                 logger.error("注册校验错误:"+e.getDefaultMessage());
             }
             //返回登录界面
             return "login";
         }

         //否则执行注册操作
         String msg=userInfoService.registUserInfo(userInfo);
         model.addAttribute("msg",msg);
         return "login";
     }

     @RequestMapping("/logout")
     public String logout(Model model, HttpServletRequest request){
         HttpSession session=request.getSession();
         session.invalidate();
         model.addAttribute("msg","注销成功！");
         return "login";
     }

    /**
     * 获取个人信息
     * @param model
     * @return
     */
     @RequestMapping(value = "/personalInfo",method = RequestMethod.GET)
     public String queryPersonalInfo(Model model){
         return "personalInfoPage";
     }

}
