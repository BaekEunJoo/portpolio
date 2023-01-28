package com.spring.Imuseum.ticket.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.Imuseum.ticket.ExhibitionTicketVO;
import com.spring.Imuseum.ticket.ExhibitionTypeVO;
import com.spring.Imuseum.ticket.LearnTicketVO;
import com.spring.Imuseum.ticket.TicketService;
import com.spring.Imuseum.ticket.dao.TicketDAO;


@Service("ticketService")
public class TicketServiceImpl implements TicketService{

	@Autowired
	private TicketDAO ticketDAO;
	
	
	@Override
	public void insertExTicket(ExhibitionTicketVO vo) {
		ticketDAO.insertExTicket(vo);
		
	}

	@Override
	public void updateExTicket(ExhibitionTicketVO vo) {
		ticketDAO.updateExTicket(vo);
		
	}

	@Override
	public List<ExhibitionTypeVO> getTicketType() {
		return ticketDAO.getTicketType();
	}

	

	@Override
	public void insertLearnTicket(LearnTicketVO vo) {
		ticketDAO.insertLearnTicket(vo);
		
	}

	@Override
	public List<LearnTicketVO> getLearnTicket(LearnTicketVO vo) {
		return ticketDAO.getLearnTicket(vo);
	}

	@Override
	public List<LearnTicketVO> getTicketmember(int learnIdx) {
		return ticketDAO.getTicketmember(learnIdx);
	}

	@Override
	public List<ExhibitionTicketVO> getExhibitionTicketToday(ExhibitionTicketVO vo) {
		return ticketDAO.getExhibitionTicketToday(vo);
	}

	@Override
	public List<ExhibitionTicketVO> getExhibitionTicketWeek(ExhibitionTicketVO vo) {
		return ticketDAO.getExhibitionTicketWeek(vo);
	}

	@Override
	public List<ExhibitionTicketVO> getExhibitionTicketMonth(ExhibitionTicketVO vo) {
		return ticketDAO.getExhibitionTicketMonth(vo);
	}

	@Override
	public List<ExhibitionTicketVO> getExhibitionTicketSelect(ExhibitionTicketVO vo) {
		return ticketDAO.getExhibitionTicketSelect(vo);
	}

	@Override
	public ExhibitionTicketVO getExTicketOne(String revNum) {
		return ticketDAO.getExTicketOne(revNum);
	}

	@Override
	public List<LearnTicketVO> getLearnTicketToday(LearnTicketVO vo) {
		return ticketDAO.getLearnTicketToday(vo);
	}

	@Override
	public List<LearnTicketVO> getLearnTicketWeek(LearnTicketVO vo) {
		return ticketDAO.getLearnTicketWeek(vo);
	}

	@Override
	public List<LearnTicketVO> getLearnTicketMonth(LearnTicketVO vo) {
		return ticketDAO.getLearnTicketMonth(vo);
	}

	@Override
	public List<LearnTicketVO> getLearnTicketSelect(LearnTicketVO vo) {
		return ticketDAO.getLearnTicketSelect(vo);
	}

	@Override
	public LearnTicketVO getLearnTicketOne(String revNum) {
		return ticketDAO.getLearnTicketOne(revNum);
	}

	@Override
	public void updateLearnTicket(LearnTicketVO vo) {
		ticketDAO.updateLearnTicket(vo);
	}

	@Override
	public List<ExhibitionTicketVO> getExhibitionTicket(ExhibitionTicketVO vo) {
		return ticketDAO.getExhibitionTicket(vo);
	}

	@Override
	public int ExhibitionTicketCount() {
		return ticketDAO.ExhibitionTicketCount();
	}

	@Override
	public int ExhibitionTicketTotal() {
		return ticketDAO.ExhibitionTicketTotal();
	}
	
	@Override
	public int ExhibitionTicketCancel() {
		return ticketDAO.ExhibitionTicketCancel();
	}
	
	@Override
	public int ExhibitionTicketCountToday() {
		return ticketDAO.ExhibitionTicketCountToday();
	}

	@Override
	public int ExhibitionTicketTotalToday() {
		return ticketDAO.ExhibitionTicketTotalToday();
	}

	@Override
	public int ExhibitionTicketCountWeek() {
		return ticketDAO.ExhibitionTicketCountWeek();
	}

	@Override
	public int ExhibitionTicketTotalWeek() {
		return ticketDAO.ExhibitionTicketTotalWeek();
	}

	@Override
	public int ExhibitionTicketCountMonth() {
		return ticketDAO.ExhibitionTicketCountMonth();
	}

	@Override
	public int ExhibitionTicketTotalMonth() {
		return ticketDAO.ExhibitionTicketTotalMonth();
	}

	@Override
	public int learnTicketCount() {
		return ticketDAO.learnTicketCount();
	}

	@Override
	public int learnTicketTotal() {
		return ticketDAO.learnTicketTotal();
	}

	@Override
	public int learnTicketCancel() {
		return ticketDAO.learnTicketCancel();
	}

	@Override
	public int ExhibitionTicketCancelToday() {
		return ticketDAO.ExhibitionTicketCancelToday();
	}

	@Override
	public int ExhibitionTicketCancelWeek() {
		return ticketDAO.ExhibitionTicketCancelWeek();
	}

	@Override
	public int ExhibitionTicketCancelMonth() {
		return ticketDAO.ExhibitionTicketCancelMonth();
	}

	@Override
	public List<ExhibitionTicketVO> getExhibitionTicketSearch(ExhibitionTicketVO vo) {
		return ticketDAO.getExhibitionTicketSearch(vo);
	}

	@Override
	public int getExhibitionTicketCancle(ExhibitionTicketVO vo) {
		return ticketDAO.getExhibitionTicketCancle(vo);
	}

	@Override
	public int ExhibitionTicketCancel(ExhibitionTicketVO vo) {
		return ticketDAO.ExhibitionTicketCancel(vo);
	}

	@Override
	public int learnTicketCancel(LearnTicketVO vo) {
		return ticketDAO.learnTicketCancel(vo);
	}

	@Override
	public int learnTicketCountToday() {
		return ticketDAO.learnTicketCountToday();
	}

	@Override
	public int learnTicketTotalToday() {
		return ticketDAO.learnTicketTotalToday();
	}

	@Override
	public int learnTicketCancelToday() {
		return ticketDAO.learnTicketCancelToday();
	}

	@Override
	public int learnTicketCountWeek() {
		return ticketDAO.learnTicketCountWeek();
	}

	@Override
	public int learnTicketTotalWeek() {
		return ticketDAO.learnTicketTotalWeek();
	}

	@Override
	public int learnTicketCancelWeek() {
		return ticketDAO.learnTicketCancelWeek();
	}

	@Override
	public int learnTicketCountMonth() {
		return ticketDAO.learnTicketCountMonth();
	}

	@Override
	public int learnTicketTotalMonth() {
		return ticketDAO.learnTicketTotalMonth();
	}

	@Override
	public int learnTicketCancelMonth() {
		return ticketDAO.learnTicketCancelMonth();
	}

	@Override
	public List<LearnTicketVO> getLearnTicketSearch(LearnTicketVO vo) {
		return ticketDAO.getLearnTicketSearch(vo);
	}

	@Override
	public int getLearnTicketCancle(LearnTicketVO vo) {
		return ticketDAO.getLearnTicketCancle(vo);
	}

}
