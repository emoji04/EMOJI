package com.bit.emoji.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.emoji.model.DeliciousMapVO;
import com.bit.emoji.model.DeliciousVO;
import com.bit.emoji.model.RouteVO;
import com.bit.emoji.service.MakeRouteService;

@Controller
public class MakeRouteController {
	
	@Inject
	MakeRouteService makeRouteService;
	
	@RequestMapping("goRoute")
	public String goMakeRoute() {
		return "route";
	}	
	@ResponseBody
	@RequestMapping("search")
	public List<DeliciousVO> searchDelicious(@RequestParam(value="search", defaultValue="떡볶이") String search, Model model) {
		System.out.println(search);
		return makeRouteService.selectDelicious(search);
	}
	

	@RequestMapping(value="makeRoute",produces = "application/text; charset=utf8", method=RequestMethod.GET)
	public String makeRoute(RouteVO route, Model model,HttpServletRequest request) {
		//String[] addresses=request.getParameterValues("addresses[]");		
		String addresses=request.getParameter("addresses");
		String[] addressesList=addresses.split(",");
		System.out.println("1" + addressesList); 
		System.out.println("2" + route);
		
		return "home";
	}
	
	/*	public String getMyMap(HttpSession session, Model model) {
	}
	
	public String searchMyDelicious(String search, List<DeliciousMapVO> myMaps, Model model) {
	
	}
	

	
	public String updateRoute(RouteVO route, Model model) {
	
	}*/
}
