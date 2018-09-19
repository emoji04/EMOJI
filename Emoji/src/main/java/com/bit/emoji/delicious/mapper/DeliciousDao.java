package com.bit.emoji.delicious.mapper;

import java.util.List;

import com.bit.emoji.model.DeliciousMapVO;

public interface DeliciousDao {
	List<DeliciousMapVO> selectList() throws Exception;
	int insert(DeliciousMapVO deliciousMapVO) throws Exception;
	DeliciousMapVO selectOne(int num) throws Exception;
	int update(DeliciousMapVO deliciousMapVO) throws Exception;
	int delete(int num) throws Exception;
}