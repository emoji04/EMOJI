package com.bit.emoji.service;

import java.util.List;

import org.springframework.stereotype.Repository;
import com.bit.emoji.model.DeliciousMapVO;
import com.bit.emoji.model.DeliciousPinVO;
import com.bit.emoji.model.OrderedPin;
import com.bit.emoji.model.RouteVO;

import com.bit.emoji.mapper.MapperName;
import com.bit.emoji.model.DeliciousVO;

@Repository
public class MakeRouteService extends ServiceDao {	
	public List<DeliciousVO> selectDelicious(String search) {
		return sqlSession.selectList(MapperName.MAKEROUTE + ".selectDelicious", search);
	}
	public String selectRouteNum() {
		return sqlSession.selectOne(MapperName.MAKEROUTE+".selectRouteNum");
	}
	
	public Object insertRoute(RouteVO route) {
		return sqlSession.selectOne(MapperName.MAKEROUTE+".routeInsert",route);
	}
	
	public Object insertOrder(List<OrderedPin> orderedPinList) {
		return sqlSession.selectOne(MapperName.MAKEROUTE+".orderInsert",orderedPinList);
	}
	
	/*	public List<DeliciousMapVO> selectDeliciousMapbyId(int memberNum) {
	}
	
	public List<DeliciousPinVO> selectMyDelicious(String search, List<DeliciousMapVO> myMaps) {
	}
	

	
	public int updateRoute(RouteVO newRoute) {
	
	}
	
	public int updateRouteInfo(RouteVO newRoute) {
	
	}*/
}
