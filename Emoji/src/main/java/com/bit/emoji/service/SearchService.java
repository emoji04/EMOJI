package com.bit.emoji.service;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bit.emoji.mapper.MapperName;
import com.bit.emoji.model.DeliciousMapVO;
import com.bit.emoji.model.RouteVO;

@Repository
public class SearchService extends ServiceDao {

	//맛집 지도 검색리스트
		public List<DeliciousMapVO> selectDmap(String search2) {
			return sqlSession.selectList(MapperName.SEARCH + ".getDmap", search2);
		}
		
		//스크랩수 정보
		public int selectScrapCount(int count) {
			return sqlSession.selectOne(MapperName.SEARCH + ".getCount", count);
		}

		//원정대 검색리스트
		public List<RouteVO> selectRoute(String search2) {
			return sqlSession.selectList(MapperName.SEARCH + ".getRoute", search2);
		}

}
