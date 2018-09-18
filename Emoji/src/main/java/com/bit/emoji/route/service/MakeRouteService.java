package com.bit.emoji.route.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.bit.emoji.route.mapper.SqlSession;
import com.bit.emoji.route.model.DeliciousMapVO;
import com.bit.emoji.route.model.DeliciousPinVO;
import com.bit.emoji.route.model.RouteVO;

public class MakeRouteService extends SqlSession {
	
	public List<DeliciousPinVO> selectDelicious(String search) {
	}
	
	public List<DeliciousMapVO> selectDeliciousMapbyId(int memberNum) {
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
	
	}
}
