package com.bit.emoji.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.emoji.model.DeliciousMapVO;
import com.bit.emoji.model.DeliciousPinInfo;
import com.bit.emoji.model.DeliciousPinVO;
import com.bit.emoji.model.DeliciousReviewVO;
import com.bit.emoji.service.MapService;
import com.bit.emoji.service.MapService.PinService;

@Controller
public class MapController {
	@Autowired
	MapService mapService;    //맛집지도 CRUD
	
	@Autowired
	PinService pinService;    //맛집지도 내의 핀 CRUD
	
	//DeliciousReviewService deliciousReviewService;
	
	//맛집지도 메인 페이지
	@RequestMapping(value="/deliciousForm")
	public String deliciousForm() {
		return "/delicious/deliciousForm";
	}
	
	public String deliciousEditForm(int num, Model model) {
		return "";
	}
	
	public String deliciousReviewForm() {
		return "";
	}
	
	public String delete(int num, Model model) {
		return "";
	}
	
	//맛집지도 등록하고 보여주기
	@RequestMapping(value="/deliciousMapInfo", method=RequestMethod.POST)
	public String insertMap(HttpServletRequest request, DeliciousMapVO deliciousMapVO, Model model) {
		deliciousMapVO.setDeliciousMapNum(10);
		deliciousMapVO.setMemberNum(Integer.parseInt(request.getParameter("memberNum")));
		
		int cnt = mapService.insertMap(deliciousMapVO);
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("deliciousMapList", mapService.selectMapByDeliciousMapNum(deliciousMapVO.getDeliciousMapNum()));
		
		return "/delicious/deliciousMap";
	}
	
	//핀 정보 등록하고 보여주기
	@RequestMapping(value="/deliciousPinInfo", method=RequestMethod.POST/*, produces="application/text; charset=utf8"*/)
	@ResponseBody
	public DeliciousPinInfo insertPin(HttpServletRequest request, DeliciousPinVO deliciousPinVO, Model model) throws Exception {
		deliciousPinVO.setDeliciousPinNum(9);

		int cnt = pinService.insertPin(request, deliciousPinVO);
		
		List<DeliciousMapVO> deliciousMap = mapService.selectMapByMemberNum(4);
		System.out.println(deliciousMap.get(0));
		System.out.println(deliciousMap.get(1));
		
		//System.out.println(deliciousMap);
		//deliciousMap.get(index)

		//System.out.println(pinService.selectPinListBydeliciousMapNum(deliciousPinVO.getDeliciousMapNum()));
		
		return new DeliciousPinInfo(pinService.selectPinListBydeliciousMapNum(deliciousPinVO.getDeliciousMapNum()));
	}
	
/*	//핀 정보 등록하고 보여주기
	@RequestMapping(value="/deliciousPinInsert", method=RequestMethod.POST, produces="application/text; charset=utf8")
	//@ResponseBody
	public String insertPin(HttpServletRequest request, DeliciousPinVO deliciousPinVO, Model model) throws Exception {
		deliciousPinVO.setDeliciousPinNum(6);
		System.out.println(deliciousPinVO);

		int cnt = pinService.insertPin(request, deliciousPinVO);
		System.out.println(deliciousPinVO.getDeliciousPinAddress());
		pinService.selectPinListBydeliciousMapNum(deliciousPinVO.getDeliciousMapNum());
		
		if(cnt != 1)
			return "실패";
		else
			return deliciousPinVO.getDeliciousPinAddress();
		return "/delicious/deliciousMap";
	}
	
	@RequestMapping(value="/deliciousPinSelect", method=RequestMethod.GET)
	@ResponseBody
	public DeliciousPinInfo selectPin(@RequestParam("deliciousMapNum") int deliciousMapNum) {
		return new DeliciousPinInfo(pinService.selectPinListBydeliciousMapNum(deliciousMapNum));
	}*/
	
	public String writeReivew(HttpSession session, DeliciousReviewVO deliciousReviewVO, Model model) {
		return "";
	}
	
	public String updateMap(HttpSession session, DeliciousMapVO deliciousMapVO, Model model) {
		return "";
	}
	
	public String updatePin(DeliciousPinVO deliciousPinVO, Model model) {
		return "";
	}
	
	public String updateReview(HttpSession session, DeliciousReviewVO deliciousReviewVO, Model model) {
		return "";
	}
	
	public String selectReview(int num, Model model) {
		return "";
	}
	
	@ExceptionHandler(Exception.class)
	public String exception(Exception e, Model model) {
		model.addAttribute("error", e.getMessage());
		
		return "exception";
	}
}