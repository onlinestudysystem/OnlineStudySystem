package com.onlineStudySystem.controller.exceptionResolver;

import net.sf.json.JSONObject;
import org.apache.log4j.*;
import org.apache.log4j.spi.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.*;

@ControllerAdvice
public class GobalExceptionResolver {
    private static final Logger log=Logger.getLogger(GobalExceptionResolver.class);

//    @ExceptionHandler(UserLoginValidatorException.class)
//    public String userExceptionHandler(HttpServletRequest request,UserLoginValidatorException e,Model model){
//        UserInfo userInfo=new UserInfo();
//        userInfo.setUsername(request.getParameter("username"));
//        userInfo.setPassword(request.getParameter("password"));
//        model.addAttribute("userInfo",userInfo);
//        model.addAttribute("state",e.getMessage());
//        model.addAttribute("autoLogin","false");
//        return "login";
//    }
//
//    @ExceptionHandler(FreezeRecordExistException.class)
//    @ResponseBody
//    public JSONObject freezeRecordExistExceptionHanler(){
//        System.err.println("该用户已冻结");
//        String data = "{\"msg\":\"更新失败！该用户已冻结！\"}";
//        return JSONObject.fromObject(data);
//    }

}
