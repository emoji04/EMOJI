package com.bit.emoji.member.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.emoji.member.service.MailSendService;
import com.bit.emoji.member.service.MemberService;
import com.bit.emoji.model.MemberVO;
import com.mysql.jdbc.Connection;

import javafx.scene.control.Alert;

@Controller
public class Membercontroller {
    MailSendService mailSendService;
    
    @Autowired
    MemberService memberService;
    
    
    /*private GoogleConnectionFactory googleConnectionFactory;
    private OAuth2Parameters googleOAuth2Parameters;
    
    public void setGoogleConnectionFactory(GoogleConnectionFactory googleConnectionFactory) {
		this.googleConnectionFactory = googleConnectionFactory;
	}

	public void setGoogleOAuth2Parameters(OAuth2Parameters googleOAuth2Parameters) {
		this.googleOAuth2Parameters = googleOAuth2Parameters;
	}
	
	@RequestMapping(value = "/googleSignIn", method = RequestMethod.POST)
	public String doGoogleSignInActionPage(HttpServletResponse response, Model model) {
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
		model.addAttribute("url", url);
		return "/member/LoginFormtest";
	}
	
	@RequestMapping("/googleSignInCallback")
	public String doSessionAssignActionPage(HttpServletRequest request){
		String code = request.getParameter("code");
		
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		AccessGrant accessGrant = oauthOperations.exchangeForAccess(code , googleOAuth2Parameters.getRedirectUri(), null);
		
		String accessToken = accessGrant.getAccessToken();
		Long expireTime = accessGrant.getExpireTime();
		
		if (expireTime != null && expireTime < System.currentTimeMillis()) {
			accessToken = accessGrant.getRefreshToken();
			System.out.printf("accessToken is expired. refresh token = {}", accessToken);
		}
		
		Connection<Google> connection = googleConnectionFactory.createConnection(accessGrant);
		Google google = connection == null ? new GoogleTemplate(accessToken) : connection.getApi();
		
		PlusOperations plusOperations = google.plusOperations();
		Person person = plusOperations.getGoogleProfile();
		
		MemberVO member = new MemberVO();
		member.setMemeberEmail(person.getAccountEmail());
		member.setMemeberName(person.getDisplayName());

		HttpSession session = request.getSession();
		session.setAttribute("member", member);
		
		return "redirect:/";
	}*/

    
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
    	
    	System.out.println(memberService.login(memberEmail));
    	if(memberService.login(memberEmail) != null && pw.equals(memberService.login(memberEmail)))
    	{session.setAttribute("loginInfo", memberEmail);
		return "home";}
    	
        
		return "member/loginForm";
    }
    
    @RequestMapping(value = "/naver_login.json")
    @ResponseBody
    public String naverlogin(HttpServletRequest request, HttpServletResponse response, @RequestParam("email") String test){
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
