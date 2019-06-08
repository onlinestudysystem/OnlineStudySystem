package com.onlineStudySystem.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 用户操作的控制器
 */
@Controller("userHandler")
@RequestMapping("/user")
public class UserHandler {

    @RequestMapping("/login")
    public String getLoginForm(){
        return "login";
    }


}
