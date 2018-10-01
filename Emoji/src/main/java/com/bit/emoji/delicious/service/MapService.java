package com.bit.emoji.delicious.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.bit.emoji.mapper.MapperName;
import com.bit.emoji.model.DeliciousMapVO;
import com.bit.emoji.model.DeliciousPinVO;
import com.bit.emoji.service.ServiceDao;

@Repository
public class MapService extends ServiceDao {
	//지도 생성하기
	public int insertMap(DeliciousMapVO deliciousMapVO) {
		return sqlSession.insert(MapperName.DELICIOUS_MAP + ".insertMap", deliciousMapVO);
	}
	
	//지도 번호에 따른 정보 가져오기
	public List<DeliciousMapVO> selectMapByDeliciousMapNum(int deliciousMapNum) {
		return sqlSession.selectList(MapperName.DELICIOUS_MAP + ".selectMapByDeliciousMapNum", deliciousMapNum);
	}
	
	public int updateMap(int memberNum, DeliciousMapVO deliciousMapVO) {
		return 1;
	}
	
	public int deleteMap(int deliciousMapNum) {
		return 1;
	}
	
	public List<DeliciousMapVO> selectMapListBySearch(String deliciousMapTag) {
		List<DeliciousMapVO> deliciousMapVO = new ArrayList<DeliciousMapVO>();
		
		return deliciousMapVO;
	}
	
	public List<DeliciousMapVO> selectMapListBymemberNum(int memberNum) {
		List<DeliciousMapVO> deliciousMapVO = new ArrayList<DeliciousMapVO>();
		
		return deliciousMapVO;
	}
	
	public class PinService {
		//핀 생성하기
		public int insertPin(DeliciousPinVO deliciousPinVO) {
			return sqlSession.insert(MapperName.DELICIOUS + ".insertPin", deliciousPinVO);
		}
		
		//지도 번호에 따른 핀 정보 가져오기
		public List<DeliciousPinVO> selectPinListBydeliciousMapNum(int deliciousMapNum) {
			return sqlSession.selectList(MapperName.DELICIOUS + ".selectPinListBydeliciousMapNum", deliciousMapNum);
		}
		
		public int updatePin(int deliciousMapNum, DeliciousPinVO deliciousPinVO) {
			return 1;
		}
		
		public int deletePin(int deliciousPinNum) {
			return 1;
		}
	}
}