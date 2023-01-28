package com.spring.Imuseum.view.learn;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.spring.Imuseum.exhibition.ExhibitionVO;
import com.spring.Imuseum.learn.GroupReservationPagingVO;
import com.spring.Imuseum.learn.GroupReservationVO;
import com.spring.Imuseum.learn.LearnLikeVO;
import com.spring.Imuseum.learn.LearnPagingVO;
import com.spring.Imuseum.learn.LearnService;
import com.spring.Imuseum.learn.LearnVO;
import com.spring.Imuseum.learn.YearLearnPagingVO;
import com.spring.Imuseum.learn.getLearnList4PagingVO;
import com.spring.Imuseum.member.MemberVO;
import com.spring.Imuseum.ticket.Paging;

@Controller
@SessionAttributes("learn")
public class LearnController {
	
	@Autowired
	private LearnService learnService;
	
	// learn 추가 페이지로 이동
	@RequestMapping("/moveTolearninsert.do")
	public String moveToLearnInsert() {
		return "learn/learninsert";
	}
	// learn 추가 입력하기
	@RequestMapping("/insertLearn.do")
	public String insertLearn(LearnVO vo) throws IllegalStateException, IOException {
		MultipartFile uploadFile = vo.getUploadFile();
		MultipartFile uploadFile2 = vo.getUploadFile2();
		
		if (uploadFile == null) {
			System.out.println("::: uploadFile 파라미터가 전달되지 않았을때");
		} else if (!uploadFile.isEmpty()) {
			System.out.println("uploadFile.isEmpty() : " + uploadFile.isEmpty());
			String fileName = uploadFile.getOriginalFilename(); //원본파일명
			System.out.println("::: 원본파일명 : " + fileName);
			System.out.println("::: 저장파일명 : " + UUID.randomUUID().toString());
			uploadFile.transferTo(new File("C:/MyStudy/70_Spring/Imuseum/src/main/webapp/learnImage/" + fileName));
			
			vo.setFileName(fileName);
		}
		
		if (uploadFile2 == null) {
			System.out.println("::: uploadFile2 파라미터가 전달되지 않았을때");
		} else if (!uploadFile2.isEmpty()) {
			System.out.println("uploadFile2.isEmpty() : " + uploadFile2.isEmpty());
			String fileName2 = uploadFile2.getOriginalFilename(); //원본파일명
			System.out.println("::: 원본파일명 : " + fileName2);
			System.out.println("::: 저장파일명 : " + UUID.randomUUID().toString());
			uploadFile2.transferTo(new File("C:/MyStudy/70_Spring/Imuseum/src/main/webapp/learnImage/" + fileName2));
			vo.setFileName2(fileName2);
		}
		

		
		learnService.insertLearn(vo);

		return "redirect:getLearnList.do";
	}
	
	
//	@RequestMapping("/getLearnList.do")
//	public String getBoardList(LearnVO vo, Model model) {
//		System.out.println(">> 게시글 목록 보여주기");
//		System.out.println("vo : " + vo);
//
//		//List<BoardVO> list = boardDAO.getBoardList();
//		List<LearnVO> list = learnService.getLearnList(vo);
//		List<LearnVO> list2 = learnService.getLearnList2(vo);
//		int total = learnService.countLearn();
//		int total2 = learnService.countLearn2();
//		//mav.addObject("boardList", list); // Model에 데이터 저장
//		//mav.setViewName("getBoardList.jsp"); // View 명칭 저장
//		
//		model.addAttribute("learnList", list);
//		model.addAttribute("learnTotal", total);
//		model.addAttribute("learnList2", list2);
//		model.addAttribute("learnTotal2", total2);
//		
//		return "learn/getLearnList";
//	}
	
	
	//리턴타입 : ModelAndView ---> String
	@RequestMapping("/getLearn.do")
	public String getBoard(LearnVO vo,LearnLikeVO vo2, MemberVO vo3, Model model) {
		System.out.println(">> 게시글 상세 보여주기");
		LearnVO learn = learnService.getLearn(vo);
		List<LearnLikeVO> learn2 = learnService.selectLearnLike(vo2);
		int view = learnService.viewsLearn(vo);


		model.addAttribute("learn", learn);
		model.addAttribute("learn2", learn2);

		
	
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", vo3.getId()); //로그인한 사람의 아아디  계정 아이디
		map.put("learnIdx", String.valueOf(learn.getLearnIdx())); //페이지에 해당하는 게시글 번호 (강의 번호)
		
		System.out.println(map);
	
		
		int count = learnService.countHeart(map);                                                        
	
		System.out.println("카운트 : " + count);
		
		model.addAttribute("count", count);
		
		return "learn/getLearn";
	}
	
