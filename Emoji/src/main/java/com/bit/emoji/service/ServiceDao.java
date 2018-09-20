package com.bit.emoji.service;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public abstract class ServiceDao {
	@Inject
	protected SqlSession sqlSession;
}