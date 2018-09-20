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
s

<<<<<<< HEAD
    public String goEdiFormteset(ewe){

    public String goEdiFormtesttest(){dvfd

=======
<<<<<<< HEAD
    public String goEdiFormtest(){
=======
    public String goEdiFormtesttest(){
<<<<<<< HEAD
>>>>>>> branch 'nillㄴㄴㄴㄴㄴㄴㄴㄴㄴs' of https://github.com/emoji04/EMOJI.git
>>>>>>> branch 'nills' of https://github.com/emoji04/EMOJI.git
=======
>>>>>>> branch 'nillㄴㄴㄴㄴㄴㄴㄴㄴdfㄴs' of https://github.com/emoji04/EMOJI.git
>>>>>>> branch 'nills' of https://github.com/emoji04/EMOJI.git
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
