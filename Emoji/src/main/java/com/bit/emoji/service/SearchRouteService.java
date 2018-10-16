package com.bit.emoji.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bit.emoji.mapper.MapperName;
import com.bit.emoji.model.DeliciousVO;
import com.bit.emoji.model.OrderedPin;
import com.bit.emoji.model.RouteScrapVO;
import com.bit.emoji.model.RouteVO;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class SearchRouteService extends ServiceDao {
	
	public List<RouteVO> searchRoute() {
		return sqlSession.selectList(MapperName.SEARCHROUTE + ".selectRoute");
	}
	
	public String selectRouteJoin(RouteScrapVO routeScrap) throws JsonProcessingException {
		Map<Object, Object> result = new HashMap<Object, Object>();
		
		RouteVO route=sqlSession.selectOne(MapperName.SEARCHROUTE+".selectRouteById",routeScrap.getRouteNum());
		List<DeliciousVO> routeDelicious=sqlSession.selectList(MapperName.SEARCHROUTE+".selectRouteDeclicious", routeScrap.getRouteNum());		
		String joinState=sqlSession.selectOne(MapperName.SEARCHROUTE+".selectJoin", routeScrap);
		result.put("routeInfo", route);
		result.put("routeDelicious",routeDelicious);
		if(joinState!=null) {
			if(route.getMemberNum()==routeScrap.getMemberNum()) {
				result.put("joinState", "원정대 대장으로 참여중");
			}else
				result.put("joinState", joinState);		
		}else {
			result.put("joinState", "참여가능");
		}
		String data = new ObjectMapper().writeValueAsString(result);
		return data;
	}
	/*		
	public int insertScrap(int memberNum, int routeNum) {
	
	}
	
	public int deleteScarp(int memberNum, int routeNum) {
	
	}
	
	public int insertJoin(int memberNum, int routeNum) {
		//메일에서 승인받으면  joinstate만 바꾸기
		//pathvariable 
	}
	
	public int deleteJoin(int memberNum, int routeNum) {
	
	}*/
}
