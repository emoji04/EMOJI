package com.bit.emoji.service;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bit.emoji.mapper.MapperName;
import com.bit.emoji.model.DeliciousMapVO;
import com.bit.emoji.model.DeliciousMapReviewVO;
import com.bit.emoji.model.MemberVO;

@Repository
public class MypageService extends ServiceDao {
	public List<MemberVO> selectMember(int loginInfo) throws Exception {
		return sqlSession.selectList(MapperName.MYPAGE + ".listAll", loginInfo);
	}

	public int updateMember(MemberVO vo) throws Exception {
		return sqlSession.update(MapperName.MYPAGE + ".updateMember", vo);
	}

	public List<DeliciousMapVO> myDmListAll(int loginInfo) throws Exception {
		return sqlSession.selectList(MapperName.MYPAGE + ".myDmList", loginInfo);
	}
	
	public List<DeliciousMapReviewVO> myDmReview(int deliciousMapNum) throws Exception{
		return sqlSession.selectList(MapperName.MYPAGE + ".myDmReview", deliciousMapNum);
	}
}