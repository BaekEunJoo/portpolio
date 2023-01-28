package com.spring.Imuseum.view.ticket;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.Imuseum.exhibition.ExhibitionService;
import com.spring.Imuseum.exhibition.ExhibitionVO;
import com.spring.Imuseum.learn.LearnService;
import com.spring.Imuseum.learn.LearnVO;
import com.spring.Imuseum.ticket.ExhibitionTicketVO;
import com.spring.Imuseum.ticket.ExhibitionTypeVO;
import com.spring.Imuseum.ticket.LearnTicketVO;
import com.spring.Imuseum.ticket.TicketService;

@Controller
public class TicketController {

	@Autowired
	private ExhibitionService exhibitionservice;
	
	@Autowired
	private LearnService learnService;
	
	@Autowired
	private TicketService ticketService;
	
	
	// 전시티켓 목록보기
	@RequestMapping("/ExticketList.do")
	public String ExticketList(Model model) {
		
		List<ExhibitionVO> list = exhibitionservice.getExhibitionNow();
		//System.out.println(">> 현재전시 목록 보여주기");
		//System.out.println(list);
		
		model.addAttribute("list", list);
		
		return "ticket/ticket_exhibition";
	}
	
	// 전시티켓 목록보기(오래된순)
	@RequestMapping("/ExticketListPast.do")
	public String ExticketListPast(Model model) {
		
		List<ExhibitionVO> list = exhibitionservice.getExhibitionOld();
		//System.out.println(">> 현재전시 목록 보여주기");
		//System.out.println(list);
		
		model.addAttribute("list", list);
		
		return "ticket/ticket_exhibition";
	}
	
	// 교육프로그램티켓 목록보기
	@RequestMapping("/LearnticketList.do")
	public String LearnticketList (LearnVO vo, Model model) {
		List<LearnVO> list = learnService.getLearnList3(vo);
		
		int total = learnService.countLearn();
		
		model.addAttribute("learnList", list);
		model.addAttribute("learnTotal", total);
		return "ticket/ticket_learn";
	}
	
	// 교육프로그램티켓 목록보기(카테고리)
	@RequestMapping("/LearnticketCategory.do")
	//@ResponseBody //response 응답객체의 몸체(body)에 데이터 전달
	public String categoryLearn(LearnVO vo, Model model) {
		System.out.println("========= categoryLearn() 실행");
		List<LearnVO> categoryLearn = learnService.categoryLearn(vo);
		System.out.println("categoryLearn : " + categoryLearn);
		
		int total =	categoryLearn.size();
		System.out.println("현재 카테고리별 개수 : " + categoryLearn.size());
		
		model.addAttribute("learnList", categoryLearn);
		model.addAttribute("learnTotal", total);
		
		return "ticket/ticket_learn";
	}
	
	
	// 전시티켓 선택
	@RequestMapping("/ticketExhibition.do")
	public String ticketExhibition(int exhNum, Model model) {
		ExhibitionVO evo = exhibitionservice.getExhibitionOne(exhNum);
		List<ExhibitionTypeVO> type = ticketService.getTicketType();
		//System.out.println("::티켓타입" + type);
		//System.out.println(">> 전시상세보기");
		//System.out.println(evo);
		
		model.addAttribute("evo", evo);
		model.addAttribute("typeList", type);
		
		return "ticket/ticket_ExhibitionRev";
	}
	
	// 교육프로그램티켓 선택
	@RequestMapping("/ticketLearn.do")
	public String ticketLearn(LearnVO vo, int learnIdx, Model model) {
		LearnVO learn = learnService.getLearn(vo);
		List<LearnTicketVO> memberList = ticketService.getTicketmember(learnIdx);
		model.addAttribute("learn", learn);
		model.addAttribute("memberList", memberList);
		
		return "ticket/ticket_learnRev";
	}
	
	// 전시티켓 결제
	@RequestMapping("/ehpay.do")
	public String ehpay() {
		return "ticket/ticket_ehpay";
	}
	
	// 전시티켓 결제완
	@RequestMapping("/completeExTicket.do")
	public String insertExTicket(ExhibitionTicketVO vo, Model model) {
		ticketService.insertExTicket(vo);
		
		model.addAttribute("vo", vo);
		
		return "ticket/revCompleted";
	}
	// 전시티켓 결제실패
	@RequestMapping("/completeErr.do")
	public String insertfailExTicket(ExhibitionTicketVO vo, Model model) {
		System.out.println(vo);
		
		model.addAttribute("vo", vo);
		
		return "ticket/revFailed";
	}
	
	// 교육프로그램티켓 결제
	@RequestMapping("/learnpay.do")
	public String learnpay() {
		return "ticket/ticket_learnpay";
	}
	
	// 교육프로그램티켓 결제완
	@RequestMapping("/completeticket.do")
	public String insertLearnTicket(LearnTicketVO vo, Model model) {
		System.out.println(vo);
		ticketService.insertLearnTicket(vo);
		
		model.addAttribute("learn", vo);
		
		return "ticket/revCompleted";
	}
	// 교육티켓 결제실패
	@RequestMapping("/completelearnErr.do")
	public String insertfailLearnTicket(ExhibitionTicketVO vo, Model model) {
		System.out.println(vo);
		
		model.addAttribute("vo", vo);
		
		return "ticket/revFailed";
	}
	
	
	
	// 교육프로그램티켓 결제완테스트트트
	@RequestMapping("/completetickettt.do")
	public String testtt(Model model) {
		
		return "ticket/revCompleted";
	}
	
	
	
}
