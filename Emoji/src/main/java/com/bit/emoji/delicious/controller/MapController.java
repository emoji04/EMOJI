package com.bit.emoji.delicious.controller;

<<<<<<< HEAD
=======
import java.util.List;

>>>>>>> branch 'master' of https://github.com/emoji04/EMOJI.git
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.emoji.delicious.service.DeliciousReviewService;
import com.bit.emoji.delicious.service.MapService;
import com.bit.emoji.delicious.service.MapService.PinService;
import com.bit.emoji.model.DeliciousMapVO;
import com.bit.emoji.model.DeliciousPinInfo;
import com.bit.emoji.model.DeliciousPinVO;
import com.bit.emoji.model.DeliciousReviewVO;

@Controller
public class MapController {
	@Autowired
<<<<<<< HEAD
	MapService mapService;    //맛집지도 CRUD
	
	@Autowired
	PinService pinService;    //맛집지도 내의 핀 CRUD
	
=======
	MapService mapService;    //留쏆쭛吏��룄 CRUD
	
	PinService pinService;
>>>>>>> branch 'master' of https://github.com/emoji04/EMOJI.git
	DeliciousReviewService deliciousReviewService;
	
	//맛집지도 메인 페이지
	@RequestMapping("/deliciousForm")
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
	
<<<<<<< HEAD
	//맛집지도 등록하고 보여주기
	@RequestMapping("/deliciousMapInfo")
	public String insertMap(HttpServletRequest request, DeliciousMapVO deliciousMapVO, Model model) {
		deliciousMapVO.setDeliciousMapNum(7);
=======
	//留쏆쭛吏��룄 �벑濡앺븯怨� 蹂댁뿬二쇨린
	@RequestMapping("/deliciousMapInsert")
	public String insertMap(HttpServletRequest request, DeliciousMapVO deliciousMapVO, Model model) {
		deliciousMapVO.setDeliciousMapNum(6);
>>>>>>> branch 'master' of https://github.com/emoji04/EMOJI.git
		deliciousMapVO.setMemberNum(Integer.parseInt(request.getParameter("memberNum")));
		
		int cnt = mapService.insertMap(deliciousMapVO);
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("deliciousMapList", mapService.selectMapByDeliciousMapNum(deliciousMapVO.getDeliciousMapNum()));
		
		return "/delicious/deliciousMap";
	}
	
	//핀 정보 등록하고 보여주기
	@RequestMapping("/deliciousPinInfo.json")
	@ResponseBody
	public DeliciousPinInfo insertPin(HttpServletRequest request, DeliciousPinVO deliciousPinVO, Model model) throws Exception {
		deliciousPinVO.setDeliciousPinNum(4);

		int cnt = pinService.insertPin(request, deliciousPinVO);
		
		return new DeliciousPinInfo(pinService.selectPinListBydeliciousMapNum(deliciousPinVO.getDeliciousMapNum()));
	}
	
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
	
<<<<<<< HEAD
=======

	
	public String selectPin(int num, Model model) {
		return "";
	}
	
>>>>>>> branch 'master' of https://github.com/emoji04/EMOJI.git
	public String selectReview(int num, Model model) {
		return "";
	}
	
	public String exception(Exception e, Model model) {
		return "";
	}
}