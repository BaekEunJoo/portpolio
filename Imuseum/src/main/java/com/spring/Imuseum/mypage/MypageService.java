package com.spring.Imuseum.mypage;

import java.util.List;

import com.spring.Imuseum.member.MemberVO;
import com.spring.Imuseum.order.OrderPagePVO;
import com.spring.Imuseum.order.OrderVO;
import com.spring.Imuseum.ticket.LearnTicketVO;

public interface MypageService {
	
	//배송지관리
	List<AddrVO> getAddrList(AddrVO vo);
	void insertAddr(AddrVO vo);
	void updateAddr(AddrVO vo);
	void updateAddrDefault(AddrVO vo);
	AddrVO addrOne(int addrNum);
	void deleteAddr(AddrVO vo);
	int getAddrCnt(AddrVO vo);
	
	//취소반품내역
	List<ReturnVO> returnList(ReturnVO vo);
	
	//티켓 예매 내역(개인)
	List<ticketPersonalVO> ticketPersonal(ticketPersonalVO vo);
	List<ticketPersonalVO> ticketPersonalToday();
	List<ticketPersonalVO> ticketPersonalWeek();
	List<ticketPersonalVO> ticketPersonalMonth();
	List<ticketPersonalVO> ticketPersonalSelect();
	void deleteTicket(String revNum);
	void deleteLearnTicket(String revNum);
	int ticketCnt(ticketPersonalVO vo);
	
	//교육 티켓
	List<LearnTicketVO> getLearnTicket(LearnTicketVO vo);
	
	//주문내역(온라인)
	List<orderOnlineVO> orderOnline(orderOnlineVO vo);
	int deleteOrder(orderOnlineVO vo); //update
	int getOrderCnt(orderOnlineVO vo);
	
	//상품문의내역확인
	List<ProductFaqVO> productFaq(ProductFaqVO vo);
	void deleteFaq(ProductFaqVO vo);
	ProductFaqVO pqOne(int pqnaNum);
	
	//작성한 리뷰
	List<ReviewVO> productReview(ReviewVO vo);
	
	//작성가능한 리뷰
	List<ReviewWriteVO> reviewWrite(ReviewWriteVO vo);
	void insertReview(ReviewVO vo);
	
	//회원정보수정
	void updateInfo(MemberVO vo);
	
	//소연----------------------------------------------------------
	//회원별 배송지 조회
	List<AddrVO> getAddressList(String id);
	
	//기본배송지 조회
	AddrVO getDefaultAddr(String id);
	
	//오더 1건 조회
	orderOnlineVO getOrder(String orderNum);
	
	//오더 취소(카드결제)
	int deleteOrderCard(OrderVO ovo); //update
	int updateCancleCnt(OrderPagePVO pvo);
	
	//상품리뷰작성
	int productReviewInsert(ReviewVO vo);
	int productReviewDelete(int prNum);
	int productReviewUpdate(ReviewVO vo);
	
}
