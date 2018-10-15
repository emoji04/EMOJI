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
//    	MemberVO memberVO = memberService.login(memberEmail);
    	
//		System.out.println(memberService.login(memberEmail));
//		System.out.println(memberVO.getMemberPassword());
//		System.out.println(memberService.login(memberService.login(memberEmail).getMemberPassword()));
//    	System.out.println(memberService.login(memberPassword));
    	if(memberService.login(memberEmail) != null && pw.equals(memberService.login(memberEmail).getMemberPassword())){
    		
    		session.setAttribute("loginInfo", memberService.login(memberEmail).getMemberNum());
    		System.out.println(session.getAttribute("loginInfo"));
    	System.out.println(memberService.login(memberEmail));
    	InetAddress localHost = InetAddress.getLocalHost();
        System.out.println("자신의 IP 정보");
        System.out.println("localHost.getHostName() : " + localHost.getHostName());
        System.out.println("localHost.getHostAddress() : " + localHost.getHostAddress());


		return "home";}else {
    	
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>alert('회원정보가 올바르지 않습니다. 다시 로그인 해 주세요.'); </script>");
        out.flush();
		return "member/loginForm";}
    }
    
    @RequestMapping(value = "/naver_login.json")
    @ResponseBody
    public String naverlogin(HttpServletRequest request, HttpServletResponse response, @RequestParam("email") String memberEmail, @RequestParam("name") String memberName){
		HttpSession session = request.getSession(false);
		if(memberService.login(memberEmail) != null) {
			MemberVO memberVO = memberService.login(memberEmail);
			session.setAttribute("loginInfo", memberVO.getMemberNum());
	    	System.out.println(memberEmail);
	    	return memberEmail;
    	}else {
    		long time = System.currentTimeMillis(); 
    		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd");
    		String regidate = dayTime.format(new Date(time));
    		System.out.println(memberName+"-->네이버 이름");
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
	    	System.out.println(memberEmail+"-->네이버 db등록하고 나서");
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
    
    @RequestMapping(value = "/regicheck.json")
    @ResponseBody
    public String regiCheck(HttpServletRequest request, HttpServletResponse response, @RequestParam("email") String email){
    	System.out.println(email);
		
		if(memberService.login(email) != null) {
			return "alreadyExist";			
		}else {
			return "possibleRegi";			
		}
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
		System.out.println("아자");
		RedirectView rv = new RedirectView(viewName);
		System.out.println("아자아자");
		rv.setExposeModelAttributes(false);
		System.out.println("아자아자아자");
		ModelAndView modelAndView = new ModelAndView(rv);
		modelAndView.addObject("email", email);
		modelAndView.setViewName(viewName);
		System.out.println("아자아자자자자");
		return modelAndView;
	}
    
    @RequestMapping(value = "/emailSend.do")
    public String goEmailSend(@RequestParam String email, HttpServletRequest request){
    	
    	request.setAttribute("email", request.getParameter("email"));
    	
        return "member/emailSend";
    }
    
    
    @RequestMapping(value="/registe", method = RequestMethod.POST)
	public ModelAndView processLogin(MemberVO member, HttpServletRequest request, HttpServletResponse response, @RequestParam("memberEmail") String email, @RequestParam("emailKey") String emailKey) throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException, Exception {
/*		String a = member.getMemberPassword();
		
		String b = sha.encrypt(a);
		System.out.println("암호화 후 비밀번호 : " + b);*/
    	long time = System.currentTimeMillis(); 
    	SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd");
		String regidate = dayTime.format(new Date(time));
		String viewName = "member/regiSuccess";
		String viewName2 = "member/emailchk";

		EmailKeyVO emailAllowed = memberService.allowedEmail(email);
		System.out.println(emailAllowed);
		if(emailAllowed != null && emailKey.equals(emailAllowed.getKey())) {
			System.out.println(emailAllowed);
			System.out.println(emailKey);
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.addObject("memberRegDate", regidate);
			modelAndView.setViewName(viewName);
			System.out.println(regidate);
			member.setMemberRegDate(regidate);
	
			
			int insertCnt = memberService.insertMember(member);
	
			modelAndView.addObject("insertMember", insertCnt);
			
			return modelAndView;
		}else {
			response.setContentType("text/html; charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        out.println("<script>alert('이메일 인증 후 한 시간이 지났거나 잘못된 접근입니다. 다시 이메일 인증을 해주세요'); </script>");
	        out.flush();
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.setViewName(viewName2);
			return modelAndView;
		}
    }
}

