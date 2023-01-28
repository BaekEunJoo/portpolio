package com.spring.Imuseum.view.mypage;


import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.Imuseum.learn.GroupReservationVO;
import com.spring.Imuseum.learn.LearnService;
import com.spring.Imuseum.member.MemberService;
import com.spring.Imuseum.member.MemberVO;
import com.spring.Imuseum.mypage.AddrVO;
import com.spring.Imuseum.mypage.MypageService;
import com.spring.Imuseum.mypage.ProductFaqVO;
import com.spring.Imuseum.mypage.ReturnVO;
import com.spring.Imuseum.mypage.ReviewVO;
import com.spring.Imuseum.mypage.ReviewWriteVO;
import com.spring.Imuseum.mypage.orderOnlineVO;
import com.spring.Imuseum.mypage.ticketPersonalVO;
import com.spring.Imuseum.order.OrderPagePVO;
import com.spring.Imuseum.order.OrderService;
import com.spring.Imuseum.order.OrderVO;
import com.spring.Imuseum.order.PaymentCheck;
import com.spring.Imuseum.qnaBoard.QnaBoardService;
import com.spring.Imuseum.ticket.LearnTicketVO;
import com.spring.Imuseum.ticket.TicketService;


@SessionAttributes("member")

@Controller
public class MypageController {

	@Autowired
	private MypageService mypageService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private PaymentCheck paymentCheck;
	@Autowired
	private TicketService ticketService;
	@Autowired
	private LearnService learnService;
	
	private MemberService memberService;
	private QnaBoardService qnaBoard;	
	
	@Autowired
	private void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	@Autowired
	private void setQnaBoardService (QnaBoardService qnaBoard) {
		this.qnaBoard = qnaBoard;
	}
	
	@RequestMapping("FAQ.do")
	public String FAQ() {
		System.out.println(">> faq 실행");
		return "faq/FAQ";
	}
	 
	@RequestMapping("FAQ_reservation.do")
	public String FAQ_reservation() {
		System.out.println(">> FAQ reservation 실행");
		return "faq/FAQ_reservation";
	}
	 
	@RequestMapping("FAQ_shop.do")
	public String FAQ_shop() {
		System.out.println(">> FAQ shop 실행");
		return "faq/FAQ_shop";
	}
	 
	@RequestMapping("FAQ_location.do")
	public String FAQ_location() {
		System.out.println(">> FAQ location 실행");
		return "faq/FAQ_location";
	}
	 
	@RequestMapping("mypage_main.do")
	public String mypage_main(@ModelAttribute("member") MemberVO mvo,Model model) {
		System.out.println(">>mypage_main 실행~~");
		
		model.addAttribute("QnaBoardCount", qnaBoard.getQnaBoardCount(mvo.getId()));
		
		return "mypage/mypage_main";
	}
	 
	//티켓 예매 내역 카운트
	@ModelAttribute("ticketCnt")
	public int ticketCnt(ticketPersonalVO vo, @ModelAttribute("member") MemberVO mvo) {
		vo.setId(mvo.getId());
		int ticketCnt = mypageService.ticketCnt(vo);
		System.out.println("티켓 예매 내역 카운트 : " + ticketCnt);
		return ticketCnt;
	}
	 
	//전시 티켓 예매 목록 : 개인
	@RequestMapping("/mp_ticket_ex.do")
	public String mp_ticket_ex(ticketPersonalVO vo, Model model, @ModelAttribute("member") MemberVO mvo) {
		System.out.println(">>mp_ticket 실행~~");
		vo.setId(mvo.getId());
		List<ticketPersonalVO> list = mypageService.ticketPersonal(vo);
		
		model.addAttribute("ticketPersonal", list);
		 
		return "mypage/mp_ticket_ex";
	}
	
