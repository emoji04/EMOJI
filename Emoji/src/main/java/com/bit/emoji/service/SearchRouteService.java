package com.bit.emoji.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.bit.emoji.mapper.MapperName;
import com.bit.emoji.model.DeliciousVO;
import com.bit.emoji.model.OrderedPin;
import com.bit.emoji.model.RouteScrapVO;
import com.bit.emoji.model.RouteSearchVO;
import com.bit.emoji.model.RouteVO;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
@Repository
public class SearchRouteService extends ServiceDao {
	
	public List<RouteVO> searchRoute(RouteSearchVO routeSearch) {
		return sqlSession.selectList(MapperName.SEARCHROUTE + ".selectRoute",routeSearch);
	}
	
	public String selectRouteJoin(RouteScrapVO routeScrap) throws JsonProcessingException {
		Map<Object, Object> result = new HashMap<Object, Object>();
		RouteScrapVO memberNameRoute=new RouteScrapVO();
		
		RouteVO route=sqlSession.selectOne(MapperName.SEARCHROUTE+".selectRouteById",routeScrap.getRouteNum());
		
		memberNameRoute.setMemberNum(route.getMemberNum());
		memberNameRoute.setRouteNum(route.getRouteNum());
		
		List<DeliciousVO> routeDelicious=sqlSession.selectList(MapperName.SEARCHROUTE+".selectRouteDeclicious", routeScrap.getRouteNum());		
		String joinState=sqlSession.selectOne(MapperName.SEARCHROUTE+".selectJoin", routeScrap);
		String memberName=sqlSession.selectOne(MapperName.SEARCHROUTE+".selectMemberName",memberNameRoute);
		
		System.out.println("주최자이름"+memberName);
		
		result.put("memberName", memberName);
		result.put("routeInfo", route);
		result.put("routeDelicious",routeDelicious);
		
		
		if(joinState==null) {
			if(route.getMemberNum()==routeScrap.getMemberNum()) {
				result.put("joinState", "원정대 대장으로 참여중");
			}else {
				result.put("joinState", "참여가능");
			}				
		}else {
			result.put("joinState", joinState);		
		}
		
		String data = new ObjectMapper().writeValueAsString(result);
		return data;
	}
	
	public Object insertJoin(RouteScrapVO routeScrap) {
		//메일에서 승인받으면  joinstate만 바꾸기
		//pathvariable 
		return sqlSession.selectOne(MapperName.SEARCHROUTE + ".insertJoin",routeScrap);				
	}
	public Object deleteJoin(RouteScrapVO routeScrap) {
		return sqlSession.selectOne(MapperName.SEARCHROUTE+".deleteJoin", routeScrap);
				
				
	}
	/*		
	public int insertScrap(int memberNum, int routeNum) {
	
	}
	
	public int deleteScarp(int memberNum, int routeNum) {
	
	}
	

	
*/
}
