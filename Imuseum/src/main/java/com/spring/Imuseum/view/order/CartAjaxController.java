package com.spring.Imuseum.view.order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.Imuseum.member.MemberVO;
import com.spring.Imuseum.order.CartArr;
import com.spring.Imuseum.order.CartService;
import com.spring.Imuseum.order.CartVO;

@SessionAttributes("member") 

@RestController
public class CartAjaxController { 
	
	@Autowired
	private CartService cartService;

	@RequestMapping("/getCartCnt.do")
	public int getCartCntAjax(CartVO vo, @ModelAttribute("member") MemberVO mvo) {
		System.out.println(">> getCartCnt() 실행 : 장바구니 건수");
		vo.setId(mvo.getId());
		int cartCnt = cartService.getCartCnt(vo);
		System.out.println("장바구니 건수: " + cartCnt);
		return cartCnt;
	}
	
	@RequestMapping("/cntCheck.do")
	public int cntCheck(CartVO vo) {
		System.out.println(">> cntCheck 실행 ");
		System.out.println(vo);
		int leftCnt = cartService.cntCheck(vo);
		return leftCnt;
	}
	
	@RequestMapping("/cartCheck.do")
	public String cartCheck(CartVO vo, @ModelAttribute("member") MemberVO mvo) {
		System.out.println(">> cartCheck 실행 ");
		vo.setId(mvo.getId());
		System.out.println(vo);
		String result= "";
		if(cartService.cartCheck(vo) != null) {
			System.out.println("조회된 값이 있음 : " + cartService.cartCheck(vo));
			result = "o";
		} else {
			result = "x";
		}
		return result;
	}
	
	@RequestMapping("/insertCart.do")
	public String insertCart(CartArr products, @ModelAttribute("member") MemberVO mvo) {
		System.out.println(">> cartCheck 실행 ");
		System.out.println(products);
		String result= "";
		for (CartVO vo : products.getProducts()) {
			vo.setId(mvo.getId());
			if(cartService.cartCheck(vo) != null) {
				System.out.println("조회된 값이 있음 : " + cartService.cartCheck(vo));
				result = "o";
			} else {
				result = "x";
			}
			
			if(result == "x") {
				System.out.println(">> insertCart() 실행 : 장바구니 추가");
				cartService.insertCart(vo);
				result = "insert";
			} else {
				result = "noInsert";
			}
		}
		return result;
	}
	
	@RequestMapping("/deleteCartSoldout.do")
	public int deleteCartSoldout(@ModelAttribute("member") MemberVO mvo) {
		System.out.println(">> deleteCartSoldout() 실행 : 장바구니 삭제");
		return cartService.deleteCartSoldout(mvo.getId());
	}
	
	@RequestMapping("/getOneCart.do")
	public CartVO getOneCart(int cartNum) {
		System.out.println(">> getOneCart() 실행 ");
		System.out.println("cartNum: " + cartNum);
		System.out.println(cartService.getOneCart(cartNum));
		return cartService.getOneCart(cartNum);
	}
}
