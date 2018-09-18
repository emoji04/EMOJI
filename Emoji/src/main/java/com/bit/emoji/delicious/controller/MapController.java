package com.bit.emoji.delicious.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.emoji.delicious.service.DeliciousReviewService;
import com.bit.emoji.delicious.service.MapService;
import com.bit.emoji.delicious.service.MapService.PinService;
import com.bit.emoji.model.DeliciousMapVO;
import com.bit.emoji.model.DeliciousPinVO;
import com.bit.emoji.model.DeliciousReviewVO;

@Controller
public class MapController {
	MapService mapService;
	PinService pinService;
	DeliciousReviewService deliciousReviewService;
	
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
	
	public String insertMap(HttpSession session, DeliciousMapVO deliciousMapVO, Model model) {
		return "";
	}
	
	public String insertPin(DeliciousPinVO deliciousPinVO, Model model) {
		return "";
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
	
	public String selectMap(HttpSession session, String deliciousMapTag, Model model) {
		return "";
	}
	
	public String selectPin(int num, Model model) {
		return "";
	}
	
	public String selectReview(int num, Model model) {
		return "";
	}
	
	public String exception(Exception e, Model model) {
		return "";
	}
}