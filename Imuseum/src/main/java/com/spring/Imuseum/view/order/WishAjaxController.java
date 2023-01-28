package com.spring.Imuseum.view.order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.Imuseum.member.MemberVO;
import com.spring.Imuseum.order.WishService;
import com.spring.Imuseum.order.WishVO;

@SessionAttributes("member")

@RestController
public class WishAjaxController { 
	
	@Autowired
	private WishService wishService;
	
	
	//추가----------------------------------------------------------------------------
	@ModelAttribute("wishCnt")
	public int getWishCnt(Model model,@ModelAttribute("member") MemberVO mvo) {
		int wishCnt = wishService.getWishCnt(mvo.getId());
		System.out.println("위시리스트 건수: " + wishCnt);
		model.addAttribute("wishCnt", wishCnt);
		return wishCnt;
	}
	
	@RequestMapping("/getWishCnt.do")
	public int getWishCntAjax(Model model,@ModelAttribute("member") MemberVO mvo) {
		int wishCnt = wishService.getWishCnt(mvo.getId());
		System.out.println("위시리스트 건수: " + wishCnt);
		model.addAttribute("wishCnt", wishCnt);
		return wishCnt;
	}
	
	@RequestMapping("/wishCheck.do")
	public String wishCheck(WishVO vo, @ModelAttribute("member") MemberVO mvo) {
		System.out.println(">> wishCheck 실행 ");
		System.out.println("vo : " + vo);
		vo.setId(mvo.getId());
		String result= "";
		if(wishService.wishCheck(vo) != null) {
			System.out.println("조회된 값이 있음 : " + wishService.wishCheck(vo));
			result = "o";
		} else {
			result = "x";
		}
		return result;
	}
	@RequestMapping("/insertWish.do")
	public String insertWish(WishVO vo, @ModelAttribute("member") MemberVO mvo) {
		System.out.println(">> insertWish() 실행 : 위시리스트 추가");
		vo.setId(mvo.getId());
		System.out.println(vo);
		int res = wishService.insertWish(vo);
		String result = ""; 
		if(res == 1) {
			result = "o";
		}
		return result;
	}
	
	@RequestMapping("/deleteWishList.do") //---------------------------------------------->이름수정???
	public String deleteWish(WishVO vo, @ModelAttribute("member") MemberVO mvo) {
		System.out.println(">> deleteWish() 실행 : 위시리스트 삭제");
		vo.setId(mvo.getId());
		System.out.println(vo);
		int res = wishService.deleteWish(vo);
		String result = "";
		if(res == 1) {
			result = "o";
		}
		return result;
	}
	
}
