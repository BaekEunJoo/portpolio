package com.spring.Imuseum.learn;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.spring.Imuseum.exhibition.ExhibitionVO;

public interface LearnService {
	//CRUD 기능 구현 메서드 정의
	// 입력
	void insertLearn(LearnVO vo);
	// 수정
	void updateLearn(LearnVO vo);
	// 삭제
	void deleteLearn(LearnVO vo);
	//1개의 데이터 조회
	LearnVO getLearn(LearnVO vo); 
	//전체글 조회
//	List<LearnVO> getLearnList(); 
//	List<LearnVO> getLearnList(LearnVO vo);
	//전체글 조회2
	List<LearnVO> getLearnList2(); 
	List<LearnVO> getLearnList2(LearnVO vo);
	// 게시물 총 갯수
	public int countLearn();
	// 게시물 총 갯수
	public int countLearn2();
	// 연도별 조회
	List<LearnVO> yearLearn(LearnVO vo);
	// 현재 카테고리별 조회
	List<LearnVO> categoryLearn(LearnVO vo);
	// 지난 카테고리별 조회
	List<LearnVO> categoryLearn2(LearnVO vo);
	// 단체예매 조회
//	List<GroupReservationVO> groupReservation(GroupReservationVO vo);
	// 단체예매 추가
	void InsertGroupReservation(GroupReservationVO vo);
	// 날짜별 검색
	List<GroupReservationVO> regdateSearch(GroupReservationVO vo);
	// learn 조회수 증가
	int viewsLearn(LearnVO vo);
	// views 조회 수 많은 것부터 출력
	List<LearnVO> selectViews(LearnVO vo);
	// 최신순 출력
	List<LearnVO> selectNew(LearnVO vo);
	// 오래된 순 출력
	List<LearnVO> selectOld(LearnVO vo);
	// 단체예매 삭제
	void groupReservationDelete(GroupReservationVO vo);
	// 단체예매 오늘 데이터 출력
	List<GroupReservationVO> todayGroupReservation(GroupReservationVO vo);
	// 단체예매 일주일 데이터 출력
	List<GroupReservationVO> weekGroupReservation(GroupReservationVO vo);
	// 단체예매 한달 데이터 출력
	List<GroupReservationVO> monthGroupReservation(GroupReservationVO vo);
	// 단체예매 마이페이지
	List<GroupReservationVO> groupReservationMypage(GroupReservationVO vo);
	//지난 프로그램 삭제
	void learnDelete2(LearnVO vo);
	// 추천
	public int updateLike(LearnVO vo);
	// 추천 취소
	public int updateLikeCancel(LearnVO vo);
	// learnLike 추가
	public void insertLike(LearnLikeVO vo);
	// learnLike 추가
	public void insertLike2(LearnLikeVO vo);
	// check 추가
	public int updateLikeCheck(LearnLikeVO vo);
	// Learn에서 check 추가
	public int updateLearnLikeCheck(LearnVO vo);
	// LIKE 조회
	List<LearnLikeVO> selectLearnLike(LearnLikeVO vo);
	// 추천
	public int countHeart(Map<String, String> map);
	// 추천 비추천시 삭제
	public void deleteLike(LearnLikeVO vo);
	// learn3 보기
	List<LearnVO> getLearnList3(LearnVO vo);
	// delete2 삭제
	void deleteLearn2(LearnVO vo);
	
	
	
	
	int getLearnTotalCount();
	List<LearnVO> getLearnList(@Param("begin")int begin, @Param("end") int end);
	
	int getLearnTotalCount4();
	List<LearnVO> getLearnList4(@Param("begin")int begin, @Param("end") int end);
	
	
	int getGroupReservationTotalCount();
	List<GroupReservationVO> groupReservation(@Param("begin")int begin, @Param("end") int end);
	

}
