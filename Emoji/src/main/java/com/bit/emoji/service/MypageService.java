package com.bit.emoji.service;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bit.emoji.mapper.BaseMapper;
import com.bit.emoji.mapper.SqlSession;
import com.bit.emoji.model.DeliciousMapVO;
import com.bit.emoji.model.MemberVO;

@Repository
public class MypageService extends SqlSession {

	public List<MemberVO> selectMember(int loginInfo) throws Exception {

		return sqlSession.selectList(BaseMapper.MypageMapper + ".listAll", loginInfo);
	}

	public int updateMember(MemberVO vo) throws Exception {

		return sqlSession.update(BaseMapper.MypageMapper + ".updateMember", vo);
	}

	public List<DeliciousMapVO> myDmListAll(int loginInfo) throws Exception {

		return sqlSession.selectList(BaseMapper.MypageMapper + ".myDmList", loginInfo);
	}
}
