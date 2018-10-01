package com.bit.emoji.service;

import org.springframework.stereotype.Repository;

import com.bit.emoji.mapper.MapperName;

@Repository
public class ExService extends ServiceDao {
	public String getTime() {
		return sqlSession.selectOne(MapperName.NAMESPACE + ".getTime");
	}
}