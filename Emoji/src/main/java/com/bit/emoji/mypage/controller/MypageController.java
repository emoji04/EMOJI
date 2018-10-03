package com.bit.emoji.mypage.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cglib.core.Local;
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

	@RequestMapping(value="/mypage/memberList", method= RequestMethod.GET)
	public void listAll(Model model) throws Exception{
		logger.info("SHOW ME THE MONEY777............................");
		model.addAttribute("memberList", mypageService.selectMember("91@naver.com"));
	}
}
