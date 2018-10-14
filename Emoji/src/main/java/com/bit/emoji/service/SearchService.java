package com.bit.emoji.service;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bit.emoji.mapper.MapperName;
import com.bit.emoji.model.DeliciousMapVO;
import com.bit.emoji.model.RouteVO;

@Repository
public class SearchService extends ServiceDao {

	public List<DeliciousMapVO> selectDmap(String search2) {
		return sqlSession.selectList(MapperName.SEARCH + ".getDmap", search2);
	}

	public List<RouteVO> selectRoute(String search2) {
		return sqlSession.selectList(MapperName.SEARCH + ".getRoute", search2);
	}

}
