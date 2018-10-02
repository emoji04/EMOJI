package com.bit.emoji.mypage.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.emoji.mypage.service.MypageService;

@Controller
public class MypageController {

	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);

	@Inject
	private MypageService mypageService;

	@RequestMapping(value="/mypage/memberList", method= RequestMethod.GET)
	public void listAll(Model model, HttpSession session) throws Exception{
		
		session.setAttribute("memberEmail", "91@naver.com");
		logger.info("SHOW ME THE MONEY777............................");
		model.addAttribute("memberList", mypageService.selectMember("91@naver.com"));
	}
}
	




//
//package com.bit.emoji.mypage.controller;
//
//import java.util.List;
//
//import javax.inject.Inject;
//import javax.servlet.http.HttpSession;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import com.bit.emoji.model.MemberVO;
//import com.bit.emoji.mypage.service.MypageService;
//
//@Controller
//public class MypageController {
//
//	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
//
//	@Inject
//	private MypageService mypageService;
//	
//	@RequestMapping(value="/mypage/memberList")
//	public void listAll(Model model, HttpSession session, MemberVO vo) throws Exception{
//		
//		/*session.setAttribute("memberEmail", "91@naver.com"); //임의값으로 아이디입력해줌
//*/		
//		vo.setMemberEmail("91@naver.com");
//		logger.info(vo.toString());
//		
//		System.out.println(vo.getMemberEmail() +"123123");
//		
//		List<MemberVO> vo1 = mypageService.selectMember(vo.getMemberEmail());
//		
//		System.out.println(vo1);
//		
//		model.addAttribute("memberList", mypageService.selectMember(vo.getMemberEmail()));
//		
//		
		
//		logger.info(vo.toString());
		
		

	/*@RequestMapping(value="/mypage/memberList", method= RequestMethod.GET)
		public String getMemberList() {
		return "/mypage/memberList";
	}
	@ResponseBody
	@RequestMapping(value="/mypage/memberList", method= RequestMethod.POST)
	public List<MemberVO> listAll(Model model, HttpSession session) throws Exception{
		session.setAttribute("memberEmail", "91@naver.com");
		
		logger.info("......................");
		
		return mypageService.selectMember("91@naver.com");
		
	}
	@RequestMapping(value="/mypage/memberList")
	public String update(@ModelAttribute MemberVO vo, HttpSession session) throws Exception{
		mypageService.updateMember("91@naver.com");
		return "mypage/memberList";
		
		*/
	


