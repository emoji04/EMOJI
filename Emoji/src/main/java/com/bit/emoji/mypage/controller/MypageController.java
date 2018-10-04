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




