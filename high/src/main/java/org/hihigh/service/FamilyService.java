package org.hihigh.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.hihigh.domain.EventVO;
import org.hihigh.domain.FamilyVO;

public interface FamilyService {

		// 회원가입
		void insertMember(FamilyVO family);
		
		// id 체크
		boolean selectId(String id);
		
		// id 찾기
		FamilyVO idfind(FamilyVO fvo);
		
		// pwd
		int pwdfind(FamilyVO fvo);
		// 새로운 pwd
		int pwdUpdate(FamilyVO fvo);
		
		// 로그인
		FamilyVO login(FamilyVO fvo);
		
		// 로그아웃
		void logout(HttpSession session);
		
		// 맴버 리스트 ( 페이지 네이션을 사용했기에 없어도 무방)
		List<FamilyVO> getMemberList();
		
		// 맴버 리스트 + 페이지 네이션
	    List<FamilyVO> mlistPage(int displayPost, int postNum);
	    
	    // 예약 리스트
	    List<EventVO> admReser();
	    
	    // 총 맴버 인원
	    int count();
		
		// admin으로 맴버 추방
		void admdelMem(String id);
		
		// 내 정보
		FamilyVO getMyInfo(String id);
		
		// 내 정보 수정
		void updateMember(
				@Param("id") String id,
				@Param("filename") String filename,
				@Param("pwd") String pwd,
				@Param("tel") String tel,
				@Param("email") String email);
		
		// 맴버 연령별 인원
		List<Map<String, Object>> TotalAge();
	    
		// 회사별 연령
		Integer Balgre(String age);
		Integer Perge(String age);
		Integer Fimrico(String age);
		Integer National(String age);
		Integer Geo(String age);
		
		// 회사 예약 인원
	    List<EventVO> getBalgre(String company);
	    
	    // header에 img를 가져오기 위함
	    String selectImg(String filename);
	    
	    // 내 예약 현황
	    List<EventVO> myReservation(String id);
	    
	    // 예약 승인 처리
	    void approveEvent(@Param("id") String id, @Param("company") String company);
	    
	    // 예약 취소 처리
	    void deleteById(@Param("id") String id);
}










