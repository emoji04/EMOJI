package com.bit.emoji.delicious.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
		public int insertPin(HttpServletRequest request, DeliciousPinVO deliciousPinVO) throws Exception {
			//저장용 파일 이름
			String deliciousPinImgName = "";
			
			//저장 경로 설정
			String uploadUri = "/uploadFile/deliciousPinPhoto";
			
			//시스템의 물리적인 경로
			String dir = request.getSession().getServletContext().getRealPath(uploadUri);
			
			//사용자의 업로드 파일 물리적으로 저장
			if(!deliciousPinVO.getDeliciousPinFile().isEmpty()) {
				deliciousPinImgName = "dm_" + deliciousPinVO.getDeliciousPinNum() + "_" + deliciousPinVO.getDeliciousPinFile().getOriginalFilename();
				
				//저장
				deliciousPinVO.getDeliciousPinFile().transferTo(new File(dir, deliciousPinImgName));
				
				//DB에 저장할 파일 이름
				deliciousPinVO.setDeliciousPinImg(deliciousPinImgName);
			
			}
			return sqlSession.insert(MapperName.DELICIOUS_MAP + ".insertPin", deliciousPinVO);
		}
		
		//지도 번호에 따른 핀 정보 가져오기
		public List<DeliciousPinVO> selectPinListBydeliciousMapNum(int deliciousMapNum) {
			return sqlSession.selectList(MapperName.DELICIOUS_MAP + ".selectPinListBydeliciousMapNum", deliciousMapNum);
		}
		
		public int updatePin(int deliciousMapNum, DeliciousPinVO deliciousPinVO) {
			return 1;
		}
		
		public int deletePin(int deliciousPinNum) {
			return 1;
		}
	}
}