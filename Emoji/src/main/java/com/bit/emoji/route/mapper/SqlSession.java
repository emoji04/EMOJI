package com.bit.emoji.route.mapper;

import javax.inject.Inject;
import org.springframework.stereotype.Repository;

@Repository
public abstract class SqlSession {
	@Inject
	public org.apache.ibatis.session.SqlSession sqlSession;
}