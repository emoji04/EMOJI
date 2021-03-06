package com.bit.emoji.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.emoji.model.JoinVO;
import com.bit.emoji.model.RouteScrapVO;
import com.bit.emoji.model.RouteSearchVO;
import com.bit.emoji.model.RouteVO;
import com.bit.emoji.service.SearchRouteService;
import com.fasterxml.jackson.core.JsonProcessingException;

@Controller
public class SearchRouteController {
	@Inject
	SearchRouteService searchRouteService;
	
	@ResponseBody
	@RequestMapping(value="routeSearch")
	public List<RouteVO> searchRoute(RouteSearchVO routeSearch) {		
		return searchRouteService.searchRoute(routeSearch);
	}
	
	@ResponseBody
	@RequestMapping(value="clickRoute",produces="text/plain;charset=UTF-8")
	public String clickRoute(RouteScrapVO routeScrap, HttpSession session) throws JsonProcessingException {
		int memberNum=(int) session.getAttribute("loginInfo");
		routeScrap.setMemberNum(memberNum);			
		return searchRouteService.selectRouteJoin(routeScrap);
	}
	
	
	@ResponseBody
	@RequestMapping(value="clickJoin",produces="text/plain;charset=UTF-8")
	public String clickJoin(JoinVO joinVO, HttpSession session) {
		int memberNum=(int) session.getAttribute("loginInfo");
		joinVO.setMemberNum(memberNum);	
		System.out.println("1");
		Object result=searchRouteService.insertJoin(joinVO);
		System.out.println(result);
		
		if(result==null) {
			return "참여가 완료되었습니다.";
		}else {
			return "참여가 정상적으로 완료되지 않았습니다.";
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="cancelJoin",produces="text/plain;charset=UTF-8")
	public String cancelJoin(RouteScrapVO routeScrap, HttpSession session) {
		int memberNum=(int) session.getAttribute("loginInfo");
		routeScrap.setMemberNum(memberNum);	
		
		Object result=searchRouteService.deleteJoin(routeScrap);
		if(result==null) {
			return "참여가 취소되었습니다.";
		}else {
			return "참여취소가 정상적으로 완료되지 않았습니다.";
		}
		
	}
	/*	
	public String clicksScrap(HttpSession session, int routeNum, String state) {
	
	}
	
*/
	//예외 발생 시
	@ExceptionHandler(Exception.class)
	public String exception(Exception e, Model model) {
		model.addAttribute("error", e.getMessage());
		
		return "exception";
	}
}