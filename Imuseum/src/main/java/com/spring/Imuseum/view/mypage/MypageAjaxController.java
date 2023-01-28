package com.spring.Imuseum.view.mypage;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.Imuseum.member.MemberVO;
import com.spring.Imuseum.mypage.AddrVO;
import com.spring.Imuseum.mypage.MypageService;
import com.spring.Imuseum.mypage.orderOnlineVO;
import com.spring.Imuseum.order.OrderPagePVO;
import com.spring.Imuseum.order.OrderService;
import com.spring.Imuseum.order.OrderVO;
import com.spring.Imuseum.order.PaymentCheck;

@SessionAttributes("member")

@RestController
public class MypageAjaxController {
	
	@Autowired
	private MypageService mypageService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private PaymentCheck paymentCheck;
	
	@RequestMapping("/getAddressList.do")
	public List<AddrVO> getAddressList(@ModelAttribute("member") MemberVO mvo) {
		System.out.println(">> getAddressList 실행 ");
		List<AddrVO> addrList = mypageService.getAddressList(mvo.getId());
		return addrList;
	}
	@RequestMapping("/getDefaultAddr.do")
	public AddrVO getDefaultAddr(@ModelAttribute("member") MemberVO mvo) {
		System.out.println(">> getDefaultAddr 실행 ");
		AddrVO addr = mypageService.getDefaultAddr(mvo.getId());
		System.out.println(addr);
		if(addr != null) {
			return addr;
		} else {
			return new AddrVO();
		}
	}
	
	@RequestMapping("/orderCancel.do")
	public String orderCancel(@RequestParam("orderNum") String orderNum) {
		System.out.println(">> orderCancel 실행 ");
		System.out.println(orderNum);
		
		OrderVO ovo = orderService.getOrder(orderNum);
	    if(ovo != null) {
	    	String token = paymentCheck.getImportToken();
	        int result = paymentCheck.cancelPayment(token,orderNum);
	        
	        if (result == -1) { //아임포트 결제 취소 실패
	        	System.out.println("cancelPayment result:" + result);
				return "x";
			} else { //아임포트 결제 취소 성공
				int res = mypageService.deleteOrderCard(ovo);
	        	if (res == 1) { //DB 오더 상태 변경 성공
	        		System.out.println("cancelPayment result:" + result);
	        		System.out.println("mypageService.deleteOrderCard result:" + res);
	        		List<OrderPagePVO> productList = orderService.getOrderProduct(ovo.getOrderNum());
	       		 	for (OrderPagePVO pvo: productList) {
	       		 		if(mypageService.updateCancleCnt(pvo) == 1) {
	       		 			System.out.println("재고 복원 완료");
	       		 		}
	       		 	}
	        		return "o";
	        	}else { //DB 오더 상태 변경 실패
	        		System.out.println("cancelPayment result:" + result);
	        		System.out.println("mypageService.deleteOrderCard result:" + res);
	        		return "ox";
	        	}
			}
	    }
		return "getOrder failed" ;
		
	}
	
	 //주문내역 (온라인) 주문취소하기
	 @RequestMapping("/deleteOrder.do")
	 public String deleteOrder(@ModelAttribute("orderOnline") orderOnlineVO vo) throws IllegalStateException, IOException {
		 System.out.println(">>deleteOrder 실행~");
		 System.out.println(vo);
		 int res = mypageService.deleteOrder(vo);
		 List<OrderPagePVO> productList = orderService.getOrderProduct(vo.getOrderNum());
		 for (OrderPagePVO pvo: productList) {
			 if(mypageService.updateCancleCnt(pvo) == 1) {
				 System.out.println("재고 복원 완료");
			 }
		 }
		 
		 if(res == 1) { //오더가 정상적으로 취소처리 'N'->'Y' 되었을때
			 return "o";
		 } else {
			 return "x";
		 } 
	 }
	 
	
}
