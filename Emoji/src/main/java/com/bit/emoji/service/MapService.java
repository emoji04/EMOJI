package com.bit.emoji.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;

import com.bit.emoji.mapper.MapperName;
import com.bit.emoji.model.DeliciousMapVO;
import com.bit.emoji.model.DeliciousSearchVO;
import com.bit.emoji.model.DeliciousVO;

@Repository
public class MapService extends ServiceDao {
	//지도 생성하기
	public int insertMap(DeliciousMapVO deliciousMapVO) {
		return sqlSession.insert(MapperName.DELICIOUSMAP + ".insertMap", deliciousMapVO);
	}
	
	//지도 번호에 따른 정보 가져오기
	public List<DeliciousMapVO> selectMapByDeliciousMapNum(int deliciousMapNum) {
		return sqlSession.selectList(MapperName.DELICIOUSMAP + ".selectMapByDeliciousMapNum", deliciousMapNum);
	}	
	
	//회원 번호에 따른 지도 번호 가져오기
	public int selectMapByMemberNum(int memberNum) {
		return sqlSession.selectOne(MapperName.DELICIOUSMAP + ".selectMapByMemberNum", memberNum);
	}
	
	//검색어와 일치하는 지도 정보 가져오기
	public List<DeliciousSearchVO> selectMapByKeyword(String keyword) {
		Map<String, String> parameter = new HashMap<String, String>();
		parameter.put("deliciousMapName", keyword);
		parameter.put("deliciousMapTag", keyword);
		
		return sqlSession.selectList(MapperName.DELICIOUSMAP + ".selectMapByKeyword", parameter);
	}

	public class PinService {
		//핀 생성하기
		public int insertPin(HttpServletRequest request, DeliciousVO deliciousVO) throws Exception {
			//저장용 파일 이름
			String deliciousImgName = "";
			//저장 경로 설정
			String uploadUri = "resources/uploadFile/deliciousPinPhoto";
			
			//시스템의 물리적인 경로
			String dir = request.getSession().getServletContext().getRealPath(uploadUri);
			
			//사용자의 업로드 파일 물리적으로 저장
			if(!deliciousVO.getDeliciousFile().isEmpty()) {
				deliciousImgName = deliciousVO.getDeliciousFile().getOriginalFilename();
				
				//저장
				deliciousVO.getDeliciousFile().transferTo(new File(dir, deliciousImgName));
				
				//DB에 저장할 파일 이름 설정
				deliciousVO.setDeliciousImg(deliciousImgName);
			}
			
			return sqlSession.insert(MapperName.DELICIOUSMAP + ".insertPin", deliciousVO);
		}
		
		//지도 번호에 따른 핀 정보 가져오기
		public List<DeliciousVO> selectPinListBydeliciousMapNum(int deliciousMapNum) {
			return sqlSession.selectList(MapperName.DELICIOUSMAP + ".selectPinListBydeliciousMapNum", deliciousMapNum);
		}
		
		public int updatePin(int deliciousMapNum, DeliciousVO deliciousPinVO) {
			return 1;
		}
		
		public int deletePin(int deliciousPinNum) {
			return 1;
		}
	}
}