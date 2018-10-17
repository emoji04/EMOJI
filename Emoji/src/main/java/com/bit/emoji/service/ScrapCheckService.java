package com.bit.emoji.service;

import org.springframework.stereotype.Repository;

import com.bit.emoji.mapper.MapperName;
import com.bit.emoji.model.DeliciousMapScrapVO;

@Repository
public class ScrapCheckService extends ServiceDao{
	
	 public int insertScrap(DeliciousMapScrapVO deliciousMapScrapVO) {
		return sqlSession.insert(MapperName.DELICIOUSMAP + ".insertScrap", deliciousMapScrapVO);
	}
	
	public int deleteScrap(DeliciousMapScrapVO deliciousMapScrapVO) {
		return sqlSession.delete(MapperName.DELICIOUSMAP + ".deleteScrap", deliciousMapScrapVO);
	}

	
}
