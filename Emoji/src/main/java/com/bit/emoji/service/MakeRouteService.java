package com.bit.emoji.service;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bit.emoji.mapper.MapperName;
import com.bit.emoji.model.DeliciousVO;

@Repository
public class MakeRouteService extends ServiceDao {	
	public List<DeliciousVO> selectDelicious(String search) {
		return sqlSession.selectList(MapperName.MAKEROUTE + ".selectDelicious", search);
	}
	
	/*	public List<DeliciousMapVO> selectDeliciousMapbyId(int memberNum) {
	}
	
	public List<DeliciousPinVO> selectMyDelicious(String search, List<DeliciousMapVO> myMaps) {
	}
	
	public int insertRoute(RouteVO route) {
	
	}
	
	public int updateRoute(RouteVO newRoute) {
	
	}
	
	public int deleteRouteDelicious(List<DeliciousPinVO> deleteList) {
	
	}
	
	public int updateRouteInfo(RouteVO newRoute) {
	
	}*/
}
