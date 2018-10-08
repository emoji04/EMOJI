package com.bit.emoji.service;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bit.emoji.mapper.MapperName;
import com.bit.emoji.model.MemberVO;

@Repository
public class MypageService extends ServiceDao  {
	public List<MemberVO> selectMember(String memberEmail) throws Exception {
		return sqlSession.selectList(MapperName.MYPAGE + ".listAll", memberEmail);
	}
}