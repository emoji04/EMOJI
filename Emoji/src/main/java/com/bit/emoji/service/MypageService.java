package com.bit.emoji.service;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bit.emoji.mapper.MapperName;
import com.bit.emoji.model.DeliciousMapReviewVO;
import com.bit.emoji.model.DeliciousMapVO;
import com.bit.emoji.model.DeliciousVO;
import com.bit.emoji.model.MemberVO;
import com.bit.emoji.model.RouteVO;

@Repository
public class MypageService extends ServiceDao {
	public List<MemberVO> selectMember(int loginInfo) throws Exception {
		return sqlSession.selectList(MapperName.MYPAGE + ".listAll", loginInfo);
	}

	public int updateMember(MemberVO vo) throws Exception {
		System.out.println(vo);
		return sqlSession.update(MapperName.MYPAGE + ".updateMember", vo);
	}

	public List<DeliciousMapVO> myDmListAll(int loginInfo) throws Exception {
		return sqlSession.selectList(MapperName.MYPAGE + ".myDmList", loginInfo);
	}

	public List<DeliciousMapReviewVO> myDmReview(int deliciousMapNum) throws Exception {
		return sqlSession.selectList(MapperName.MYPAGE + ".myDmReview", deliciousMapNum);
	}

	public List<DeliciousVO> myDeliciousList(int deliciousMapNum) throws Exception {
		return sqlSession.selectList(MapperName.MYPAGE + ".myDeliciousList", deliciousMapNum);
	}

	public int DeliciousMapDelete(int deliciousMapNum) throws Exception {
		return sqlSession.delete(MapperName.MYPAGE + ".deliciousMapDelete", deliciousMapNum);

	}

	public int changeOpen (DeliciousMapVO vo) throws Exception{
		System.out.println(vo);
		return sqlSession.update(MapperName.MYPAGE +".changeOpen", vo);
	}

	public List<RouteVO> myRouteList(int loginInfo) throws Exception {
		return sqlSession.selectList(MapperName.MYPAGE + ".myRouteList", loginInfo);
	}

}