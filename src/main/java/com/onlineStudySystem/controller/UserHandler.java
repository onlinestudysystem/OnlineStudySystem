package com.onlineStudySystem.controller;

import com.onlineStudySystem.bean.UserInfo;
import com.onlineStudySystem.bean.ValidationGroup.LoginValidationGroup;
import com.onlineStudySystem.bean.ValidationGroup.RegistValidationGroup;
import com.onlineStudySystem.bean.ValidationGroup.UpdateValidationGroup;
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
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

/**
 * 用户操作的控制器
 */
@Controller("userHandler")
@RequestMapping("/user")
public class UserHandler {
    private Logger logger = Logger.getLogger(UserHandler.class);

    @Resource
    UserInfoService userInfoService;

    public UserHandler(UserInfoService userInfoService){
        this.userInfoService=userInfoService;
    }

    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public String getLoginForm(Model model){
        //提前准备号userInfo实例，利用springForm对其数据绑定
        model.addAttribute("userInfo",new UserInfo());
        return "login";
    }

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login(@Validated(LoginValidationGroup.class) UserInfo userInfo, BindingResult bindingResult, Model model,HttpServletRequest request){
        //校验字段出错，返回login.jsp
        if(bindingResult.hasErrors()){
           return "login";
        }
        //step1:判断是否登录成功，登录失败则返回login.jsp并提示失败信息
        UserInfo user=userInfoService.loginUser(userInfo.getUsername(),userInfo.getPassword());
        if(user==null){
            model.addAttribute("login_msg","登录失败，请检查用户名和密码是否正确！");
            return "login";
        }
        //step2:登录成功则把userInfo信息记录在HttpSession的attribute中
        HttpSession session=request.getSession();
        session.setAttribute("userInfo",user);
        //返回到主界面
        return "redirect:/papper/homePage";

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
         model.addAttribute("userInfo",new UserInfo());
         return "login";
     }

    /**
     * 获取个人信息
     * @param model
     * @return
     */
     @RequestMapping(value = "/personalInfo",method = RequestMethod.GET)
     public String queryPersonalInfo(Model model, HttpServletRequest request){
         //获取session中存放的用户信息
         return "personalInfoPage";
     }

    /**
     * 修改个人信息
     */
    @RequestMapping(value = "/updatePersonalInfo",method = RequestMethod.POST)
    public String updatePersonalInfo(MultipartFile profilePicture, @Validated(UpdateValidationGroup.class) UserInfo userInfo, BindingResult result,Model model,HttpServletRequest request){
        if(result.hasErrors()){
            for(ObjectError o:result.getAllErrors()){
                System.err.println(o.getDefaultMessage()+","+o.getObjectName());
                //设置错误信息回显
                model.addAttribute(o.getObjectName(),o.getDefaultMessage());
            }
            return "personalInfoPage";
        }
        HttpSession session=request.getSession();
        UserInfo user=(UserInfo) session.getAttribute("userInfo");
        //获取个人头像，并生成头像名，然后存储到指定目录
        String newFilename="";
        if(profilePicture!=null){
            String originalName=profilePicture.getOriginalFilename();
            if(originalName!=null && originalName.trim().length()>0){
                String pathInProject="E:\\javaProject\\OnlineStudySystem\\src\\main\\webapp\\static\\images\\userLogo\\";
                newFilename= UUID.randomUUID()+originalName.substring(originalName.lastIndexOf("."));
                try {
                    profilePicture.transferTo(new File(pathInProject+newFilename));
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

        if(newFilename!=null && newFilename.trim().length()>0){
            userInfo.setPhoto("/static/images/userLogo/"+newFilename);
            user.setPhoto("/static/images/userLogo/"+newFilename);
        }else{
            userInfo.setPhoto(user.getPhoto());
        }

        //设置userInfo的id
        userInfo.setUserId(user.getUserId());
        //同步数据库
        String msg=userInfoService.reviseUserInfo(userInfo);
        //设置反馈信息
        model.addAttribute("update_msg",msg);
        session.setAttribute("userInfo",userInfo);
        return "personalInfoPage";

    }

}
