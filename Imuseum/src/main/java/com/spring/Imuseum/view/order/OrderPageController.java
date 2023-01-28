package com.spring.Imuseum.view.order;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.Imuseum.member.MemberVO;
import com.spring.Imuseum.order.CartService;
import com.spring.Imuseum.order.CartVO;
import com.spring.Imuseum.order.OrderPagePVO;
import com.spring.Imuseum.order.OrderPageService;
import com.spring.Imuseum.order.OrderPageVO;
import com.spring.Imuseum.order.WishService;

@Controller
@SessionAttributes("member") 
public class OrderPageController { 
	@Autowired
	private OrderPageService orderPageService;
	
//추가--------------------------------------------------------------------------
	@Autowired
	private CartService cartService;
	
	@ModelAttribute("cartCnt")
	public int getCartCnt(MemberVO mvo,HttpSession session) {
		mvo = (MemberVO) session.getAttribute("member");
		System.out.println(">> getCartCnt() 실행 : 장바구니 건수");
		if(mvo == null) {
			return 0;
		} else {
			CartVO vo = new CartVO();
			System.out.println(mvo.getId());
			vo.setId(mvo.getId());
			int cartCnt = cartService.getCartCnt(vo);
			System.out.println("장바구니 건수: " + cartCnt);
			return cartCnt;
		}
	}
	@Autowired
	private WishService wishService;
	
	@ModelAttribute("wishCnt")
	public int getWishCnt(Model model,MemberVO mvo,HttpSession session) {
		mvo = (MemberVO) session.getAttribute("member");
		if(mvo == null) {
			return 0;
		} else {
			int wishCnt = wishService.getWishCnt(mvo.getId());
			System.out.println("위시리스트 건수: " + wishCnt);
			model.addAttribute("wishCnt", wishCnt);
			return wishCnt;
		}
	}
//------------------------------------------------------------------------------------	
	
	@RequestMapping("/getOrderPage.do")
	public String getOrderPage(OrderPageVO vo, Model model, @ModelAttribute("member") MemberVO mvo) {
		
		List<OrderPagePVO> list = orderPageService.getPInfo(vo.getOrders());
		System.out.println("orderList: " + list);
		System.out.println("list.size: " + list.size());
		model.addAttribute("orderList", list);
		model.addAttribute("orderProductCnt", list.size());
		return "shop/order";
	}
	

}
