package com.bit.emoji.service;

import java.util.List;

import com.bit.emoji.mapper.MapperName;
import com.bit.emoji.model.DeliciousMapReviewVO;
import com.bit.emoji.model.DeliciousMapScrapVO;
import com.bit.emoji.model.DeliciousMapVO;
import com.bit.emoji.model.DeliciousVO;

public class MapDetailService extends ServiceDao {

	// 맛집지도 상세 맛집리스트
	public List<DeliciousVO> selectDetailDelicious(int deliciousMapNum) {
		return sqlSession.selectList(MapperName.DELICIOUSMAP + ".selectMapDetailDelicious", deliciousMapNum);
	}

	// 맛집지도 상세 정보
	public List<DeliciousMapVO> selectDetail(int deliciousMapNum) {
		return sqlSession.selectList(MapperName.DELICIOUSMAP + ".selectMapDetail", deliciousMapNum);
	}

	// 맛집지도 리뷰리스트
	public List<DeliciousMapReviewVO> selectDetailReview(int deliciousMapNum) {
		return sqlSession.selectList(MapperName.DELICIOUSMAP + ".selectMapDetailReview", deliciousMapNum);
	}

	// 맛집지도 리뷰평균
	public float selectMapReviewAvg(int deliciousMapNum) {
		return sqlSession.selectOne(MapperName.DELICIOUSMAP + ".selectMapReviewAvg", deliciousMapNum);
	}

	// 맵스크랩 확인
	public int selectScrapCheck(DeliciousMapScrapVO deliciousMapScrapVO) {
		return sqlSession.selectOne(MapperName.DELICIOUSMAP + ".selectScrapCheck", deliciousMapScrapVO);

	}

	// 맵리뷰 삽입
	public int insertMapReview(DeliciousMapReviewVO deliciousMapReviewVO) {
		return sqlSession.insert(MapperName.DELICIOUSMAP + ".insertMapReview", deliciousMapReviewVO);
	}
	
	//맵리뷰 삭제
	public int deleteMapReview(int deliciousMapReviewNum) {
		return sqlSession.delete(MapperName.DELICIOUSMAP + ".deleteMapReview", deliciousMapReviewNum);

	}
	
}
