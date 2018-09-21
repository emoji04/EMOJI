package com.bit.emoji.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.social.google.api.Google;
import org.springframework.social.google.api.impl.GoogleTemplate;
import org.springframework.social.google.api.plus.Person;
import org.springframework.social.google.api.plus.PlusOperations;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.emoji.member.service.MailSendService;
import com.bit.emoji.member.service.MemberService;
import com.bit.emoji.model.MemberVO;
import com.mysql.jdbc.Connection;

@Controller
public class membercontroller {
    MailSendService mailSendService;
    MemberService memberService;
    
    private GoogleConnectionFactory googleConnectionFactory;
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
	
/*	@RequestMapping("/googleSignInCallback")
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

	@RequestMapping(value = "loginForm2")
    public String goLoginForm(){
        return "member/LoginForm";
    }
    
    @RequestMapping(value = "member/loginSuccess")
    public String goLoginSuccess(){
        return "member/LoginSuccess";
    }
    @RequestMapping(value = "loginSuccess")
    public String goLoginSuccess2(){
        return "member/LoginSuccess";
    }

    @RequestMapping(value = "loginForm")
    public String goLoginFormtest(){
        return "member/LoginFormtest";
    }
    
    public String goRegForm(){
        return null;
    }

    public String goUpdateForm(){
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
