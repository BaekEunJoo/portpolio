package com.spring.Imuseum.mypage.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.Imuseum.member.MemberVO;
import com.spring.Imuseum.mypage.AddrVO;
import com.spring.Imuseum.mypage.MypageService;
import com.spring.Imuseum.mypage.ProductFaqVO;
import com.spring.Imuseum.mypage.ReturnVO;
import com.spring.Imuseum.mypage.ReviewVO;
import com.spring.Imuseum.mypage.ReviewWriteVO;
import com.spring.Imuseum.mypage.orderOnlineVO;
import com.spring.Imuseum.mypage.ticketPersonalVO;
import com.spring.Imuseum.mypage.dao.MypageDAO;
import com.spring.Imuseum.order.OrderPagePVO;
import com.spring.Imuseum.order.OrderVO;
import com.spring.Imuseum.ticket.LearnTicketVO;

@Service("mypageService")
public class MypageServiceImpl implements MypageService{

	@Autowired
	private MypageDAO mypageDAO;
	
	@Override
	public List<AddrVO> getAddrList(AddrVO vo) {
		return mypageDAO.getAddrList(vo);
	}

	//배송지관리
	@Override
	public void insertAddr(AddrVO vo) {
		mypageDAO.insertAddr(vo);
	}

	@Override
	public void updateAddr(AddrVO vo) {
		mypageDAO.updateAddr(vo);
	}

	@Override
	public void deleteAddr(AddrVO vo) {
		mypageDAO.deleteAddr(vo);
	}

	@Override
	public List<ReturnVO> returnList(ReturnVO vo) {
		return mypageDAO.returnList(vo);
	}

	//회원정보수정
	@Override
	public void updateInfo(MemberVO vo) {
		mypageDAO.updateInfo(vo);
	}

	@Override
	public List<ticketPersonalVO> ticketPersonal(ticketPersonalVO vo) {
		return mypageDAO.ticketPersonal(vo);
	}

	@Override
	public List<orderOnlineVO> orderOnline(orderOnlineVO vo) {
		return mypageDAO.orderOnline(vo);
	}
	
	@Override
	public int deleteOrder(orderOnlineVO vo) {
		return mypageDAO.deleteOrder(vo);
	}

	@Override
	public int getAddrCnt(AddrVO vo) {
		return mypageDAO.getAddrCnt(vo);
	}

	@Override
	public List<ProductFaqVO> productFaq(ProductFaqVO vo) {
		return mypageDAO.productFaq(vo);
	}

	@Override
	public void deleteFaq(ProductFaqVO vo) {
		mypageDAO.deleteFaq(vo);
	}
	
	@Override
	public ProductFaqVO pqOne(int pqnaNum) {
		return mypageDAO.pqOne(pqnaNum);
	}
	
	@Override
	public List<ReviewVO> productReview(ReviewVO vo) {
		return mypageDAO.productReview(vo);
	}

	@Override
	public List<ReviewWriteVO> reviewWrite(ReviewWriteVO vo) {
		return mypageDAO.reviewWrite(vo);
	}

	@Override
	public void insertReview(ReviewVO vo) {
		mypageDAO.insertReview(vo);
	}

	@Override
	public int ticketCnt(ticketPersonalVO vo) {
		return mypageDAO.ticketCnt(vo);
	}

	@Override
	public void updateAddrDefault(AddrVO vo) {
		mypageDAO.updateAddrDefault(vo);
	}
	
	@Override
	public AddrVO addrOne(int addrNum) {
		return mypageDAO.addrOne(addrNum);
	}
	
	

	//소연----------------------------------------------------------
	@Override
	public List<AddrVO> getAddressList(String id) {
		return mypageDAO.getAddressList(id);
	}
	

	@Override
	public AddrVO getDefaultAddr(String id) {
		return mypageDAO.getDefaultAddr(id);
	}
	
	@Override
	public orderOnlineVO getOrder(String orderNum) {
		return mypageDAO.getOrder(orderNum);
	}
	
	@Override
	public int deleteOrderCard(OrderVO vo) {
		return mypageDAO.deleteOrderCard(vo);
	}

	@Override
	public int updateCancleCnt(OrderPagePVO pvo) {
		return mypageDAO.updateCancleCnt(pvo);
	}

	@Override
	public List<ticketPersonalVO> ticketPersonalToday() {
		return mypageDAO.ticketPersonalToday();
	}

	@Override
	public List<ticketPersonalVO> ticketPersonalWeek() {
		return mypageDAO.ticketPersonalWeek();
	}

	@Override
	public List<ticketPersonalVO> ticketPersonalMonth() {
		return mypageDAO.ticketPersonalMonth();
	}

	@Override
	public List<ticketPersonalVO> ticketPersonalSelect() {
		return mypageDAO.ticketPersonalSelect();
	}

	@Override
	public void deleteTicket(String revNum) {
		mypageDAO.deleteTicket(revNum);
	}

	@Override
	public void deleteLearnTicket(String revNum) {
		mypageDAO.deleteLearnTicket(revNum);
	}

	@Override
	public int getOrderCnt(orderOnlineVO vo) {
		return mypageDAO.getOrderCnt(vo);
	}

	@Override
	public int productReviewInsert(ReviewVO vo) {
		return mypageDAO.productReviewInsert(vo);
	}
	
	@Override
	public int productReviewDelete(int prNum) {
		return mypageDAO.productReviewDelete(prNum);
	}
	
	@Override
	public int productReviewUpdate(ReviewVO vo) {
		return mypageDAO.productReviewUpdate(vo);
	}

	@Override
	public List<LearnTicketVO> getLearnTicket(LearnTicketVO vo) {
		return mypageDAO.getLearnTicket(vo);
	}

	

		




	
}
