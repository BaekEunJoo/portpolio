package com.spring.Imuseum.view.order;

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
import com.spring.Imuseum.order.WishService;
import com.spring.Imuseum.order.WishVO;

@Controller
@SessionAttributes("member")
public class WishController { 
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

	//GET, POST 방식 요청을 모두 처리
	@RequestMapping("/getWishList.do")
	public String getWishList(WishVO vo, Model model, @ModelAttribute("member") MemberVO mvo) {
		System.out.println(">> getWishList 실행 ");
		System.out.println("vo : " + vo);
		vo.setId(mvo.getId());
		List<WishVO> list = wishService.getWishList(vo);
		model.addAttribute("wishlist", list);
		return "mypage/mp_wishlist";
		
	}
	@RequestMapping("/deleteWish.do")
	public String deleteWish(@RequestParam("wishNum")int[] wishNum) {
		System.out.println(">> deleteWish() 실행 : 위시리스트 삭제");
		for(int num : wishNum) {
			wishService.deleteMyWish(num);
		}
		
		return "redirect:getWishList.do";
	}
	
}
