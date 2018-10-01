package com.bit.emoji.route.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.emoji.model.DeliciousMapVO;
import com.bit.emoji.model.DeliciousPinVO;
import com.bit.emoji.route.service.MakeRouteService;

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
	public List<DeliciousPinVO> searchDelicious(@RequestParam(value="search", defaultValue="떡볶이") String search, Model model) {
		return makeRouteService.selectDelicious(search);
	}
	
	/*	public String getMyMap(HttpSession session, Model model) {
	}
	
	public String searchMyDelicious(String search, List<DeliciousMapVO> myMaps, Model model) {
	
	}
	
	public String makeRoute(RouteVO route, Model model) {
	
	}
	
	public String updateRoute(RouteVO route, Model model) {
	
	}*/
}
