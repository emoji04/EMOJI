package com.bit.emoji.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.emoji.member.service.MailSendService;
import com.bit.emoji.member.service.MemberService;

@Controller
public class membercontroller {
    MailSendService mailSendService;
    MemberService memberService;

    @RequestMapping(value = "/loginForm")
    public String goLoginForm(){
        return "naverRegi";
    }


    public String goRegForm(){
        return null;
    }

    public String goUpdateForm(){
        return null;
    }

    public String goEdiFormtesttest(){
        return null;
    }

    public String regster(Model model){
        return null;
    }

    public String login(Model model){
        return null;
    }

    public String logout(Model model){
        return null;
    }

    public String edit(Model model, HttpSession session){
        return null;
    }

}
