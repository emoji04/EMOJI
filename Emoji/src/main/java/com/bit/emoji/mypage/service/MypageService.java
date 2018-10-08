package com.bit.emoji.mypage.service;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bit.emoji.model.DeliciousMapVO;
import com.bit.emoji.model.MemberVO;
import com.bit.emoji.mypage.mapper.BaseMapper;
import com.bit.emoji.mypage.mapper.SqlSession;

@Repository
public class MypageService extends SqlSession {

	public List<MemberVO> selectMember(String loginInfo) throws Exception {

		return sqlSession.selectList(BaseMapper.MypageMapper + ".listAll", loginInfo);
	}

	public int updateMember(MemberVO vo) throws Exception {

		return sqlSession.update(BaseMapper.MypageMapper + ".updateMember", vo);
	}

	public List<DeliciousMapVO> myDmlist(String loginInfo) throws Exception {

		return sqlSession.selectList(BaseMapper.MypageMapper + ".myDmList", loginInfo);
	}
}
