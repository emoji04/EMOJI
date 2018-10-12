package com.bit.emoji.controller;

import java.util.ArrayList;
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
import com.bit.emoji.model.DeliciousPinVO;
import com.bit.emoji.model.OrderedPin;
import com.bit.emoji.model.RouteVO;
import com.bit.emoji.service.MakeRouteService;
import com.mysql.fabric.xmlrpc.base.Array;

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
		System.out.println(search);
		return makeRouteService.selectDelicious(search);
	}
	

	@RequestMapping(value="makeRoute",produces = "application/text; charset=utf8", method=RequestMethod.GET)
	public String makeRoute(RouteVO route, Model model,HttpServletRequest request) {
		//맛집과 순서를 담을 모델 생성
		List<OrderedPin> orderedPinList = new ArrayList<OrderedPin>();;
		
		int routeNum=0; 
		
		//맛집 번호를 순서대로 담은 스트링 가지고옴
		String orders=request.getParameter("order");		
		//배열로 만들어줌
		String[] order=orders.split(",");				
		//루트넘버 가지고오기	
		String maxRoute=makeRouteService.selectRouteNum();
		
		if(maxRoute==null) {
			routeNum=1;
		}else {
			int max=Integer.parseInt(maxRoute);
			routeNum=max+1;
		}
		

		for (int i = 0; i < order.length; i++) {	
			OrderedPin orderPin= new OrderedPin();
			//스트링 배열이므로 숫자로 바꾼후에 모델에 저장
			orderPin.setDeliciousNum(Integer.parseInt(order[i]));
			orderPin.setOrder(i+1);
			orderPin.setRouteNum(routeNum);
			orderedPinList.add(orderPin);
		}

		//int result=makeRouteService.
				
		return "home";
	}
	
	/*	public String getMyMap(HttpSession session, Model model) {
	}
	
	public String searchMyDelicious(String search, List<DeliciousMapVO> myMaps, Model model) {
	
	}
	

	
	public String updateRoute(RouteVO route, Model model) {
	
	}*/
}