	//교육 티켓 예매 목록 : 개인
	@RequestMapping("/mp_ticket_le.do")
	public String mp_ticket_le(LearnTicketVO lvo, Model model, @ModelAttribute("member") MemberVO mvo) {
		System.out.println(">>mp_ticket 실행~~");
		lvo.setId(mvo.getId());
		List<LearnTicketVO> learnlist = mypageService.getLearnTicket(lvo);
		
		System.out.println(learnlist);
		model.addAttribute("learnlist", learnlist);
		 
		return "mypage/mp_ticket_le";
	}
	 
	//티켓 예매 취소
	@RequestMapping("/deleteTicket.do")
	public String deleteTicket(String revNum){
		System.out.println(">>티켓 예매 취소하기 싫행");
			
	   if(revNum != null) {
		   String token = paymentCheck.getImportToken();
	       int result = paymentCheck.cancelPayment(token,revNum);
	        
	       mypageService.deleteTicket(revNum);
	       mypageService.deleteLearnTicket(revNum);
	       if (result == -1) {
	    	   System.out.println("result:"+result);
	       } else {
	    	   System.out.println("result:"+result);
	       }
	   }
	   return "redirect:mp_ticket_ex.do";
	 }
	
	//티켓 예매 취소
		@RequestMapping("/deleteTicket_le.do")
		public String deleteTicketLe(String revNum){
			System.out.println(">>티켓 예매 취소하기 싫행");
				
		   if(revNum != null) {
			   String token = paymentCheck.getImportToken();
		       int result = paymentCheck.cancelPayment(token,revNum);
		        
		       mypageService.deleteTicket(revNum);
		       mypageService.deleteLearnTicket(revNum);
		       if (result == -1) {
		    	   System.out.println("result:"+result);
		       } else {
		    	   System.out.println("result:"+result);
		       }
		   }
		   return "redirect:mp_ticket_le.do";
		 }
	 
	//티켓 예매 목록 : 단체
	@RequestMapping("/mp_ticket_team.do")
	public String mp_ticket_team(GroupReservationVO vo, Model model, @ModelAttribute("member") MemberVO mvo) {
		System.out.println(">>mp_ticket 실행~~");
		vo.setId(mvo.getId());
		List<GroupReservationVO> list = learnService.groupReservationMypage(vo);
		model.addAttribute("groupList", list);
		return "mypage/mp_ticket_team";
	}
	
	//티켓 예매 목록 날짜 검색(오늘)
	@RequestMapping("/ticketPersonalToday.do")
	public String ticketPersonalToday(Model model) {
		List<ticketPersonalVO> list = mypageService.ticketPersonalToday();
		model.addAttribute("list", list);
		return "mypage/mp_ticket_ex";
	}
	
	//티켓 예매 목록 날짜 검색(1주)
	@RequestMapping("/ticketPersonalWeek.do")
	public String ticketPersonalWeek(Model model) {
		List<ticketPersonalVO> list = mypageService.ticketPersonalWeek();
		model.addAttribute("list", list);
		return "mypage/mp_ticket_ex";
	}
	//티켓 예매 목록 날짜 검색(한달)
	@RequestMapping("/ticketPersonalMonth.do")
	public String ticketPersonalMonth(Model model) {
		List<ticketPersonalVO> list = mypageService.ticketPersonalMonth();
		model.addAttribute("list", list);
		return "mypage/mp_ticket_ex";
	}
	//티켓 예매 목록 날짜 검색(검색)
	@RequestMapping("/ticketPersonalSelect.do")
	public String ticketPersonalSelect(Model model) {
		List<ticketPersonalVO> list = mypageService.ticketPersonalSelect();
		model.addAttribute("list", list);
		return "mypage/mp_ticket_ex";
	}
	 
	//주문내역(온라인)
	@RequestMapping("/mp_order_online.do")
	public String mp_order_online(orderOnlineVO vo, Model model, @ModelAttribute("member") MemberVO mvo) {
		System.out.println(">>mp_order_online 실행~~");
		vo.setId(mvo.getId());
		List<orderOnlineVO> list = mypageService.orderOnline(vo);
		model.addAttribute("orderOnline", list);
	 
		System.out.println("list : "+ list);
		return "mypage/mp_order_online";
	}
	 
