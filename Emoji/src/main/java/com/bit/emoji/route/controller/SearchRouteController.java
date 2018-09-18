package com.bit.emoji.route.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.emoji.route.service.SearchRouteService;

@Controller
public class SearchRouteController {
	SearchRouteService searchRouteService;
	
	@RequestMapping("goSearchRoute")
	public String goSearchRoute() {
		return "searchRoute";
	}
	
/*	public String searchRoute(String search, String searchDate, Model model) {
	
	}
	
	public RouteVO clickRoute(int routeNum) {
	
	}
	
	public String clicksScrap(HttpSession session, int routeNum, String state) {
	
	}
	
	public String clickJoin(HttpSession session, int routeNum, String state) {
	
	}*/
}
