package com.bit.emoji.mypage.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.emoji.model.MemberVO;
import com.bit.emoji.mypage.service.MypageService;

@Controller
public class MypageController {

	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);

	@Inject
	private MypageService mypageService;

	@RequestMapping(value = "/mypage/memberList", method = RequestMethod.GET)
	public void listAll(Model model, HttpSession session) throws Exception {

		String loginInfo = (String) session.getAttribute("loginInfo");
		logger.info("............................GET");
		model.addAttribute("memberList", mypageService.selectMember(loginInfo));
	}

	@RequestMapping(value = "/mypage/memberList", method = RequestMethod.POST)
	public void update(Model model, MemberVO vo) throws Exception {
		logger.info("...............POST");
		model.addAttribute("updateMember", mypageService.updateMember(vo));
		model.addAttribute("memberList", mypageService.selectMember("loginInfo"));
	}
}