	@RequestMapping("/mp_orderDetail.do")
	 public String mp_orderDetail(String orderNum, Model model) {
		 System.out.println(">>mp_orderDetail 실행~~");
		 System.out.println("오더넘버:"+orderNum);
		 OrderVO vo = orderService.getOrder(orderNum);
		 System.out.println("OrderVO:"+vo);
		 List<OrderPagePVO> productList = orderService.getOrderProduct(orderNum);
		 model.addAttribute("vo", vo);
		 model.addAttribute("productList", productList);
		 model.addAttribute("productListCnt", productList.size());
		 return "mypage/mp_orderDetail";
	 }
	 @RequestMapping("/mp_orderReturnDetail.do")
	 public String mp_orderReturnDetail(String orderNum, Model model) {
		 System.out.println(">>mp_orderReturnDetail 실행~~");
		 System.out.println("오더넘버:"+orderNum);
		 OrderVO vo = orderService.getOrder(orderNum);
		 List<OrderPagePVO> productList = orderService.getOrderProduct(orderNum);
		 model.addAttribute("vo", vo);
		 model.addAttribute("productList", productList);
		 model.addAttribute("productListCnt", productList.size());
		 return "mypage/mp_orderReturnDetail";
	 }
	 
	//주문내역(오프라인)
	@RequestMapping("/mp_order_offline.do")
	public String mp_order_offline() {
		System.out.println(">>mp_order_offline 실행~~");
	 
		return "mypage/mp_order_offline";
	}
	 
	//주문내역(단체)
	@RequestMapping("/mp_order_team.do")
	public String mp_order_team() {
		System.out.println(">>mp_order_team 실행~~");
		return "mypage/mp_order_team";
	}
	 
	//주문 취소 내역 보기
	@RequestMapping("/mp_return.do")
	public String mp_return(ReturnVO vo, Model model, @ModelAttribute("member") MemberVO mvo) {
		System.out.println(">>mp_return 실행~~");
		vo.setId(mvo.getId());
		List<ReturnVO> list = mypageService.returnList(vo);
		model.addAttribute("returnList", list);
		System.out.println("list :" + list);
		return "mypage/mp_return";
	}
	 
	//배송지 갯수
	@ModelAttribute("addrCnt")
	public int getAddrCnt(AddrVO vo, @ModelAttribute("member") MemberVO mvo) {
		vo.setId(mvo.getId());
		int addrCnt = mypageService.getAddrCnt(vo);
		System.out.println("배송지 갯수 : " + addrCnt);
		return addrCnt;
	}
	
	//(메인)주문/배송중인 배송지 갯수
	@ModelAttribute("orderCnt")
	public int orderCnt(orderOnlineVO vo, @ModelAttribute("member") MemberVO mvo) {
		vo.setId(mvo.getId());
		int orderCnt = mypageService.getOrderCnt(vo);
		System.out.println("주문/배송 갯수 : " + orderCnt);
		return orderCnt;
	}
	 
	//배송지 목록보기
	@RequestMapping("/mp_addrHome.do")
	public String mp_addrHome(AddrVO vo, Model model, @ModelAttribute("member") MemberVO mvo) {
		System.out.println(">>mp_getAddrList 실행~~");
	 
		vo.setId(mvo.getId());
		List<AddrVO> list = mypageService.getAddrList(vo);
		System.out.println("vo : vo");
	  
		model.addAttribute("getAddrList", list);
		System.out.println("list : " +  list);
		 
		return "mypage/mp_addrHome";
	}
		
	//배송지 추가
	@RequestMapping("/mp_insertAddr.do")
	public String mp_insertAddr(AddrVO vo) throws IllegalStateException, IOException{
		System.out.println(">>mp_insertAddr 실행");
		mypageService.insertAddr(vo);
	
		System.out.println("vo: " + vo);
	  
		return "redirect:mp_addrHome.do";
	}
		  
