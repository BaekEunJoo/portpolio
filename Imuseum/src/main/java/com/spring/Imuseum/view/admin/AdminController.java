package com.spring.Imuseum.view.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.Imuseum.exhibition.ArtistsVO;
import com.spring.Imuseum.exhibition.ExhibitionService;
import com.spring.Imuseum.exhibition.ExhibitionVO;
import com.spring.Imuseum.learn.LearnService;
import com.spring.Imuseum.member.MemberService;
import com.spring.Imuseum.member.MemberVO;
import com.spring.Imuseum.order.OrderService;
import com.spring.Imuseum.order.OrderVO;
import com.spring.Imuseum.order.ProductShipVO;
import com.spring.Imuseum.product.OptionVO;
import com.spring.Imuseum.product.ProductQnaVO;
import com.spring.Imuseum.product.ProductService;
import com.spring.Imuseum.product.ProductVO;
import com.spring.Imuseum.product.ReviewVO;
import com.spring.Imuseum.qnaBoard.QnaAnswerVO;
import com.spring.Imuseum.qnaBoard.QnaBoardService;
import com.spring.Imuseum.ticket.ExhibitionTicketVO;
import com.spring.Imuseum.ticket.LearnTicketVO;
import com.spring.Imuseum.ticket.Paging;
import com.spring.Imuseum.ticket.TicketService;

@Controller
public class AdminController {

	@Autowired
	private OrderService orderService;
	
	@Autowired
	private TicketService ticketService;
	
	@Autowired
	private ExhibitionService exhibitionservice;
	
	@Autowired
	private ProductService productService;
	
	private MemberService memberService;
	private QnaBoardService qnaBoardService;
	private LearnService learnService;
	
	@Autowired
	private void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	@Autowired
	private void setQnaBoardService(QnaBoardService qnaBoardService) {
		this.qnaBoardService = qnaBoardService;
	}
	
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		//System.out.println("=======> Map searchConditionMap() 실행");
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("예약자명", "NAME");
		conditionMap.put("예매번호", "REVNUM");
		conditionMap.put("티켓명", "TITLE");
		
