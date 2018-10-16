package com.bit.emoji.controller;

import java.io.UnsupportedEncodingException;
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

import com.bit.emoji.model.DeliciousVO;
import com.bit.emoji.model.RouteVO;
import com.bit.emoji.service.MakeRouteService;
import com.mysql.fabric.xmlrpc.base.Array;

@Controller
public class MakeRouteController {
	
	@Inject
	MakeRouteService makeRouteService;
	
	@RequestMapping(value="goRoute")
	public String goMakeRoute() {
		return "route";
	}	
	
	//검색 ajax 컨트롤러
	@ResponseBody
	@RequestMapping(value="search")
	public List<DeliciousVO> searchDelicious(@RequestParam(value="ajaxSearch", defaultValue="떡볶이") String search, Model model) {
		return makeRouteService.selectDelicious(search);
	}
	

	@RequestMapping(value="makeRoute", method=RequestMethod.GET)
	public String makeRoute(RouteVO route,HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession(false);
		
		route.setMemberNum((int)session.getAttribute("loginInfo"));
		//맛집과 순서를 담을 모델 생성
		List<OrderedPin> orderedPinList = new ArrayList<OrderedPin>();;
		
		int routeNum=0; 
		
		//맛집 번호를 순서대로 담은 스트링 가지고옴
		String orders=request.getParameter("order");		
		//배열로 만들어줌
		String[] order=orders.split(",");				
		//루트넘버 가지고오기	
		System.out.println("맛집번호 순서대로 담은 스트링 : "+orders);
		System.out.println("스트링 배열로 만든것 : "+order);
		String maxRoute=makeRouteService.selectRouteNum();
		System.out.println("maxRouteNum : "+maxRoute);
		
		if(maxRoute==null) {
			routeNum=1;
			route.setRouteNum(routeNum);
		}else {
			int max=Integer.parseInt(maxRoute);
			routeNum=max+1;
			route.setRouteNum(routeNum);
		}
		System.out.println("루트 모델에 들어간 모양 : "+route);
		
		//경로를 우선 입력 후 입력이 완료 되었으면 맛집 순서를 넣기
		Object result=makeRouteService.insertRoute(route);
		
		if(result==null) {			
			for (int i = 0; i < order.length; i++) {	
				OrderedPin orderPin= new OrderedPin();
				//스트링 배열이므로 숫자로 바꾼후에 모델에 저장
				orderPin.setDeliciousNum(Integer.parseInt(order[i]));
				orderPin.setDeliciousOrder(i+1);
				orderPin.setRouteNum(routeNum);
				orderedPinList.add(orderPin);
			}
			makeRouteService.insertOrder(orderedPinList);		
		}
				
		return "home";
	}
	
	/*	public String getMyMap(HttpSession session, Model model) {
	}
	
	public String searchMyDelicious(String search, List<DeliciousMapVO> myMaps, Model model) {
	
	}
	

	
	public String updateRoute(RouteVO route, Model model) {
	
	}*/
}
