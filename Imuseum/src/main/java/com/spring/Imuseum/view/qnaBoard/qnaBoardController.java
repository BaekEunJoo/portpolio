package com.spring.Imuseum.view.qnaBoard;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.spring.Imuseum.member.MemberVO;
import com.spring.Imuseum.qnaBoard.QnaBoardFileService;
import com.spring.Imuseum.qnaBoard.QnaBoardMenuService;
import com.spring.Imuseum.qnaBoard.QnaBoardMenuVO;
import com.spring.Imuseum.qnaBoard.QnaBoardService;
import com.spring.Imuseum.qnaBoard.QnaBoardVO;
import com.spring.Imuseum.qnaBoard.QnaFileVO;

@SessionAttributes("member")

@Controller
public class qnaBoardController {
	
	private QnaBoardMenuService qnaMenu;	
	private QnaBoardService qnaBoard;
	private QnaBoardFileService qnaFile;
	private HttpServletRequest request;
	
	@Autowired
	private void setQnaBoardMenuService(QnaBoardMenuService qnaMenu) {
		this.qnaMenu = qnaMenu;
	}
	@Autowired
	private void setQnaBoardService(QnaBoardService qnaBoard) {
		this.qnaBoard = qnaBoard;
	}
	@Autowired
	private void setQnaBoardFileService(QnaBoardFileService qnaFile) {
		this.qnaFile = qnaFile;
	}
	
	@Autowired
	private void setHttpServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	
	@RequestMapping("/moveToQna.do")	
	public String getCategoryList(Model model){
		List<QnaBoardMenuVO> menuList = qnaMenu.getMenu();
		System.out.println(menuList);
		model.addAttribute("menuList",menuList);	
		
		return "qna/askQna";
	}
	
	@PostMapping("/insertQnaBoard.do")
	public String insertQnaBoard(QnaBoardVO qbvo, QnaFileVO qfvo,@ModelAttribute("member") MemberVO vo) throws IllegalStateException, IOException{
		System.out.println(">>insertQnaBoard 실행");
		
		System.out.println("vo:" + vo);
		MultipartFile uploadFile = qbvo.getUploadFile();
		qbvo.setId(vo.getId());
		
		if (uploadFile == null) {
			System.out.println("::: Filename 파라미터 X");
			
		} else if (!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename(); //원본파일명	
			String uuid = UUID.randomUUID().toString();
			System.out.println("::: 원본파일명 : " + fileName);
			System.out.println("::: 저장파일명 : " + uuid);
			String uploadFileName = uuid + "_" +  fileName;
			uploadFile.transferTo(new File("C:/MyStudy/70_Spring/Imuseum/src/main/webapp/common/img/" + uploadFileName));

			//FileVO 데이터 설정
			qfvo.setFilename(fileName);
			qfvo.setPath(request.getServletContext().getRealPath("/img"));
			qfvo.setType(uploadFile.getContentType());
			qfvo.setUploadfile(uploadFileName);
			qnaFile.insertFileToQnaBoard(qfvo);
			
			//QnaBoard 데이터 삽입
			qbvo.setFileIdx(qnaFile.getFileIdx(qfvo.getUploadfile()));
		}
			System.out.println(":::Insert 전 qbvo : " + qbvo);
			System.out.println("vo:" + vo);
			qnaBoard.insertQnaBoard(qbvo);
		
		return "redirect:mp_faq.do";
		
	}
	
}
