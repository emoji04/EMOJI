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
import com.bit.emoji.model.DeliciousSearchVO;
import com.bit.emoji.model.DeliciousVO;
import com.bit.emoji.service.MapService;
import com.bit.emoji.service.MapService.PinService;
import com.bit.emoji.service.MemberService;

@Controller
public class MapController {
    @Autowired
    MemberService memberService;  //회원정보 CRUD
    
	@Autowired
	MapService mapService;    //맛집지도 CR(U)D
	
	@Autowired
	PinService pinService;    //맛집지도 내의 핀 CR(U)D
	
	//맛집지도 메인 페이지
	@RequestMapping(value="/deliciousForm")
	public String deliciousForm() {
		return "/delicious/deliciousForm";
	}
	
	public String delete(int num, Model model) {
		return "";
	}
	
	@RequestMapping("/deliciousDetail")
	public String deliciousDetail(Model model, @RequestParam(value = "deliciousMapNum") int deliciousMapNum) {

		model.addAttribute("dmDetail", mapService.selectMapByDeliciousMapNum(deliciousMapNum));

		return "/delicious/deliciousDetail";
	}

	
	//맛집지도 등록하기
	@RequestMapping(value="/deliciousMapInfo", method=RequestMethod.POST)
	public String insertMap(HttpServletRequest request, DeliciousMapVO deliciousMapVO, Model model) throws Exception {
		//deliciousMapVO.setDeliciousMapNum(10);
		
		deliciousMapVO.setMemberNum(Integer.parseInt(request.getParameter("memberNum")));
		
		mapService.insertMap(deliciousMapVO);
		int deliciousMapNum = mapService.selectMapByMemberNum(deliciousMapVO.getMemberNum());
		
		//model.addAttribute("cnt", cnt);
		model.addAttribute("deliciousMapNum", deliciousMapNum);
		model.addAttribute("deliciousMapList", mapService.selectMapByDeliciousMapNum(deliciousMapNum));
		
		return "/delicious/deliciousMap";
	}
	
	//핀 정보 등록하고 보여주기
	@RequestMapping(value="/deliciousPinInfo", method=RequestMethod.POST/*, produces="application/text; charset=utf8"*/)
	@ResponseBody
	public DeliciousPinInfo insertPin(HttpServletRequest request, DeliciousVO deliciousVO, Model model) throws Exception {
		//deliciousVO.setDeliciousNum(9);

		pinService.insertPin(request, deliciousVO);
		
		//System.out.println(deliciousMap);
		//deliciousMap.get(index)

		//System.out.println(pinService.selectPinListBydeliciousMapNum(deliciousPinVO.getDeliciousMapNum()));
		
		return new DeliciousPinInfo(pinService.selectPinListBydeliciousMapNum(deliciousVO.getDeliciousMapNum()));
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
	
	//맛집지도 검색하기
	@RequestMapping(value="/deliciousSearch", method=RequestMethod.GET)
	@ResponseBody
	public List<DeliciousSearchVO> deliciousSearch(@RequestParam("keyword") String keyword) {
		return mapService.selectMapByKeyword(keyword);
	}
	
	//예외 발생 시
	@ExceptionHandler(Exception.class)
	public String exception(Exception e, Model model) {
		model.addAttribute("error", e.getMessage());
		
		return "exception";
	}
}