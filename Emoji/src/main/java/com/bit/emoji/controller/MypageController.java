package com.bit.emoji.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.emoji.model.DeliciousReviewVO;
import com.bit.emoji.model.MemberVO;
import com.bit.emoji.service.MypageService;

@Controller
public class MypageController {

	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);

	
	
	@Inject
	private MypageService mypageService;

	@RequestMapping(value = "mypage/memberUpdateForm", method = RequestMethod.GET)
	public void listAll(Model model, HttpSession session) throws Exception {
		int loginInfo = (int) session.getAttribute("loginInfo"); // 세션값 불러옴 memberNum
		logger.info("............................GET");
		model.addAttribute("memberUpdateForm", mypageService.selectMember(loginInfo));
	}

	@RequestMapping(value = "mypage/memberUpdateForm", method = RequestMethod.POST)
	public void update(Model model, MemberVO vo, HttpSession session) throws Exception {
		int loginInfo = (int) session.getAttribute("loginInfo"); // 세션값 불러옴 memberNum
		logger.info("...............POST");
		model.addAttribute("updateMember", mypageService.updateMember(vo));
		model.addAttribute("memberUpdateForm", mypageService.selectMember(loginInfo));
	}

	@RequestMapping(value ="mypage/MydmForm",  method = RequestMethod.GET)
	public void myDmList(Model model, HttpSession session) throws Exception{
		int loginInfo = (int) session.getAttribute("loginInfo"); // 세션값 불러옴 memberNum
		logger.info("........myDmList GET ...");
		model.addAttribute("myDmList", mypageService.myDmListAll(loginInfo));
	
		
	}
	@ResponseBody
	@RequestMapping(value="myDmReview")
	public void myDmReviewList(DeliciousReviewVO vo, Model model, HttpSession session) throws Exception {
		int dMapNum = (int) session.getAttribute("deliciousMapNum"); //ajax에서 dMapNum을 받아옴 
		logger.info("........myDmReview GET ...");
		model.addAttribute("myDmReview", mypageService.myDmReview(dMapNum));
	}
}
