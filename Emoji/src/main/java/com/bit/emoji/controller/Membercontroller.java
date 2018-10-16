package com.bit.emoji.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.InetAddress;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.util.SystemOutLogger;
import org.springframework.beans.factory.annotation.Autowired;
/*import org.springframework.social.google.api.Google;
import org.springframework.social.google.api.impl.GoogleTemplate;
import org.springframework.social.google.api.plus.Person;
import org.springframework.social.google.api.plus.PlusOperations;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;*/
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.bit.emoji.model.EmailKeyVO;
import com.bit.emoji.model.MemberVO;
import com.bit.emoji.service.MailSendService;
import com.bit.emoji.service.MemberService;
import com.bit.emoji.service.Sha256;
import com.bit.emoji.service.MailSendService;
import com.mysql.jdbc.Connection;

import javafx.scene.control.Alert;

@Controller
public class Membercontroller {
	
	@Autowired
    MailSendService mailSendService;
    
    @Autowired
    MemberService memberService;
    
	@Autowired
	Sha256 sha ;
    
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
    
    @RequestMapping(value = "/registerForm")
    public String goRegisterForm(){
        return "member/registerForm";
    }
    
    @RequestMapping(value = "/emailcheck")
    public String goEmailcheck(){
        return "member/emailchk";
    }
    
    public String goUpdateForm(){
        return null;
    }

    public String insertMember(HttpServletRequest request, MemberVO memberVO, Model model){
        return null;
    }

    @RequestMapping(value = "/login")
    public String login(HttpServletRequest request, HttpServletResponse response) throws IOException{
		HttpSession session = request.getSession(false);
		
    	String memberEmail = request.getParameter("memberEmail");
    	String pw = request.getParameter("memberPassword");
    	String shaPassword = sha.encrypt(pw);
    	if(memberService.login(memberEmail) != null && shaPassword.equals(memberService.login(memberEmail).getMemberPassword())){
    		
    		session.setAttribute("loginInfo", memberService.login(memberEmail).getMemberNum());
    		return "home";
		}else {
	        response.setContentType("text/html; charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        out.println("<script>alert('회원정보가 올바르지 않습니다. 다시 로그인 해 주세요.'); </script>");
	        out.flush();
			return "member/loginForm";
		}
    }
    
    @RequestMapping(value = "/naver_login.json")
    @ResponseBody
    public String naverlogin(HttpServletRequest request, HttpServletResponse response, @RequestParam("email") String memberEmail, @RequestParam("name") String memberName){
		HttpSession session = request.getSession(false);
		if(memberService.login(memberEmail) != null) {
			MemberVO memberVO = memberService.login(memberEmail);
			session.setAttribute("loginInfo", memberVO.getMemberNum());
	    	return memberEmail;
    	}else {
    		long time = System.currentTimeMillis(); 
    		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd");
    		String regidate = dayTime.format(new Date(time));
    		MemberVO naverVO = new MemberVO();
    		naverVO.setMemberEmail(memberEmail);
    		naverVO.setMemberName(memberName);
    		naverVO.setMemberPassword("0000");
    		naverVO.setMemberGender("M");
    		naverVO.setMemberPhoneNum("0000");
    		naverVO.setMemberRegDate(regidate);
    		int a = memberService.insertMember(naverVO);
    		int e = naverVO.getMemberNum();
			session.setAttribute("loginInfo", e);
	    	return memberEmail;
    	}	
    }
    
    
    
    @RequestMapping(value = "/naverSuccess")
    public String naverSuccess(HttpServletRequest request){
        return "home";
    }
    
    @RequestMapping(value = "/logOut")
    public String logOut(HttpServletRequest request){
    	HttpSession session = request.getSession(false);
    	session.invalidate();
        return "home";
    }
    
    @RequestMapping(value = "/regicheck.json" , method = RequestMethod.POST)
    @ResponseBody
    public String regiCheck(HttpServletRequest request, HttpServletResponse response, @RequestParam("email") String email){
    	System.out.println(email);
		return memberService.login(email) != null ? "alreadyExist" : "possibleRegi";
    }

    public String edit(Model model, HttpSession session){
        return null;
    }
    
    
    @RequestMapping(value="/emailsend", method = RequestMethod.POST)
	public ModelAndView htmlSendMail(HttpServletRequest request, HttpServletResponse response, @RequestParam("memberEmail") String email) {
    	System.out.println("이메일 보낼 이메일ㅋ"+ email);
		// 메일 발송
		mailSendService.htmlMailSend(email);
		String viewName = "redirect:/emailSend.do";
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("email", email);
		modelAndView.setViewName(viewName);
		
		return modelAndView;
	}
    
    @RequestMapping(value = "/emailSend.do")
    public ModelAndView goEmailSend(@RequestParam String email, HttpServletRequest request){
    	
    	request.setAttribute("email", request.getParameter("email"));
    	String viewName = "member/emailSend";
    	ModelAndView modelAndView = new ModelAndView();
    	modelAndView.addObject("email", email);
		modelAndView.setViewName(viewName);
        return modelAndView;
    }
    
    
    @RequestMapping(value="/registe", method = RequestMethod.POST)
	public ModelAndView processLogin(MemberVO member, HttpServletRequest request, HttpServletResponse response, @RequestParam("memberEmail") String email, @RequestParam String emailKey) throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException, Exception {
		String password = member.getMemberPassword();
		
		String shaPassword = sha.encrypt(password);
    	long time = System.currentTimeMillis(); 
    	SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd");
		String regidate = dayTime.format(new Date(time));
		String viewName = "redirect:/regiSuccess.do";

		ModelAndView modelAndView = new ModelAndView();
		if(memberService.allowedEmail(email) != null && emailKey.equals(memberService.allowedEmail(email).getKey()) && memberService.login(email) == null) {
			modelAndView.setViewName(viewName);
			modelAndView.addObject("memberRegDate", regidate);
			member.setMemberPassword(shaPassword);
			member.setMemberRegDate(regidate);
			
			int insertCnt = memberService.insertMember(member);
	
			modelAndView.addObject("insertMember", insertCnt);
			
			return modelAndView;
		}else {
			viewName = "member/emailchk";
			response.setContentType("text/html; charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        out.println("<script>alert('이메일 인증 후 한 시간이 지났거나 잘못된 접근입니다. 다시 이메일 인증을 해주세요'); </script>");
	        out.flush();
			modelAndView.setViewName(viewName);
			return modelAndView;
		}
    };
    @RequestMapping(value = "/regiSuccess.do")
    public String regiSuccessDo(HttpServletRequest request)throws Exception {
    	
    	request.getParameter("memberName");
    	
        return "member/regiSuccess";
    }
}

