package com.bit.emoji.mypage.mapper;

import javax.inject.Inject;
import org.springframework.stereotype.Repository;

@Repository
public abstract class SqlSession {
	@Inject
	public org.apache.ibatis.session.SqlSession sqlSession;
}
