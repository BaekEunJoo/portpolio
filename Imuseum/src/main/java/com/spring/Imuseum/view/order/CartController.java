package com.spring.Imuseum.view.order;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.Imuseum.member.MemberVO;
import com.spring.Imuseum.order.CartService;
import com.spring.Imuseum.order.CartVO;
import com.spring.Imuseum.order.WishService;

@Controller
@SessionAttributes("member") 
public class CartController { 
	@Autowired
	private CartService cartService;
	
	@ModelAttribute("cartCnt")
	public int getCartCnt(CartVO vo,
						  MemberVO mvo,
						  HttpSession session) {
		System.out.println(">> getCartCnt() 실행 : 장바구니 건수");
		mvo = (MemberVO) session.getAttribute("member");
		if(mvo == null) {
			return 0;
		} else {
			vo.setId(mvo.getId());
			int cartCnt = cartService.getCartCnt(vo);
			System.out.println("장바구니 건수: " + cartCnt);
			return cartCnt;
		}
	}
	//추가-----------------------------------------------------------------------------------------------
	@Autowired
	private WishService wishService;
	
	@ModelAttribute("wishCnt")
	public int getWishCnt(Model model, MemberVO mvo,HttpSession session) {
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
	//-------------------------------------------------------------------------------------------------
	
	//GET, POST 방식 요청을 모두 처리
	@RequestMapping("/getCartList.do")
	public String getCartList(CartVO vo, Model model, @ModelAttribute("member") MemberVO mvo) {
		System.out.println(">> 카트 목록 보여주기");
		System.out.println("vo : " + vo);
		if(mvo.getId() == null) {
			return "redirect:moveTologin.do";
		}
		vo.setId(mvo.getId());
		List<CartVO> list = cartService.getCartList(vo);
		model.addAttribute("cartlist", list);
		return "shop/cart";
	}

	@RequestMapping("/updateCart.do")
	public String updateCart(CartVO vo) {
		System.out.println(">> updateCart() 실행 : 장바구니 수정");
		cartService.updateCart(vo);
		return "redirect:getCartList.do";
	}
	
	@RequestMapping("/deleteCart.do")
	public String deleteCart(@RequestParam("cartNum") ArrayList<Integer> cartNum) {
		System.out.println(">> deleteCart() 실행 : 장바구니 삭제");
		for(Integer num : cartNum) cartService.deleteCart(num);
		return "redirect:getCartList.do";
	}
	
}
