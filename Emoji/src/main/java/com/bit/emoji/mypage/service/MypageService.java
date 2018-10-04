package com.bit.emoji.mypage.service;

import java.util.List;

import org.springframework.stereotype.Repository;
import com.bit.emoji.model.MemberVO;
import com.bit.emoji.mypage.mapper.BaseMapper;
import com.bit.emoji.mypage.mapper.SqlSession;

@Repository
public class MypageService extends SqlSession  {

	public List<MemberVO> selectMember(String memberEmail) throws Exception {
		
		
		return sqlSession.selectList(BaseMapper.MypageMapper + ".listAll", memberEmail);
	}
}
