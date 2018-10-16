package com.bit.emoji.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.emoji.model.DeliciousMapReviewVO;
import com.bit.emoji.model.MemberVO;
import com.bit.emoji.service.MypageService;

@Controller
public class MypageController {
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);

	@Autowired
	MypageService mypageService;

	@RequestMapping(value = "memberUpdateForm", method = RequestMethod.GET)
	public String listAll(Model model, HttpSession session) throws Exception {
		int loginInfo =  (Integer) session.getAttribute("loginInfo"); // 세션값 불러옴 memberNum
		logger.info("............................GET");
		model.addAttribute("memberUpdateForm", mypageService.selectMember((Integer) session.getAttribute("loginInfo")));
		return "mypage/memberUpdateForm";
	}

	@RequestMapping(value = "memberUpdateForm", method = RequestMethod.POST)
	public String update(Model model, MemberVO vo, HttpSession session) throws Exception {
		int loginInfo = (Integer) session.getAttribute("loginInfo"); // 세션값 불러옴 memberNum
		logger.info("...............POST");
		model.addAttribute("updateMember", mypageService.updateMember(vo));
		model.addAttribute("memberUpdateForm", mypageService.selectMember(loginInfo));
		return "mypage/memberUpdateForm";
	}

	@RequestMapping(value ="MydmForm",  method = RequestMethod.GET)
	public String myDmList(Model model, HttpSession session) throws Exception{
		int loginInfo =  (Integer) session.getAttribute("loginInfo"); // 세션값 불러옴 memberNum
		logger.info("........myDmList GET ...");
		model.addAttribute("myDmList", mypageService.myDmListAll(loginInfo));
		return "mypage/MydmForm";
	}
	
	@ResponseBody
	@RequestMapping(value="myDmReview")
	public List<DeliciousMapReviewVO> myDmReviewList(DeliciousMapReviewVO vo, Model model, @RequestParam("deliciousMapNum") String deliciousMapNum) throws Exception {
		logger.info("........myDmReview POST ...");
		logger.info(deliciousMapNum);
		List<DeliciousMapReviewVO> callList = mypageService.myDmReview(Integer.parseInt(deliciousMapNum));
		System.out.println(callList);
		return callList;
	}
}