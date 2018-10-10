package com.bit.emoji.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.emoji.mapper.RouteMapper;
import com.bit.emoji.mapper.SqlSession;
import com.bit.emoji.model.DeliciousMapVO;
import com.bit.emoji.model.DeliciousPinVO;
import com.bit.emoji.model.RouteVO;

@Repository
public class MakeRouteService extends SqlSession {	
	public List<DeliciousPinVO> selectDelicious(String search) {
		return sqlSession.selectList(RouteMapper.MAKEROUTE+".selectDelicious", search);
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
