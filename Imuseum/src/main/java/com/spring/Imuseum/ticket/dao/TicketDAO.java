package com.spring.Imuseum.ticket.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.Imuseum.ticket.ExhibitionTicketVO;
import com.spring.Imuseum.ticket.ExhibitionTypeVO;
import com.spring.Imuseum.ticket.LearnTicketVO;

public interface TicketDAO {

	//전시 티켓 예매
	public void insertExTicket(ExhibitionTicketVO vo);
	//전시 티켓 수정(상태변경)
	public void updateExTicket(ExhibitionTicketVO vo);
	public ExhibitionTicketVO getExTicketOne(String revNum);
	//교육 티켓 예매
	public void insertLearnTicket(LearnTicketVO vo);
	//교육 티켓 수정
	public void updateLearnTicket(LearnTicketVO vo);
	public LearnTicketVO getLearnTicketOne(String revNum);
	//전시 티켓 권종 구분
	public List<ExhibitionTypeVO> getTicketType();
	//전시 티켓 목록보기-관리자
	public int ExhibitionTicketCount();
	public int ExhibitionTicketTotal();
	public int ExhibitionTicketCancel();
	public int ExhibitionTicketCancel(ExhibitionTicketVO vo);
	public List<ExhibitionTicketVO> getExhibitionTicket(ExhibitionTicketVO vo);
	public List<ExhibitionTicketVO> getExhibitionTicketSearch(ExhibitionTicketVO vo);
	
	public int ExhibitionTicketCountToday();
	public int ExhibitionTicketTotalToday();
	public int ExhibitionTicketCancelToday();
	public List<ExhibitionTicketVO> getExhibitionTicketToday(ExhibitionTicketVO vo);
	
	public int ExhibitionTicketCountWeek();
	public int ExhibitionTicketTotalWeek();
	public int ExhibitionTicketCancelWeek();
	public List<ExhibitionTicketVO> getExhibitionTicketWeek(ExhibitionTicketVO vo);
	
	public int ExhibitionTicketCountMonth();
	public int ExhibitionTicketTotalMonth();
	public int ExhibitionTicketCancelMonth();
	public List<ExhibitionTicketVO> getExhibitionTicketMonth(ExhibitionTicketVO vo);
	
	public int getExhibitionTicketCancle(ExhibitionTicketVO vo);
	public List<ExhibitionTicketVO> getExhibitionTicketSelect(ExhibitionTicketVO vo);
	
	//교육 티켓 목록보기 - 관리자
	public int learnTicketCount();
	public int learnTicketTotal();
	public int learnTicketCancel();
	public int learnTicketCancel(LearnTicketVO vo);
	public List<LearnTicketVO> getLearnTicket(LearnTicketVO vo);
	public List<LearnTicketVO> getLearnTicketSearch(LearnTicketVO vo);
	
	public int learnTicketCountToday();
	public int learnTicketTotalToday();
	public int learnTicketCancelToday();
	public List<LearnTicketVO> getLearnTicketToday(LearnTicketVO vo);
	
	public int learnTicketCountWeek();
	public int learnTicketTotalWeek();
	public int learnTicketCancelWeek();
	public List<LearnTicketVO> getLearnTicketWeek(LearnTicketVO vo);
	
	public int learnTicketCountMonth();
	public int learnTicketTotalMonth();
	public int learnTicketCancelMonth();
	public List<LearnTicketVO> getLearnTicketMonth(LearnTicketVO vo);
	
	public int getLearnTicketCancle(LearnTicketVO vo);
	public List<LearnTicketVO> getLearnTicketSelect(LearnTicketVO vo);
	
	//교육 티켓 인원수 확인
	public List<LearnTicketVO> getTicketmember(int learnIdx);
	
	
	
	
	
	
}
