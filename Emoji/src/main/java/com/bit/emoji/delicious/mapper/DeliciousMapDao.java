package com.bit.emoji.delicious.mapper;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.bit.emoji.model.DeliciousMapVO;

public class DeliciousMapDao implements DeliciousDao {
	SqlSessionFactory sqlSessionFactory;
	
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}
	
	public List<DeliciousMapVO> selectList() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		try {
			return sqlSession.selectList("com.bit.emoji.delicious.DeliciousDao.selectList");	
		} finally {
			sqlSession.close();
		}
	}
	
	public DeliciousMapVO selectOne(int num) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		try {
			return sqlSession.selectOne("com.bit.emoji.delicious.DeliciousDao.selectOne", num);
		} finally {
			sqlSession.close();
		}
	}
	
	public int insert(DeliciousMapVO deliciousMapVO) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		try {
			int count = sqlSession.insert("com.bit.emoji.delicious.DeliciousDao.insert", deliciousMapVO);
			sqlSession.commit();
			return count;
		} finally {
			sqlSession.close();
		}
	}
	
	public int update(DeliciousMapVO deliciousMapVO) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		try {
			int count = sqlSession.update("com.bit.emoji.delicious.DeliciousDao.update", deliciousMapVO);
			sqlSession.commit();
			return count;
		} finally {
			sqlSession.close();
		}
	}
	
	public int delete(int num) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		try {
			int count = sqlSession.delete("com.bit.emoji.delicious.DeliciousDao.delete", num);
			sqlSession.commit();
			return count;	
		} finally {
			sqlSession.close();
		}
	}
}