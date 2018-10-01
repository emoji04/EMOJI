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
	public int insertMap(DeliciousMapVO deliciousMapVO) {
		return sqlSession.insert(MapperName.DELICIOUS_MAP + ".insertMap", deliciousMapVO);
	}
	
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
		public int insertPin(int deliciousMapNum, DeliciousPinVO deliciousPinVO) {
			return 1;
		}
		
		public int updatePin(int deliciousMapNum, DeliciousPinVO deliciousPinVO) {
			return 1;
		}
		
		public int deletePin(int deliciousPinNum) {
			return 1;
		}
		
		public List<DeliciousPinVO> selectPinListBydeliciousMapNum(int deliciousMapNum) {
			List<DeliciousPinVO> deliciousPinVO = new ArrayList<DeliciousPinVO>();
			
			return deliciousPinVO;
		}
	}
}