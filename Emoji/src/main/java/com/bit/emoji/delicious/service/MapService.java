package com.bit.emoji.delicious.service;

import java.util.ArrayList;
import java.util.List;

import com.bit.emoji.model.DeliciousMapVO;
import com.bit.emoji.model.DeliciousPinVO;

public class MapService {
	SqlSession sqlsession;
	
	public int insertMap(int memberNum, DeliciousMapVO deliciousMapVO) {
		return 1;
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