	//배송지 수정
	@RequestMapping("/mp_updateAddr.do") 
	public String mp_updateAddr(@ModelAttribute("addr") AddrVO vo) throws IllegalStateException, IOException{
	System.out.println(">>mp_updateAddr 실행"); System.out.println("vo : " + vo);
	  
		mypageService.updateAddr(vo);
		return "redirect:mp_addrHome.do";
	}
	  
	//배송지 삭제
	@RequestMapping("/mp_deleteAddr.do")
	public String mp_deleteAddr(AddrVO vo) { 
		System.out.println(">>mp_deleteAddr 실행");
		mypageService.deleteAddr(vo);
		return "redirect:mp_addrHome.do";
	}
	
	//기본 배송지로 설정
	@RequestMapping("/updateAddrDefault.do")
	public String updateAddrDefault(int addrNum) {
		System.out.println(">>기본 배송지로 설정중");
		AddrVO vo = mypageService.addrOne(addrNum);
		mypageService.updateAddrDefault(vo);
		return "redirect:mp_addrHome.do";
	}
		 
	 
	//작성한 리뷰 내역 조회
	@RequestMapping("/mp_review.do")
	public String productReview(ReviewVO vo, Model model, @ModelAttribute("member") MemberVO mvo) {
		System.out.println(">>mp_review 실행~~");
		vo.setId(mvo.getId());
		List<ReviewVO> list = mypageService.productReview(vo);
	 
		model.addAttribute("productReview", list);
		return "mypage/mp_review";
	}
	 
	//작성가능한 리뷰
	@RequestMapping("/mp_reviewWrite.do")
	public String mp_reviewWrite(ReviewWriteVO vo, Model model, @ModelAttribute("member") MemberVO mvo) {
		System.out.println(">>mp_reviewWrite 실행~~");
		vo.setId(mvo.getId());
		List<ReviewWriteVO> list = mypageService.reviewWrite(vo);
	 
		model.addAttribute("reviewWrite", list);
		return "mypage/mp_reviewWrite";
	}
	 
	//리뷰 작성하기 페이지로 이동
	@RequestMapping("/moveToInsertReview.do")
	public String insertReview() {
		System.out.println(">> insertReview창 실행");
		return "mypage/insertReview";
	}
	 
	//상품문의 목록 조회
	@RequestMapping("/mp_productFaq.do")
	public String mp_productFaq(ProductFaqVO vo, Model model, @ModelAttribute("member") MemberVO mvo) {
		System.out.println(">>mp_productFaq 실행~~");
		vo.setId(mvo.getId());
		List<ProductFaqVO> list = mypageService.productFaq(vo);
	 
		model.addAttribute("productFaq", list);
		return "mypage/mp_productFaq";
	}
	 
	/*
	 * //상품문의 삭제
	 * 
	 * @RequestMapping("/deleteFaq.do") public String deleteFaq(ProductFaqVO vo) {
	 * System.out.println(">>상품문의 삭제 실행"); mypageService.deleteFaq(vo);
	 * 
	 * return "redirect:mp_productFaq.do"; }
	 */
	
	//상품문의 삭제 테스트~~~~~~~~~~
	@RequestMapping("/deleteFaq.do")
	public String deleteFaq(int pqnaNum) {
		System.out.println(">> 상품문의 삭제 실행~");
		ProductFaqVO vo = mypageService.pqOne(pqnaNum);
		mypageService.deleteFaq(vo);
		return "redirect:mp_productFaq.do";
	}
	
	@RequestMapping("mp_grade.do")
	public String mp_grade() {
		System.out.println(">>mp_grade 실행~~");
		return "mypage/mp_grade";
	}
	@RequestMapping("productReviewInsert.do")
	 public String productReviewInsert(ReviewVO vo, @ModelAttribute("member") MemberVO mvo) {
		 System.out.println(">>productReviewInsert 실행~~");
		 vo.setId(mvo.getId());
		 System.out.println(vo);
		 mypageService.productReviewInsert(vo);
		 return "redirect:mp_review.do";
	 }
	 @RequestMapping("productReviewDelete.do")
	 public String productReviewDelete(int prNum) {
		 System.out.println(">>productReviewDelete 실행~~");
		 mypageService.productReviewDelete(prNum);
		 return "redirect:mp_review.do";
	 
	 }
	 @RequestMapping("productReviewUpdate.do")
	 public String productReviewUpdate(ReviewVO vo) {
		 System.out.println(">>productReviewUpdate 실행~~");
		 mypageService.productReviewUpdate(vo);
		 return "redirect:mp_review.do";
	 };
	 
