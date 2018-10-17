package com.bit.emoji.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import com.bit.emoji.model.DeliciousSearchInfo;
import com.bit.emoji.model.DeliciousVO;
import com.bit.emoji.service.MapService;
import com.bit.emoji.service.MapService.PinService;
import com.bit.emoji.service.MemberService;
import com.bit.emoji.service.SearchService;

@Controller
public class MapController {
    @Autowired
    MemberService memberService;  //회원정보 CRUD
    
	@Autowired
	MapService mapService;    //맛집지도 CR(U)D
	
	@Autowired
	PinService pinService;    //맛집지도 내의 핀 CR(U)D
	
	@Autowired
	SearchService searchService;
	
	//맛집지도 메인 페이지
	@RequestMapping(value="/deliciousForm")
	public String deliciousForm() {
		return "/delicious/deliciousForm";
	}
	
	@RequestMapping("/deliciousDetail")
	public String deliciousDetail(Model model, @RequestParam(value = "deliciousMapNum") int deliciousMapNum) {

		model.addAttribute("dmDetail", mapService.selectMapByDeliciousMapNum(deliciousMapNum));

		return "/delicious/deliciousDetail";
	}

	//맛집지도 등록하고 보여주기
	@RequestMapping(value="/deliciousMapInfo", method=RequestMethod.POST)
	public String insertMap(HttpServletRequest request, DeliciousMapVO deliciousMapVO, Model model) throws Exception {
		deliciousMapVO.setMemberNum(Integer.parseInt(request.getParameter("memberNum")));
		
		//맛집지도 정보 입력
		mapService.insertMap(deliciousMapVO);
		
		//해당 회원번호에 대한 맛집지도 번호 가져오기
		int deliciousMapNum = mapService.selectMapByMemberNum(deliciousMapVO.getMemberNum());
		
		model.addAttribute("deliciousMapNum", deliciousMapNum);
		model.addAttribute("deliciousMapList", mapService.selectMapByDeliciousMapNum(deliciousMapNum));
		
		return "/delicious/deliciousMap";
	}
	
	//핀 정보 등록하고 보여주기
	@RequestMapping(value="/deliciousPinInfo", method=RequestMethod.POST)
	@ResponseBody
	public DeliciousPinInfo insertPin(HttpServletRequest request, DeliciousVO deliciousVO, Model model) throws Exception {
		//핀 정보 입력
		pinService.insertPin(request, deliciousVO);
		
		return new DeliciousPinInfo(pinService.selectPinListBydeliciousMapNum(deliciousVO.getDeliciousMapNum()));
	}
	
	//맛집지도 검색하기
	@RequestMapping(value="/deliciousMapSearch", method=RequestMethod.GET)
	@ResponseBody
	public DeliciousSearchInfo deliciousSearch(@RequestParam("keyword") String keyword) {
		return new DeliciousSearchInfo(mapService.selectMapByKeyword(keyword));
	}
	
	//지도번호에 따른 핀 정보 가져오기
	@RequestMapping(value="/getDeliciousPinInfo", method=RequestMethod.GET)
	@ResponseBody
	public DeliciousPinInfo selectPin(@RequestParam("deliciousMapNum") int deliciousMapNum) {
		return new DeliciousPinInfo(pinService.selectPinListBydeliciousMapNum(deliciousMapNum));
	}
	
	//예외 발생 시
	@ExceptionHandler(Exception.class)
	public String exception(Exception e, Model model) {
		model.addAttribute("error", e.getMessage());
		
		return "exception";
	}
}