		return conditionMap;
	}
	//전시관리
	@RequestMapping("/exAdmin.do")
	public String exAdmin(String page, Model model) {
		
		// 페이징 처리
		Paging p = new Paging();

		// 1. 전체 게시물 수구하기
		p.setTotalRecord(exhibitionservice.ExhibitiontotalCount());
		p.setTotalPage();
		
		// 2. 현재 페이지 구하기
		if (page != null) {
			p.setNowPage(Integer.parseInt(page));
		}
		
		// 3. 현재 페이지에 표시할 게시글 시작번호(begin), 끝번호(end) 구하기
		p.setEnd(p.getNowPage() * p.getNumPerPage());
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
		
		// 3-1.(선택적) 끝번호(end)가 건수보다 많으면 데이터 건수와 동일하게 처리
		if (p.getEnd() > p.getTotalRecord()) {
			p.setEnd(p.getTotalRecord());
		}
		
		// 4. 블록 시작페이지, 끝페이지 구하기(현재페이지 번호 사용)
		int nowPage = p.getNowPage();
		int beginPage = (nowPage - 1) / p.getNumPerBlock() * p.getNumPerBlock() + 1;
		p.setBeginPage(beginPage);
		p.setEndPage(beginPage + p.getNumPerBlock() - 1);
		
		// 끝페이지(endPage)가 전체 페이지 수(totalPage) 보다 크면
		// 끝페이지를 전체페이지 수로 변경 처리
		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}
		
		List<ExhibitionVO> list = exhibitionservice.getExhibition(p.getBegin(), p.getEnd());
		model.addAttribute("page", p);
		model.addAttribute("list", list);
		
		return "admin/ex_admin";
	}
		//작가관리
		@RequestMapping("/exArtist.do")
		public String exArtist(int exhNum, Model model) {
			ExhibitionVO vo = exhibitionservice.getExhibitionOne(exhNum);
			List<ArtistsVO> list = exhibitionservice.getExAritsts(exhNum);
			model.addAttribute("list", list);
			model.addAttribute("vo", vo);
			
			return "admin/ex_artist";
		}
		
		//전시-예매목록-개인
		@RequestMapping("/exRevPersonal.do")
		public String exRevPersonal(ExhibitionTicketVO vo, String page, Model model) {
			// 페이징 처리
			Paging p = new Paging();

			// 1. 전체 게시물 수구하기
			p.setTotalRecord(ticketService.ExhibitionTicketCount());
			p.setTotalPage();
			
			// 2. 현재 페이지 구하기
			if (page != null) {
				p.setNowPage(Integer.parseInt(page));
			}
			
			// 3. 현재 페이지에 표시할 게시글 시작번호(begin), 끝번호(end) 구하기
			p.setEnd(p.getNowPage() * p.getNumPerPage());
			p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
			
			// 3-1.(선택적) 끝번호(end)가 건수보다 많으면 데이터 건수와 동일하게 처리
			if (p.getEnd() > p.getTotalRecord()) {
				p.setEnd(p.getTotalRecord());
			}
			
			// 4. 블록 시작페이지, 끝페이지 구하기(현재페이지 번호 사용)
			int nowPage = p.getNowPage();
			int beginPage = (nowPage - 1) / p.getNumPerBlock() * p.getNumPerBlock() + 1;
			p.setBeginPage(beginPage);
			p.setEndPage(beginPage + p.getNumPerBlock() - 1);
			
			// 끝페이지(endPage)가 전체 페이지 수(totalPage) 보다 크면
			// 끝페이지를 전체페이지 수로 변경 처리
			if (p.getEndPage() > p.getTotalPage()) {
				p.setEndPage(p.getTotalPage());
			}
			
			vo.setBegin(p.getBegin());
			vo.setEnd(p.getEnd());
			
			List<ExhibitionTicketVO> list = ticketService.getExhibitionTicket(vo);
			int totp = ticketService.ExhibitionTicketTotal();
			int cancle = ticketService.ExhibitionTicketCancel();
			
			//System.out.println(list);
			model.addAttribute("page", p);
			model.addAttribute("list", list);
			model.addAttribute("totp", totp);
			model.addAttribute("cancle", cancle);
			
			return "admin/exRev_personal";
		}
		
		
		//전시-예매목록-개인-검색
		@RequestMapping("/exRevPersonalSearch.do")
		public String exRevPersonal(ExhibitionTicketVO vo, Model model) {

			List<ExhibitionTicketVO> list = ticketService.getExhibitionTicketSearch(vo);
			int cancle = ticketService.ExhibitionTicketCancel(vo);
			
			model.addAttribute("list", list);
			model.addAttribute("cancle", cancle);
			return "admin/exRev_personal_search";
		}
		
		
		
		//전시-예매목록-개인(오늘)
		@RequestMapping("/exRevPersonalToday.do") public String
		exRevPersonalToday(ExhibitionTicketVO vo, String page, Model model) { 
			// 페이징 처리
			Paging p = new Paging();

			// 1. 전체 게시물 수구하기
			p.setTotalRecord(ticketService.ExhibitionTicketCountToday());
			p.setTotalPage();
			
			// 2. 현재 페이지 구하기
			if (page != null) {
				p.setNowPage(Integer.parseInt(page));
			}
			
			// 3. 현재 페이지에 표시할 게시글 시작번호(begin), 끝번호(end) 구하기
			p.setEnd(p.getNowPage() * p.getNumPerPage());
			p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
			
			// 3-1.(선택적) 끝번호(end)가 건수보다 많으면 데이터 건수와 동일하게 처리
			if (p.getEnd() > p.getTotalRecord()) {
				p.setEnd(p.getTotalRecord());
			}
			
			// 4. 블록 시작페이지, 끝페이지 구하기(현재페이지 번호 사용)
			int nowPage = p.getNowPage();
			int beginPage = (nowPage - 1) / p.getNumPerBlock() * p.getNumPerBlock() + 1;
			p.setBeginPage(beginPage);
			p.setEndPage(beginPage + p.getNumPerBlock() - 1);
			
			// 끝페이지(endPage)가 전체 페이지 수(totalPage) 보다 크면
			// 끝페이지를 전체페이지 수로 변경 처리
			if (p.getEndPage() > p.getTotalPage()) {
				p.setEndPage(p.getTotalPage());
			}
			
			vo.setBegin(p.getBegin());
			vo.setEnd(p.getEnd());
			
			List<ExhibitionTicketVO> list = ticketService.getExhibitionTicketToday(vo);
			int totp = ticketService.ExhibitionTicketTotalToday();
			int cancle = ticketService.ExhibitionTicketCancelToday();
			
			//System.out.println(list);
			model.addAttribute("page", p);
			model.addAttribute("list", list);
			model.addAttribute("totp", totp);
			model.addAttribute("cancle", cancle);
	  
			return "admin/exRev_personal"; 
		} 
		
		//전시-예매목록-개인(일주일)
		  
		@RequestMapping("/exRevPersonalWeek.do") public String
		exRevPersonalWeek(ExhibitionTicketVO vo, String page, Model model) { 
			// 페이징 처리
			Paging p = new Paging();

			// 1. 전체 게시물 수구하기
			p.setTotalRecord(ticketService.ExhibitionTicketCountWeek());
			p.setTotalPage();
			
			// 2. 현재 페이지 구하기
			if (page != null) {
				p.setNowPage(Integer.parseInt(page));
			}
			
			// 3. 현재 페이지에 표시할 게시글 시작번호(begin), 끝번호(end) 구하기
			p.setEnd(p.getNowPage() * p.getNumPerPage());
			p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
			
			// 3-1.(선택적) 끝번호(end)가 건수보다 많으면 데이터 건수와 동일하게 처리
			if (p.getEnd() > p.getTotalRecord()) {
				p.setEnd(p.getTotalRecord());
			}
			
			// 4. 블록 시작페이지, 끝페이지 구하기(현재페이지 번호 사용)
			int nowPage = p.getNowPage();
			int beginPage = (nowPage - 1) / p.getNumPerBlock() * p.getNumPerBlock() + 1;
			p.setBeginPage(beginPage);
			p.setEndPage(beginPage + p.getNumPerBlock() - 1);
			
			// 끝페이지(endPage)가 전체 페이지 수(totalPage) 보다 크면
			// 끝페이지를 전체페이지 수로 변경 처리
			if (p.getEndPage() > p.getTotalPage()) {
				p.setEndPage(p.getTotalPage());
			}
			
			vo.setBegin(p.getBegin());
			vo.setEnd(p.getEnd());
			
			List<ExhibitionTicketVO> list = ticketService.getExhibitionTicketWeek(vo);
			int totp = ticketService.ExhibitionTicketTotalWeek();
			int cancle = ticketService.ExhibitionTicketCancelWeek();
			
			//System.out.println(list);
			model.addAttribute("page", p);
			model.addAttribute("list", list);
			model.addAttribute("totp", totp);
			model.addAttribute("cancle", cancle);
			  
			
			return "admin/exRev_personal"; 
		} 
		//전시-예매목록-개인(한달)
		  
		@RequestMapping("/exRevPersonalMonth.do") public String
		exRevPersonalMonth(ExhibitionTicketVO vo, String page, Model model) { 
			// 페이징 처리
			Paging p = new Paging();

			// 1. 전체 게시물 수구하기
			p.setTotalRecord(ticketService.ExhibitionTicketCountMonth());
			p.setTotalPage();
			
			// 2. 현재 페이지 구하기
			if (page != null) {
				p.setNowPage(Integer.parseInt(page));
			}
			
			// 3. 현재 페이지에 표시할 게시글 시작번호(begin), 끝번호(end) 구하기
			p.setEnd(p.getNowPage() * p.getNumPerPage());
			p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
			
			// 3-1.(선택적) 끝번호(end)가 건수보다 많으면 데이터 건수와 동일하게 처리
			if (p.getEnd() > p.getTotalRecord()) {
				p.setEnd(p.getTotalRecord());
			}
			
			// 4. 블록 시작페이지, 끝페이지 구하기(현재페이지 번호 사용)
			int nowPage = p.getNowPage();
			int beginPage = (nowPage - 1) / p.getNumPerBlock() * p.getNumPerBlock() + 1;
			p.setBeginPage(beginPage);
			p.setEndPage(beginPage + p.getNumPerBlock() - 1);
			
			// 끝페이지(endPage)가 전체 페이지 수(totalPage) 보다 크면
			// 끝페이지를 전체페이지 수로 변경 처리
			if (p.getEndPage() > p.getTotalPage()) {
				p.setEndPage(p.getTotalPage());
			}
			
			vo.setBegin(p.getBegin());
			vo.setEnd(p.getEnd());
			
			List<ExhibitionTicketVO> list = ticketService.getExhibitionTicketMonth(vo);
			int totp = ticketService.ExhibitionTicketTotalMonth();
			int cancle = ticketService.ExhibitionTicketCancelMonth();
			
			//System.out.println(list);
			model.addAttribute("page", p);
			model.addAttribute("list", list);
			model.addAttribute("totp", totp);
			model.addAttribute("cancle", cancle);
			
			return "admin/exRev_personal"; 
		}
		
		//전시-예매목록-개인(상세검색)
		@RequestMapping("/exRevPersonalSelect.do")
		public String exRevPersonalSelect(ExhibitionTicketVO vo, Model model) {
			List<ExhibitionTicketVO> list = ticketService.getExhibitionTicketSelect(vo);
			int cancle = ticketService.getExhibitionTicketCancle(vo);
			//System.out.println(list);
			model.addAttribute("list", list);
			model.addAttribute("cancle", cancle);

			return "admin/exRev_personal_search";
		}
		
		
		// 전시티켓수정(상태변경)
		@RequestMapping("/updateExTicket.do")
		public String updateExTicket(String revNum) {
			ExhibitionTicketVO evo = ticketService.getExTicketOne(revNum);
			ticketService.updateExTicket(evo);
			
			return "redirect:exRevPersonal.do";
		}
		
		//전시-예매목록-팀
		@RequestMapping("/exRevTeam.do")
		public String exRevTeam() {
			return "admin/exRev_team";
		}
		
		//교육프로그램-예매목록-개인
		@RequestMapping("/learnRevPersonal.do")
		public String learnRevPersonal(LearnTicketVO vo,String page, Model model) {
			// 페이징 처리
			Paging p = new Paging();

			// 1. 전체 게시물 수구하기
			p.setTotalRecord(ticketService.learnTicketCount());
			p.setTotalPage();
			
			// 2. 현재 페이지 구하기
			if (page != null) {
				p.setNowPage(Integer.parseInt(page));
			}
			
			// 3. 현재 페이지에 표시할 게시글 시작번호(begin), 끝번호(end) 구하기
			p.setEnd(p.getNowPage() * p.getNumPerPage());
			p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
			
			// 3-1.(선택적) 끝번호(end)가 건수보다 많으면 데이터 건수와 동일하게 처리
			if (p.getEnd() > p.getTotalRecord()) {
				p.setEnd(p.getTotalRecord());
			}
			
			// 4. 블록 시작페이지, 끝페이지 구하기(현재페이지 번호 사용)
			int nowPage = p.getNowPage();
			int beginPage = (nowPage - 1) / p.getNumPerBlock() * p.getNumPerBlock() + 1;
			p.setBeginPage(beginPage);
			p.setEndPage(beginPage + p.getNumPerBlock() - 1);
			
			// 끝페이지(endPage)가 전체 페이지 수(totalPage) 보다 크면
			// 끝페이지를 전체페이지 수로 변경 처리
			if (p.getEndPage() > p.getTotalPage()) {
				p.setEndPage(p.getTotalPage());
			}
			
			vo.setBegin(p.getBegin());
			vo.setEnd(p.getEnd());
			
			List<LearnTicketVO> list = ticketService.getLearnTicket(vo);
			int totp = ticketService.learnTicketTotal();
			int cancle = ticketService.learnTicketCancel();
			
			//System.out.println(list);
			model.addAttribute("page", p);
			model.addAttribute("list", list);
			model.addAttribute("totp", totp);
			model.addAttribute("cancle", cancle);
			
			return "admin/learnRev_personal";
		}
		
		//교육-예매목록-개인-검색
		@RequestMapping("/learnRevPersonalSearch.do")
		public String learnRevPersonal(LearnTicketVO vo, Model model) {

			List<LearnTicketVO> list = ticketService.getLearnTicketSearch(vo);
			int cancle = ticketService.learnTicketCancel(vo);
			
			model.addAttribute("list", list);
			model.addAttribute("cancle", cancle);
			return "admin/learnRev_personal_search";
		}
		
		//교육-예매목록-개인(오늘)
		@RequestMapping("/learnRevPersonalToday.do")
		public String getLearnTicketToday(LearnTicketVO vo, String page, Model model) {
			// 페이징 처리
			Paging p = new Paging();

			// 1. 전체 게시물 수구하기
			p.setTotalRecord(ticketService.learnTicketCountToday());
			p.setTotalPage();
			
			// 2. 현재 페이지 구하기
			if (page != null) {
				p.setNowPage(Integer.parseInt(page));
			}
			
			// 3. 현재 페이지에 표시할 게시글 시작번호(begin), 끝번호(end) 구하기
			p.setEnd(p.getNowPage() * p.getNumPerPage());
			p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
			
			// 3-1.(선택적) 끝번호(end)가 건수보다 많으면 데이터 건수와 동일하게 처리
			if (p.getEnd() > p.getTotalRecord()) {
				p.setEnd(p.getTotalRecord());
			}
			
			// 4. 블록 시작페이지, 끝페이지 구하기(현재페이지 번호 사용)
			int nowPage = p.getNowPage();
			int beginPage = (nowPage - 1) / p.getNumPerBlock() * p.getNumPerBlock() + 1;
			p.setBeginPage(beginPage);
			p.setEndPage(beginPage + p.getNumPerBlock() - 1);
			
			// 끝페이지(endPage)가 전체 페이지 수(totalPage) 보다 크면
			// 끝페이지를 전체페이지 수로 변경 처리
			if (p.getEndPage() > p.getTotalPage()) {
				p.setEndPage(p.getTotalPage());
			}
			
			vo.setBegin(p.getBegin());
			vo.setEnd(p.getEnd());
			
			List<LearnTicketVO> list = ticketService.getLearnTicketToday(vo);
			int totp = ticketService.learnTicketTotalToday();
			int cancle = ticketService.learnTicketCancelToday();
			
			//System.out.println(list);
			model.addAttribute("page", p);
			model.addAttribute("list", list);
			model.addAttribute("totp", totp);
			model.addAttribute("cancle", cancle);
			
			return "admin/learnRev_personal";
		}
		//교육-예매목록-개인(일주일)
		@RequestMapping("/learnRevPersonalWeek.do")
		public String getLearnTicketWeek(LearnTicketVO vo, String page, Model model) {
			// 페이징 처리
			Paging p = new Paging();

			// 1. 전체 게시물 수구하기
			p.setTotalRecord(ticketService.learnTicketCountWeek());
			p.setTotalPage();
			
			// 2. 현재 페이지 구하기
			if (page != null) {
				p.setNowPage(Integer.parseInt(page));
			}
			
			// 3. 현재 페이지에 표시할 게시글 시작번호(begin), 끝번호(end) 구하기
			p.setEnd(p.getNowPage() * p.getNumPerPage());
			p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
			
			// 3-1.(선택적) 끝번호(end)가 건수보다 많으면 데이터 건수와 동일하게 처리
			if (p.getEnd() > p.getTotalRecord()) {
				p.setEnd(p.getTotalRecord());
			}
			
			// 4. 블록 시작페이지, 끝페이지 구하기(현재페이지 번호 사용)
			int nowPage = p.getNowPage();
			int beginPage = (nowPage - 1) / p.getNumPerBlock() * p.getNumPerBlock() + 1;
			p.setBeginPage(beginPage);
			p.setEndPage(beginPage + p.getNumPerBlock() - 1);
			
			// 끝페이지(endPage)가 전체 페이지 수(totalPage) 보다 크면
			// 끝페이지를 전체페이지 수로 변경 처리
			if (p.getEndPage() > p.getTotalPage()) {
				p.setEndPage(p.getTotalPage());
			}
			
			vo.setBegin(p.getBegin());
			vo.setEnd(p.getEnd());
			
			List<LearnTicketVO> list = ticketService.getLearnTicketWeek(vo);
			int totp = ticketService.learnTicketTotalWeek();
			int cancle = ticketService.learnTicketCancelWeek();
			
			//System.out.println(list);
			model.addAttribute("page", p);
			model.addAttribute("list", list);
			model.addAttribute("totp", totp);
			model.addAttribute("cancle", cancle);
			
			return "admin/learnRev_personal";
		}
		//교육-예매목록-개인(한달)
		@RequestMapping("/learnRevPersonalMonth.do")
		public String getLearnTicketMonth(LearnTicketVO vo, String page, Model model) {
			// 페이징 처리
			Paging p = new Paging();

			// 1. 전체 게시물 수구하기
			p.setTotalRecord(ticketService.learnTicketCountMonth());
			p.setTotalPage();
			
			// 2. 현재 페이지 구하기
			if (page != null) {
				p.setNowPage(Integer.parseInt(page));
			}
			
			// 3. 현재 페이지에 표시할 게시글 시작번호(begin), 끝번호(end) 구하기
			p.setEnd(p.getNowPage() * p.getNumPerPage());
			p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
			
			// 3-1.(선택적) 끝번호(end)가 건수보다 많으면 데이터 건수와 동일하게 처리
			if (p.getEnd() > p.getTotalRecord()) {
				p.setEnd(p.getTotalRecord());
			}
			
			// 4. 블록 시작페이지, 끝페이지 구하기(현재페이지 번호 사용)
			int nowPage = p.getNowPage();
			int beginPage = (nowPage - 1) / p.getNumPerBlock() * p.getNumPerBlock() + 1;
			p.setBeginPage(beginPage);
			p.setEndPage(beginPage + p.getNumPerBlock() - 1);
			
			// 끝페이지(endPage)가 전체 페이지 수(totalPage) 보다 크면
			// 끝페이지를 전체페이지 수로 변경 처리
			if (p.getEndPage() > p.getTotalPage()) {
				p.setEndPage(p.getTotalPage());
			}
			
			vo.setBegin(p.getBegin());
			vo.setEnd(p.getEnd());
			
			List<LearnTicketVO> list = ticketService.getLearnTicketMonth(vo);
			int totp = ticketService.learnTicketTotalMonth();
			int cancle = ticketService.learnTicketCancelMonth();
			
			//System.out.println(list);
			model.addAttribute("page", p);
			model.addAttribute("list", list);
			model.addAttribute("totp", totp);
			model.addAttribute("cancle", cancle);
			
			return "admin/learnRev_personal";
		}
		//교육-예매목록-개인(상세검색)
		@RequestMapping("/learnRevPersonalSelect.do")
		public String getLearnTicketSelect(LearnTicketVO vo, Model model) {
			List<LearnTicketVO> list = ticketService.getLearnTicketSelect(vo);
			int cancle = ticketService.getLearnTicketCancle(vo);
			
			model.addAttribute("list", list);
			model.addAttribute("cancle", cancle);
			
			return "admin/learnRev_personal_search";
		}
		
	// 교육티켓수정(상태변경)
	@RequestMapping("/updateLearnTicket.do")
	public String updateLearnTicket(String revNum) {
		LearnTicketVO lvo = ticketService.getLearnTicketOne(revNum);
		ticketService.updateLearnTicket(lvo);
		
		return "redirect:learnRevPersonal.do";
	}	
	
	//상품관리
	@RequestMapping("/productAdmin.do")
	public String AdminProduct(ProductVO vo, Model model) {
		System.out.println("vo : " + vo);
		System.out.println("ProductList.do 실행");
		List<ProductVO> list = productService.getProductList(vo);
		model.addAttribute("productList", list);
		return "admin/product_admin";
	}
	
	@RequestMapping("/productShip.do")
	public String productShip(ProductVO vo) {
		return "admin/product_ship";
	}
	
	@RequestMapping("/updateOption.do")
	public String updateOption(OptionVO vo) {
		productService.updateOption(vo);
		return "redirect:productAdmin.do";
	}
	
	@RequestMapping("/deleteOption.do")
	public String deleteOption(OptionVO vo) {
		productService.deleteOption(vo);
		return "redirect:productAdmin.do";
	}
	@RequestMapping("/productRev.do")
	public String getReviewList(ReviewVO vo, Model model) {
		List<ReviewVO> review = productService.getReviewList(vo);
		model.addAttribute("review", review);
		return "admin/product_rev";
	}	
	
	@RequestMapping("/deleteReview.do")
	public String deleteReview(ReviewVO vo) {
		productService.deleteReview(vo);
		return "redirect:productRev.do";
	}

	@RequestMapping("/productQna.do")
	public String getProductQnaList(ProductQnaVO vo, Model model) {
		List<ProductQnaVO> qna = productService.getProductQnaList(vo);
		model.addAttribute("qna", qna);
		return "admin/product_qna";
	}	
	
	@RequestMapping("/productOrder.do")
	public String getOrderList(OrderVO vo, Model model) {
		List<OrderVO> list = orderService.getOrderList(vo);
		model.addAttribute("list", list);
		return "admin/product_ship";
	}
	
	@RequestMapping("/updateOrder.do")
	public String updateStatus(OrderVO vo) {
		System.out.println("updateOrder.do 실행");
		orderService.updateOrder(vo);
		return "redirect:productOrder.do";
	}
	
	@RequestMapping("/insertShipgo.do")
	public String insertShipgo(OrderVO vo, Model model) {
		OrderVO order = orderService.getShip(vo);
		model.addAttribute("order", order);
		return "admin/insertShip";
	}
	
	@RequestMapping("/updateShip.do")
	public String updateShip(ProductShipVO pvo, OrderVO ovo) {
		orderService.updateShip(pvo);
		orderService.updateStatus(ovo);
		return "redirect:productOrder.do";
	}
	
	@RequestMapping("/deleteQna.do")
	public String deleteQna(ProductQnaVO vo) {
		productService.deleteQna(vo);
		return "redirect:productQna.do";
	}	
	
	@RequestMapping("/updateAnswergo.do")
	public String updateAnswergo(ProductQnaVO vo, Model model) {
		ProductQnaVO qna = productService.getQna(vo);
		model.addAttribute("qna", qna);
		return "product/insertAnswer";
	}
	
	@RequestMapping("/updateAnswer.do")
	public String updateAnswer(ProductQnaVO vo) {
		productService.updateAnswer(vo);
		return "redirect:productQna.do";
	}
	
	//동환
	
	//관리페이지
	@RequestMapping("/moveToAdmin.do")
	public String moveToAdmin(Model model,
				@RequestParam(value="cPage", defaultValue="1")String cPage) {
		List<MemberVO> list = memberService.getMemberAll(
					memberService.caculateMemberPage(cPage).getBegin(),
					memberService.caculateMemberPage(cPage).getEnd());
		
		model.addAttribute("memberList", list);
		model.addAttribute("pvo", memberService.caculateMemberPage(cPage));
		return "admin/member_admin";
		
	}
	//멤버관리
	@RequestMapping("/memberAdmin.do")
	public String memberAdmin(Model model,
			   @RequestParam(value="cPage", defaultValue="1")String cPage) {
		List<MemberVO> list = memberService.getMemberAll(
				  memberService.caculateMemberPage(cPage).getBegin(),
				  memberService.caculateMemberPage(cPage).getEnd());	
		
		model.addAttribute("memberList", list);
		model.addAttribute("pvo", memberService.caculateMemberPage(cPage));
		return "admin/member_admin";
	}
	
	/* 회원 정보 수정 기능(관리자) */
	@RequestMapping("adminUpdate.do")
	public String MemberUpdate(MemberVO vo,
							   @RequestParam("memberBox")String id,
							   @RequestParam("email") String email,
							   @RequestParam("phone") String phone,
							   @RequestParam("grade") String grade,
							   @RequestParam("status") int status) {
		vo.setId(id);
		vo = memberService.getMemberForAdmin(vo);
		
		System.out.println(vo);
		System.out.println("id:" + id);
		System.out.println("email:" + email);
		System.out.println("phone:" + phone);
		System.out.println("grade:" + grade);
		System.out.println("status:" + status);
		
		if(email == "") {
			vo.setPhone(phone);
			vo.setGrade(grade);
			vo.setStatus(status);
			memberService.updateWithoutEmail(vo);
		} else if(phone == "") {
			vo.setEmail(email);
			vo.setGrade(grade);
			vo.setStatus(status);
			memberService.updateWithoutPhone(vo);
		} else {
			vo.setEmail(email);
			vo.setPhone(phone);
			vo.setGrade(grade);
			vo.setStatus(status);
			memberService.updateMember(vo);
		}
		
		return "redirect:moveToAdmin.do";
	}
	
	@RequestMapping("/qnaAdmin.do")
	public String qnaAdmin(Model model,
						   @RequestParam(value = "statusIdx", defaultValue="1")String status,
						   @RequestParam(value="cPage", defaultValue="1")String cPage) {
		 model.addAttribute("qnaBoardList", qnaBoardService.getQnaBoardList(
				 qnaBoardService.getMapperKeyword(status, 
				 qnaBoardService.calculatePage(status, cPage).getBegin(), 
				 qnaBoardService.calculatePage(status, cPage).getEnd())
		 		 ));
		 model.addAttribute("pvo", qnaBoardService.calculatePage(status, cPage));
		
		return "admin/qna";
	}
	@RequestMapping("/qnaAdminComplete.do")
	public String qnaAdminComplete(Model model,
			   					   @RequestParam(value = "statusIdx", defaultValue="2")String status,
			   					   @RequestParam(value="cPage", defaultValue="1")String cPage) {
		 model.addAttribute("qnaBoardList", qnaBoardService.getQnaBoardList(
				 qnaBoardService.getMapperKeyword(status, 
				 qnaBoardService.calculatePage(status, cPage).getBegin(), 
				 qnaBoardService.calculatePage(status, cPage).getEnd())
		 		 ));
		 model.addAttribute("pvo", qnaBoardService.calculatePage(status, cPage));
		return "admin/qna_complete";
	}
		
	@PostMapping("/insertReplyQna.do")
	public String insertReplyQna(QnaAnswerVO qavo) {
		System.out.println(qavo);
		try {
			qnaBoardService.insertQnaReply(qavo);
			
			qnaBoardService.updateStatus(qavo.getQnaIdx());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:qnaAdminComplete.do?statusIdx=2";
	}

	@GetMapping("/deleteQnaBoard.do")
	public String deleteQnaBoard(@RequestParam("qnaIdx")String qnaIdx) {
		qnaBoardService.deleteQnaBoard(Integer.parseInt(qnaIdx));
		return "redirect:qnaAdmin.do?statusIdx=1";
	}
}
