package com.spring.Imuseum.learn.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.spring.Imuseum.exhibition.ExhibitionVO;
import com.spring.Imuseum.learn.CategoryLearnVO;
import com.spring.Imuseum.learn.GroupReservationVO;
import com.spring.Imuseum.learn.LearnLikeVO;
import com.spring.Imuseum.learn.LearnVO;

public interface LearnDAO {
	
	//글 입력
	public void insertLearn(LearnVO vo);
	//글 수정
	public void updateLearn(LearnVO vo);
	//글 삭제
	public void deleteLearn(LearnVO vo);
	//글 1개 조회(실습)
	public LearnVO getLearn(LearnVO vo);
	// 목록 출력
//	public List<LearnVO> getLearnList(LearnVO vo);
	// 목록2 출력
	public List<LearnVO> getLearnList2(LearnVO vo);
	// 게시물 총 갯수
	public int countLearn();
	// 게시물 총 갯수2
	public int countLearn2();
	// 년도 별 출력
	public List<LearnVO> yearLearn(LearnVO vo);
	// 현재 카테고리별 출력
	public List<LearnVO> categoryLearn(LearnVO vo);
	// 지난 카테고리별 출력
	public List<LearnVO> categoryLearn2(LearnVO vo);
	// 카테고리 시작
	public List<CategoryLearnVO> category(CategoryLearnVO vo);
	// 단체 예매 조회
//	public List<GroupReservationVO> groupReservation(GroupReservationVO vo);
	// 단체예매 신청
	public void InsertGroupReservation(GroupReservationVO vo);
	// 날짜별 검색
	public List<GroupReservationVO> regdateSearch(GroupReservationVO vo);
	// 조회수 증가
	public int viewsLearn(LearnVO vo);
	// 조회수 별 출력
	public List<LearnVO> selectViews(LearnVO vo);
	// 최신순 출력
	public List<LearnVO> selectNew(LearnVO vo);
	// 오래된 순 출력
	public List<LearnVO> selectOld(LearnVO vo);
	// 단체예매 삭제
	public void groupReservationDelete(GroupReservationVO vo);
	// 단체예매 오늘 데이터 출력
	public List<GroupReservationVO> todayGroupReservation(GroupReservationVO vo);
	// 단체예매 일주일 데이터 출력
	public List<GroupReservationVO> weekGroupReservation(GroupReservationVO vo);
	// 단체예매 한달 데이터 출력
	public List<GroupReservationVO> monthGroupReservation(GroupReservationVO vo);
	// 단체예매 마이페이지
	public List<GroupReservationVO> groupReservationMypage(GroupReservationVO vo);
	// 지난 프로그램 삭제
	public void learnDelete2(LearnVO vo);
	// 추천
	public int updateLike(LearnVO vo);
	// 추천 취소
	public int updateLikeCancel(LearnVO vo);
	// 추천 중복 막기
	public int updateLikeCheck(LearnVO vo);
	// 추천할 때 learnLike 추가
	public void insertLike(LearnLikeVO vo);
	// 추천할 때 learnLike2 추가
	public void insertLike2(LearnLikeVO vo);
	// check
	public int updateLikeCheck(LearnLikeVO vo);
	// learn에서  check 추가
	public int updateLearnLikeCheck(LearnVO vo); 
	// 추천 조회
	public List<LearnLikeVO> selectLearnLike(LearnLikeVO vo);
	// 추천
	public int countHeart(Map<String, String> map);
	// 추천 비추천시 삭제
	public void deleteLike(LearnLikeVO vo);
	// learn3 보기
	List<LearnVO> getLearnList3(LearnVO vo);
	// delete2 삭제
	void deleteLearn2(LearnVO vo);
	
	
	
	
	
	public int getLearnTotalCount();
	public List<LearnVO> getLearnList(@Param("begin")int begin, @Param("end") int end);
	
	int getLearnTotalCount4();
	List<LearnVO> getLearnList4(@Param("begin")int begin, @Param("end") int end);
	
	int getGroupReservationTotalCount();
	public List<GroupReservationVO> groupReservation(@Param("begin")int begin, @Param("end") int end);
	

}