	@RequestMapping("moveToUpdateLearn.do")
	public String moveToUpdateForm() {
		return "learn/updateLearn";
	}
	
	@RequestMapping("/updateLearn.do")
	//@ModelAttribute("learn") BoardVO : board라는 이름의 Model 객체가 있으면 사용
	//	없으면 새로 생성
	public String updateLearn(@ModelAttribute("learn") LearnVO vo) throws IllegalStateException, IOException {
		System.out.println(">> 게시글 수정");
		System.out.println("vo : " + vo);
		
		MultipartFile uploadFile = vo.getUploadFile();
		MultipartFile uploadFile2 = vo.getUploadFile2();
		
		if (uploadFile == null) {
			System.out.println("::: uploadFile 파라미터가 전달되지 않았을때");
		} else if (!uploadFile.isEmpty()) {
			System.out.println("uploadFile.isEmpty() : " + uploadFile.isEmpty());
			String fileName = uploadFile.getOriginalFilename(); //원본파일명
			System.out.println("::: 원본파일명 : " + fileName);
			System.out.println("::: 저장파일명 : " + UUID.randomUUID().toString());
			uploadFile.transferTo(new File("C:/MyStudy/70_Spring/Imuseum/src/main/webapp/learnImage/" + fileName));
			
			vo.setFileName(fileName);
		}
		
		if (uploadFile2 == null) {
			System.out.println("::: uploadFile2 파라미터가 전달되지 않았을때");
		} else if (!uploadFile2.isEmpty()) {
			System.out.println("uploadFile2.isEmpty() : " + uploadFile2.isEmpty());
			String fileName2 = uploadFile2.getOriginalFilename(); //원본파일명
			System.out.println("::: 원본파일명 : " + fileName2);
			System.out.println("::: 저장파일명 : " + UUID.randomUUID().toString());
			uploadFile2.transferTo(new File("C:/MyStudy/70_Spring/Imuseum/src/main/webapp/learnImage/" + fileName2));
			vo.setFileName2(fileName2);
		}
		
		learnService.updateLearn(vo);
		
		return "redirect:getLearnList.do";
	}
	
	@RequestMapping("/deleteLearn.do")
	public String deleteLearn(LearnVO vo) {
		System.out.println(">> 게시글 삭제");
		System.out.println("vo : " + vo);
		
		learnService.deleteLearn(vo);
		
		return "redirect:getLearnList.do";
	}
	
	
	@RequestMapping("/yearLearn.do")
	//@ResponseBody //response 응답객체의 몸체(body)에 데이터 전달
	public String yearLearn(LearnVO vo, Model model) {
		System.out.println("========= yearLearn() 실행");
		List<LearnVO> yearLearn = learnService.yearLearn(vo);
		System.out.println("yearLearn : " + yearLearn);
		int total =	yearLearn.size();
		System.out.println("연도별 개수 : " + yearLearn.size());
		
		model.addAttribute("yearLearn", yearLearn);
		model.addAttribute("yearLearnTotal", total);
		
		return "learn/yearLearn";
	}
	
