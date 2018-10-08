package com.bit.emoji.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.emoji.model.MemberVO;
import com.bit.emoji.service.MailSendService;
import com.bit.emoji.service.MemberService;

@Controller
public class Membercontroller {
    MailSendService mailSendService;
    
    @Autowired
    MemberService memberService;
    
	@Autowired
	SHA256 sha ;
    
    @RequestMapping(value = "/member/loginSuccess")
    public String goLoginSuccess(){
        return "member/loginSuccess";
    }
    
    @RequestMapping(value = "/loginSuccess")
    public String goLoginSuccess2(){
        return "member/loginSuccess";
    }

    @RequestMapping(value = "/loginForm")
    public String goLoginFormtest(){
        return "member/loginForm";
    }
    
    public String goRegForm(){
        return null;
    }

    public String goUpdateForm(){
        return null;
    }

    public String insertMember(HttpServletRequest request, MemberVO memberVO, Model model){
        return null;
    }

    @RequestMapping(value = "/login")
    public String login(HttpServletRequest request, HttpServletResponse response, Model model){
		HttpSession session = request.getSession(false);
		
    	String memberEmail = request.getParameter("memberEmail");
    	String pw = request.getParameter("memberPassword");
    	String memberPassword = sha.encrypt(pw);
    	
    	System.out.println(memberPassword);
    	System.out.println(memberService.login(memberEmail));
    	if(memberService.login(memberEmail) != null && pw.equals(memberService.login(memberEmail)))
    	{session.setAttribute("loginInfo", memberEmail);
		System.out.println("�α��� ����");
		return "home";}
    	
        
		return "member/loginForm";
    }
    
    @RequestMapping(value = "/naver_login.json")
    @ResponseBody
    public String naverlogin(HttpServletRequest request, HttpServletResponse response, @RequestParam("email") String test){
    	System.out.println("����?");
		HttpSession session = request.getSession(false);
		session.setAttribute("loginInfo", test);
    	System.out.println(test);
		return test;
    }
    
    @RequestMapping(value = "/naverSuccess")
    public String naverSuccess(HttpServletRequest request){
    	String a = "/resources/css";
    	String b = request.getSession().getServletContext().getRealPath(a);
    	System.out.println(b);
        return "home";
    }
    
    @RequestMapping(value = "/logOut")
    public String logOut(HttpServletRequest request){
    	HttpSession session = request.getSession(false);
    	session.invalidate();
        return "home";
    }
    
    public String logout(Model model){
        return null;
    }

    public String edit(Model model, HttpSession session){
        return null;
    }
}