	 //동환
	 
	 //1:1문의 게시판 이동
	 @RequestMapping("mp_faq.do")
	 public String mp_faq(@ModelAttribute("member")MemberVO vo,Model model,
			 			  @RequestParam(value="cPage", defaultValue="1")String cPage) {
		 System.out.println(">>mp_faq 실행~~");		 		 				

		 model.addAttribute("qnaBoardList", qnaBoard.getQnaBoardListById(
				 		 qnaBoard.getMapperKeyword(vo.getId(), 
						 qnaBoard.calculatePage(vo.getId(), cPage).getBegin(), 
						 qnaBoard.calculatePage(vo.getId(), cPage).getEnd())
				 		 ));
		 model.addAttribute("pvo", qnaBoard.calculatePage(vo.getId(), cPage));
		 System.out.println();
		 
		 //model.addAttribute("qnaBoardList",qnaBoard.getQnaBoardListById(vo.getId()));		 
		 return "mypage/mp_faq";
	 }
	 /* 회원 정보 관련 ADMIN 기능   */	 
	 
	 //회원 정보 수정 전 비밀번호 확인
	 @RequestMapping("/mp_checkPwd.do")
	 public String mp_checkPwd(@ModelAttribute("member") MemberVO vo) {
		 System.out.println(">>mp_checkPwd 실행~~");
		 if(vo.getSnsType() != 1) {
			 return "mypage/mp_updateInfo";
		 }
		 return "mypage/mp_checkPwd";
	 }
		 
	 //회원정보 수정페이지 이동
	 @RequestMapping("/mp_infoUpdate.do")
	 public String mp_updateInfo(@ModelAttribute("member") MemberVO vo) {
		 System.out.println(">>mp_updateInfo 실행~~");
		 System.out.println(vo);
		 
		 return "mypage/mp_updateInfo";
	 }
	 
	 //회원 정보 수정(개인)
	 @RequestMapping("/mp_memberUpdate.do")
	 public String mp_memberUpdate(@ModelAttribute("member") MemberVO vo, 
			 @RequestParam("updatePassword") String password,
			 @RequestParam("updateEmail") String email,
			 @RequestParam("updatePhone") String phone) {
		 System.out.println(">>mp_memberUpdate 실행~~");
		 System.out.println("수정전 vo:" + vo);
		 System.out.println("password:" + password);
		 System.out.println("email:" + email);
		 System.out.println("phone:" + phone);
		 
		 if(password == "") {
			 System.out.println("패스워드 값 널");
		 } else {
			 vo.setPassword(password);
		 }
		 if(email == "") {
			 System.out.println("이메일 값 널");
		 } else {
			 vo.setEmail(email);
		 }
		 if(phone =="") {
			 System.out.println("폰 값 널");
		 } else {
			vo.setPhone(phone); 
		 }
		 mypageService.updateInfo(vo);
		 System.out.println("수정 후 vo : " + vo);
		 return "redirect:mypage_main.do";
	 }
	 
	 //회원 정보 삭제 페이지 이동
	 @RequestMapping("/mp_infoDelete.do")
	 public String mp_infoDelete() {
		 System.out.println(">>mp_infoDelete 실행~~");
		 return "mypage/mp_infoDelete";
	 }
	 
	 //회원 정보 삭제
	 @RequestMapping("/dissmissAccount.do")
	 public String dissmissAccount(@ModelAttribute("member") MemberVO vo) {
		 System.out.println("삭제 전 : " + vo);
		 memberService.deleteMember(vo);
		 System.out.println("삭제 후 : " + vo);
		 return "redirect:logout.do";
	 }
	 
	  
	 
}//end