	@RequestMapping("/categoryLearn.do")
	//@ResponseBody //response 응답객체의 몸체(body)에 데이터 전달
	public String categoryLearn(LearnVO vo, Model model) {
		System.out.println("========= categoryLearn() 실행");
		List<LearnVO> categoryLearn = learnService.categoryLearn(vo);
		List<LearnVO> categoryLearn2 = learnService.categoryLearn2(vo);
		System.out.println("categoryLearn : " + categoryLearn);
		System.out.println("categoryLearn2 : " + categoryLearn2);
		
		int total =	categoryLearn.size();
		int total2 = categoryLearn2.size();
		System.out.println("현재 카테고리별 개수 : " + categoryLearn.size());
		System.out.println("지난 카테고리별 개수 : " + categoryLearn2.size());
		
		model.addAttribute("categoryLearn", categoryLearn);
		model.addAttribute("categoryLearn2", categoryLearn2);
		model.addAttribute("categoryLearnTotal", total);
		model.addAttribute("categoryLearnTotal2", total2);
		
		return "learn/categoryLearn";
	}
	@RequestMapping("/moveTogroupReservation.do")
	public String moveTogroupReservation() {
		return "learn/groupReservation";
	}
//	@RequestMapping("/groupReservation.do")
//	public String groupReservation(GroupReservationVO vo, Model model) {
//		System.out.println(">> 게시글 목록 보여주기");
//		System.out.println("vo : " + vo);
//
//		//List<BoardVO> list = boardDAO.getBoardList();
//		List<GroupReservationVO> list = learnService.groupReservation(vo);
//		
//		//mav.addObject("boardList", list); // Model에 데이터 저장
//		//mav.setViewName("getBoardList.jsp"); // View 명칭 저장
//
//		model.addAttribute("groupReservation", list);
//		
//		return "learn/learnRev_team";
//	}
	

	
	
	@RequestMapping("/InsertGroupReservation.do")
	public String InsertGroupReservation(GroupReservationVO vo) throws IllegalStateException, IOException {
		learnService.InsertGroupReservation(vo);
		return "redirect:getLearnList.do";
	}
	
	@RequestMapping("/moveTOlearn_admin.do")
	public String moveTOlearn_admin() {
		return "learn/learnRev_personal";
	}
	
	
	@RequestMapping("/regdateSearch.do")
	public String regdateSearch(GroupReservationVO vo, Model model) {
		System.out.println(">> 게시글 목록 보여주기");
		System.out.println("vo : " + vo);

		//List<BoardVO> list = boardDAO.getBoardList();
		List<GroupReservationVO> list = learnService.regdateSearch(vo);
		
		//mav.addObject("boardList", list); // Model에 데이터 저장
		//mav.setViewName("getBoardList.jsp"); // View 명칭 저장

		model.addAttribute("regdateSearch", list);
		
		return "learn/learnRev_teamSearch";
	}
	
	@RequestMapping("/selectViews.do")
	public String selectViews(LearnVO vo, Model model) {
		System.out.println(">> 게시글 목록 보여주기");
		System.out.println("vo : " + vo);

		List<LearnVO> selectViews = learnService.selectViews(vo);
		int views = selectViews.size();
		model.addAttribute("selectViews", selectViews);
		model.addAttribute("selectviewsTotal", views);
		
		return "learn/selectViews";
	}
	
	@RequestMapping("/selectNew.do")
	public String selectNew(LearnVO vo, Model model) {
		System.out.println(">> 게시글 목록 보여주기");
		System.out.println("vo : " + vo);

		List<LearnVO> selectNew = learnService.selectNew(vo);
		int selectVewTotal = selectNew.size();

		model.addAttribute("selectNew", selectNew);
		model.addAttribute("selectNewTotal", selectVewTotal);
		
		return "learn/selectNew";
	}
	
	@RequestMapping("/selectOld.do")
	public String selectOld(LearnVO vo, Model model) {
		System.out.println(">> 게시글 목록 보여주기");
		System.out.println("vo : " + vo);

		List<LearnVO> selectOld = learnService.selectOld(vo);
		int selectOldTotal = selectOld.size();
		model.addAttribute("selectOld", selectOld);
		model.addAttribute("selectOldTotal", selectOldTotal);
		
		return "learn/selectOld";
	}
	
