package com.spring.Imuseum.view.notice;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.Imuseum.notice.NoticeService;
import com.spring.Imuseum.notice.NoticeVO;


@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("/allNotice.do")
	public String allNotice(NoticeVO vo, Model model) {
		System.out.println(">>allNotice 실행");
		
		List<NoticeVO> list = noticeService.allNotice(vo);
		
		model.addAttribute("allNotice", list);
		return "notice/notice";
	}
	
	@RequestMapping("/deNotice.do")
	public String deNotice(NoticeVO vo, Model model) {
		System.out.println(">>deNotice 실행");
		
		List<NoticeVO> list = noticeService.deNotice(vo);
		
		model.addAttribute("deNotice", list);
		return "notice/noticeDe";
	}
	
	@RequestMapping("/muNotice.do")
	public String muNotice(NoticeVO vo, Model model) {
		System.out.println(">>muNotice 실행");
		
		List<NoticeVO> list = noticeService.muNotice(vo);
		
		model.addAttribute("muNotice", list);
		return "notice/noticeMu";
	}
	
	@RequestMapping("/daeNotice.do")
	public String daeNotice(NoticeVO vo, Model model) {
		System.out.println(">>daeNotice 실행");
		
		List<NoticeVO> list = noticeService.daeNotice(vo);
		
		model.addAttribute("daeNotice", list);
		return "notice/noticeDae";
	}
	
	@RequestMapping("/guNotice.do")
	public String guNotice(NoticeVO vo, Model model) {
		System.out.println(">>guNotice 실행");
		
		List<NoticeVO> list = noticeService.guNotice(vo);
		
		model.addAttribute("guNotice", list);
		return "notice/noticeGu";
	}
	
	@RequestMapping("/notice_detail.do")
	public String notice_detail() {
		System.out.println(">>notice_detail페이지 실행");
		
		return "notice/notice_detail";
	}
	
	  
	 
}//end
