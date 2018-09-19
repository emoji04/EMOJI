package com.bit.emoji.delicious.service;

import com.bit.emoji.delicious.mapper.MapperName;

public class ExService extends ServiceDao {
	public String getTime() {
		return sqlSession.selectOne(MapperName.namespace + ".getTime");
	}
}