	@RequestMapping("/groupReservationDelete.do")
	public String groupReservationDelete(GroupReservationVO vo) {
		System.out.println(">> 게시글 삭제");
		System.out.println("vo : " + vo);
		
		learnService.groupReservationDelete(vo);
		
		return "redirect:groupReservation.do";
	}
	
	@RequestMapping("/learnDelete2.do")
   public String learnDelete2(LearnVO vo) {
      System.out.println(">> 지난 게시글 삭제");
      System.out.println("vo : " + vo);
      
      learnService.learnDelete2(vo);
      
      return "redirect:getLearnList.do";
   }
	
	
	@RequestMapping("/updateLike.do")
	public String updateLike(LearnVO vo, LearnLikeVO vo2, Model model) {
		int updateLike = learnService.updateLike(vo);
		learnService.insertLike(vo2);
		learnService.updateLikeCheck(vo2);
		learnService.updateLearnLikeCheck(vo);


		model.addAttribute("updateLike", updateLike);
		model.addAttribute("updateLikeCheck", learnService.updateLikeCheck(vo2));
		
		return "redirect:getLearnList.do";
	}

	@RequestMapping("/updateLikeCancel.do")
	public String updateLikeCancel(LearnVO vo, LearnLikeVO vo2, Model model) {
		int updateLikeCancel = learnService.updateLikeCancel(vo);
		learnService.deleteLike(vo2);
		model.addAttribute("updateLikeCancel", updateLikeCancel);
		
		return "redirect:getLearnList.do";
	}
	

	@RequestMapping("/getLearnList.do")
	public String getLearnList(String page, LearnVO vo, Model model) {
		
		// 페이징 처리
		LearnPagingVO p = new LearnPagingVO();

		// 1. 전체 게시물 수구하기
		p.setTotalRecord(learnService.getLearnTotalCount());
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
		List<LearnVO> list2 = learnService.getLearnList2(vo);
		int total2 = learnService.countLearn2();
		
		List<LearnVO> learnList = learnService.getLearnList(p.getBegin(), p.getEnd());
		model.addAttribute("page", p);
		model.addAttribute("learnList", learnList);
		model.addAttribute("learnTotal", learnService.getLearnTotalCount());
		model.addAttribute("learnList2", list2);
		model.addAttribute("learnTotal2", total2);
		
		return "learn/getLearnList";
	}
	
	
	@RequestMapping("/groupReservation.do")
	public String groupReservation(String page, Model model) {
		
		// 페이징 처리
		GroupReservationPagingVO p = new GroupReservationPagingVO();

		// 1. 전체 게시물 수구하기
		p.setTotalRecord(learnService.getGroupReservationTotalCount());
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
		
		
		List<GroupReservationVO> learnList = learnService.groupReservation(p.getBegin(), p.getEnd());
		model.addAttribute("page", p);
		model.addAttribute("groupReservation", learnList);
		model.addAttribute("groupReservationTotalCount", learnService.getGroupReservationTotalCount());
		
		return "learn/learnRev_team";
	}
	
	
	
	
	
	
	
	
	
	@RequestMapping("/learnAdmin.do")
	public String learnAdmin(String page, Model model) {
		
		// 페이징 처리
		getLearnList4PagingVO p = new getLearnList4PagingVO();

		// 1. 전체 게시물 수구하기
		p.setTotalRecord(learnService.getLearnTotalCount4());
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
		
		
		List<LearnVO> getlearnList4 = learnService.getLearnList4(p.getBegin(), p.getEnd());
		model.addAttribute("page", p);
		model.addAttribute("getlearnList4", getlearnList4);
		model.addAttribute("getLearnTotalCount4", learnService.getLearnTotalCount4());
		
		return "learn/learn_admin";
	}
	
	@RequestMapping("/deleteLearn2.do")
	public String deleteLearn2(LearnVO vo) {
		System.out.println(">> 게시글 삭제");
		System.out.println("vo : " + vo);
		
		learnService.deleteLearn(vo);
		
		return "redirect:learnAdmin.do";
	}
	
	


}
