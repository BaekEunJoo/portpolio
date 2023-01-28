package com.spring.Imuseum.ticket;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface TicketService {
	
	void insertExTicket(ExhibitionTicketVO vo);
	void updateExTicket(ExhibitionTicketVO vo);
	ExhibitionTicketVO getExTicketOne(String revNum);
	void insertLearnTicket(LearnTicketVO vo);
	LearnTicketVO getLearnTicketOne(String revNum);
	void updateLearnTicket(LearnTicketVO vo);
	
	List<ExhibitionTypeVO> getTicketType();
	
	//전시 티켓 목록보기-관리자
	int ExhibitionTicketCount();
	int ExhibitionTicketTotal();
	int ExhibitionTicketCancel();
	int ExhibitionTicketCancel(ExhibitionTicketVO vo);
	List<ExhibitionTicketVO> getExhibitionTicket(ExhibitionTicketVO vo);
	List<ExhibitionTicketVO> getExhibitionTicketSearch(ExhibitionTicketVO vo);
	
	int ExhibitionTicketCountToday();
	int ExhibitionTicketTotalToday();
	int ExhibitionTicketCancelToday();
	List<ExhibitionTicketVO> getExhibitionTicketToday(ExhibitionTicketVO vo);
	int ExhibitionTicketCountWeek();
	int ExhibitionTicketTotalWeek();
	int ExhibitionTicketCancelWeek();
	List<ExhibitionTicketVO> getExhibitionTicketWeek(ExhibitionTicketVO vo);
	int ExhibitionTicketCountMonth();
	int ExhibitionTicketTotalMonth();
	int ExhibitionTicketCancelMonth();
	List<ExhibitionTicketVO> getExhibitionTicketMonth(ExhibitionTicketVO vo);
	
	int getExhibitionTicketCancle(ExhibitionTicketVO vo);
	List<ExhibitionTicketVO> getExhibitionTicketSelect(ExhibitionTicketVO vo);
	
	//교육 티켓 목록보기 - 관리자
	int learnTicketCount();
	int learnTicketTotal();
	int learnTicketCancel();
	int learnTicketCancel(LearnTicketVO vo);
	List<LearnTicketVO> getLearnTicket(LearnTicketVO vo);
	List<LearnTicketVO> getLearnTicketSearch(LearnTicketVO vo);
	
	int learnTicketCountToday();
	int learnTicketTotalToday();
	int learnTicketCancelToday();
	List<LearnTicketVO> getLearnTicketToday(LearnTicketVO vo);
	
	int learnTicketCountWeek();
	int learnTicketTotalWeek();
	int learnTicketCancelWeek();
	List<LearnTicketVO> getLearnTicketWeek(LearnTicketVO vo);
	
	int learnTicketCountMonth();
	int learnTicketTotalMonth();
	int learnTicketCancelMonth();
	List<LearnTicketVO> getLearnTicketMonth(LearnTicketVO vo);
	
	int getLearnTicketCancle(LearnTicketVO vo);
	List<LearnTicketVO> getLearnTicketSelect(LearnTicketVO vo);
	
	List<LearnTicketVO> getTicketmember(int learnIdx);
}
