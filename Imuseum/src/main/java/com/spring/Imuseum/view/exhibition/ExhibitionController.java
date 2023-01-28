package com.spring.Imuseum.view.exhibition;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.spring.Imuseum.exhibition.ArtistsVO;
import com.spring.Imuseum.exhibition.ExhibitionService;
import com.spring.Imuseum.exhibition.ExhibitionVO;
import com.spring.Imuseum.learn.LearnService;
import com.spring.Imuseum.learn.LearnVO;

@Controller
public class ExhibitionController {
	
	@Autowired
	private ExhibitionService exhibitionservice;
	@Autowired
	private LearnService learnService;
	
	// 현재전시 페이지(최신순)
	@RequestMapping("/exhibitionNow.do")
	public String exhibitionNow(Model model) {
		List<ExhibitionVO> list = exhibitionservice.getExhibitionNow();
		//System.out.println(">> 현재전시 목록 보여주기");
		//System.out.println(list);
		
		model.addAttribute("list", list);
		
		return "exhibition/exhibition_now";
	}
	
	// 지난전시 페이지
	@RequestMapping("/exhibitionPast.do")
	public String exhibitionPast(Model model) {
		List<ExhibitionVO> list = exhibitionservice.getExhibitionPast();
		//System.out.println(">> 지난전시 목록 보여주기");
		//System.out.println(list);
		
		model.addAttribute("list", list);
		
		return "exhibition/exhibition_past";
	}
	
	
	// 전시 상세보기
	@RequestMapping("/exhibitionDetail.do")
	public String exhibitionDetail(int exhNum, Model model) {
		ExhibitionVO evo = exhibitionservice.getExhibitionOne(exhNum);
		List<ArtistsVO> list = exhibitionservice.getExAritsts(exhNum);
		//System.out.println(">> 전시상세보기");
		//System.out.println(evo);
		
		model.addAttribute("evo", evo);
		model.addAttribute("list", list);
		
		return "exhibition/exhibition_detail";
	}
	
	
	// 전시등록페이지
	@RequestMapping("/exhibitionInsert.do")
	public String exhibitionInsert(Model model) {
		
		return "exhibition/Exhibitioninsert";
	}
	
	// 전시등록페이지-완료
	@RequestMapping("/exhibitionInsertGo.do")
	public String insertExhibition(ExhibitionVO vo, 
									@RequestParam(name = "up") MultipartFile file,
									@RequestParam(name = "poster") MultipartFile file2,
									@RequestParam(name = "ticket") MultipartFile file3,
									@RequestParam(name = "info") MultipartFile file4) 
									throws IllegalStateException, IOException {
		
		//System.out.println("file.getOriginalFilename() : " + file.getOriginalFilename());
		
		
		  if (!file.isEmpty()) {
			  String orifilename = file.getOriginalFilename();
			  String extension = orifilename.substring(orifilename.lastIndexOf("."), orifilename.length());
			  
			  String fileName = UUID.randomUUID().toString() + extension;
			  file.transferTo(new File("C:/MyStudy/70_Spring/Imuseum/src/main/webapp/exhibitionImg/" + fileName)); 
			  vo.setUpImg(fileName); 
		  } 
		  
		  if (!file2.isEmpty()) { 
			  String orifilename = file2.getOriginalFilename();
			  String extension = orifilename.substring(orifilename.lastIndexOf("."), orifilename.length());
			  String fileName = UUID.randomUUID().toString() + extension;
			  file2.transferTo(new File("C:/MyStudy/70_Spring/Imuseum/src/main/webapp/exhibitionImg/" + fileName));
			  vo.setPosterImg(fileName); 
		  } 
		  
		  if (!file3.isEmpty()) { 
			  String orifilename = file3.getOriginalFilename();
			  String extension = orifilename.substring(orifilename.lastIndexOf("."), orifilename.length());
			  String fileName = UUID.randomUUID().toString() + extension;
			  file3.transferTo(new File("C:/MyStudy/70_Spring/Imuseum/src/main/webapp/exhibitionImg/" + fileName));
			  vo.setTicketImg(fileName); 
		  } 
		  
		  if (!file4.isEmpty()) { 
			  String orifilename = file4.getOriginalFilename();
			  String extension = orifilename.substring(orifilename.lastIndexOf("."), orifilename.length());
			  String fileName = UUID.randomUUID().toString() + extension;
			  file4.transferTo(new File("C:/MyStudy/70_Spring/Imuseum/src/main/webapp/exhibitionImg/" + fileName));
			  vo.setInfoImg(fileName); 
		  }

		System.out.println(vo);
		
		
		exhibitionservice.insertExhibition(vo);
		
		return "redirect:exAdmin.do";
	}
	
	// 전시수정페이지
	@RequestMapping("/exhibitionUpdate.do")
	public String exhibitionUpdate(int exhNum, Model model) {
		ExhibitionVO evo = exhibitionservice.getExhibitionOne(exhNum);
		
		model.addAttribute("evo", evo);
		
		return "exhibition/ExhibitionUpdate";
	}
	
	// 전시수정페이지-완료
	@RequestMapping("/exhibitionUpdateGo.do")
	public String updateExhibition(ExhibitionVO vo, 
			@RequestParam(name = "up") MultipartFile file,
			@RequestParam(name = "poster") MultipartFile file2,
			@RequestParam(name = "ticket") MultipartFile file3,
			@RequestParam(name = "info") MultipartFile file4) 
					throws IllegalStateException, IOException {
		//System.out.println("file.getOriginalFilename() : " + file.getOriginalFilename());
		
		if (!file.isEmpty()) {
			String orifilename = file.getOriginalFilename();
			String extension = orifilename.substring(orifilename.lastIndexOf("."), orifilename.length());
			
			String fileName = UUID.randomUUID().toString() + extension;
			file.transferTo(new File("C:/MyStudy/70_Spring/Imuseum/src/main/webapp/exhibitionImg/" + fileName)); 
			vo.setUpImg(fileName); 
		} 
		
		if (!file2.isEmpty()) { 
			String orifilename = file2.getOriginalFilename();
			System.out.println(orifilename);
			String extension = orifilename.substring(orifilename.lastIndexOf("."), orifilename.length());
			String fileName = UUID.randomUUID().toString() + extension;
			file2.transferTo(new File("C:/MyStudy/70_Spring/Imuseum/src/main/webapp/exhibitionImg/" + fileName));
			vo.setPosterImg(fileName); 
		} 
		
		if (!file3.isEmpty()) { 
			String orifilename = file3.getOriginalFilename();
			String extension = orifilename.substring(orifilename.lastIndexOf("."), orifilename.length());
			String fileName = UUID.randomUUID().toString() + extension;
			file3.transferTo(new File("C:/MyStudy/70_Spring/Imuseum/src/main/webapp/exhibitionImg/" + fileName));
			vo.setTicketImg(fileName); 
		} 
		
		if (!file4.isEmpty()) { 
			String orifilename = file4.getOriginalFilename();
			String extension = orifilename.substring(orifilename.lastIndexOf("."), orifilename.length());
			String fileName = UUID.randomUUID().toString() + extension;
			file4.transferTo(new File("C:/MyStudy/70_Spring/Imuseum/src/main/webapp/exhibitionImg/" + fileName));
			vo.setInfoImg(fileName); 
		}
		
		System.out.println(vo);
		
		
		exhibitionservice.updateExhibition(vo);
		
		return "redirect:exAdmin.do";
	}
	
	
	//========================================== 작 가 ========================================================
	// 작가등록페이지
	@RequestMapping("/artistInsert.do")
	public String artistInsert(int exhNum, Model model) {
		ExhibitionVO vo = exhibitionservice.getExhibitionOne(exhNum);
		model.addAttribute("vo", vo);
		
		return "exhibition/Artistinsert";
	}
	
	// 작가등록페이지-완료
	@RequestMapping("/artistInsertGo.do")
	public String insertArtist(ArtistsVO vo, 
									@RequestParam(name = "up") MultipartFile file) 
									throws IllegalStateException, IOException {
		
		  if (!file.isEmpty()) {
			  String orifilename = file.getOriginalFilename();
			  String extension = orifilename.substring(orifilename.lastIndexOf("."), orifilename.length());
			  
			  String fileName = UUID.randomUUID().toString() + extension;
			  file.transferTo(new File("C:/MyStudy/70_Spring/Imuseum/src/main/webapp/artistImg/" + fileName)); 
			  vo.setArtistImage(fileName);
		  } 

		System.out.println(vo);
		
		exhibitionservice.insertArtist(vo);
		System.out.println(vo.getExhNum());
		
		return "redirect:exArtist.do?exhNum="+vo.getExhNum()+"";
	}
	
	
	// 작가수정페이지
	@RequestMapping("/artistUpdate.do")
	public String artistUpdate(int artistNum, Model model) {
		ArtistsVO avo = exhibitionservice.getArtistOne(artistNum);
				
		model.addAttribute("avo", avo);
		
		return "exhibition/ArtistUpdate";
	}
	
	
	// 작가수정페이지-완료
	@RequestMapping("/artistUpdateGo.do")
	public String updateArtist(ArtistsVO vo, 
			@RequestParam(name = "up") MultipartFile file) 
					throws IllegalStateException, IOException {
		//System.out.println("file.getOriginalFilename() : " + file.getOriginalFilename());
		
		if (!file.isEmpty()) {
			String orifilename = file.getOriginalFilename();
			String extension = orifilename.substring(orifilename.lastIndexOf("."), orifilename.length());
			
			String fileName = UUID.randomUUID().toString() + extension;
			file.transferTo(new File("C:/MyStudy/70_Spring/Imuseum/src/main/webapp/artistImg/" + fileName)); 
			vo.setArtistImage(fileName);
		} 
		
		System.out.println(vo);
		
		
		exhibitionservice.updateArtist(vo);
		
		return "redirect:exArtist.do?exhNum="+vo.getExhNum()+"";
	}
	
	
	// 작가삭제
	@RequestMapping("/artistDelete.do")
	public String artistDelete(int artistNum, Model model) {
		ArtistsVO avo = exhibitionservice.getArtistOne(artistNum);
		System.out.println("삭제 : "+avo);		
		exhibitionservice.deleteArtist(avo);
		model.addAttribute("avo", avo);
		
		
		return "redirect:exArtist.do?exhNum="+avo.getExhNum()+"";
	}
	
	
	
	//========================================== 검색 ========================================================
	//검색 페이지
	@RequestMapping("/search.do")
	public String search(String searchKeyword, Model model) {
		List<ExhibitionVO> exhibitionList = exhibitionservice.exhibitionSearch(searchKeyword);
		List<LearnVO> learnList = exhibitionservice.learnSearch(searchKeyword);
		//System.out.println("전시검색리스트 : "+ exhibitionList);	
		//System.out.println("교육검색리스트 : "+ learnList);	
		model.addAttribute("exhibitionList", exhibitionList);
		model.addAttribute("learnList", learnList);
		
		
		
		return "exhibition/Search";
	}
	
	//전시검색 페이지
	@RequestMapping("/searchExhibition.do")
	public String searchExhibition(String searchKeyword, Model model) {
		List<ExhibitionVO> exhibitionList = exhibitionservice.exhibitionSearch(searchKeyword);
		List<LearnVO> learnList = exhibitionservice.learnSearch(searchKeyword);
		//System.out.println("전시검색리스트 : "+ exhibitionList);	
		//System.out.println("교육검색리스트 : "+ learnList);	
		model.addAttribute("exhibitionList", exhibitionList);
		model.addAttribute("learnList", learnList);
		
		
		
		return "exhibition/SearchExhibition";
	}
	
	//교육검색 페이지
	@RequestMapping("/searchLearn.do")
	public String searchLearn(String searchKeyword, Model model) {
		List<ExhibitionVO> exhibitionList = exhibitionservice.exhibitionSearch(searchKeyword);
		List<LearnVO> learnList = exhibitionservice.learnSearch(searchKeyword);
		//System.out.println("전시검색리스트 : "+ exhibitionList);	
		//System.out.println("교육검색리스트 : "+ learnList);	
		model.addAttribute("exhibitionList", exhibitionList);
		model.addAttribute("learnList", learnList);
		
		
		
		return "exhibition/SearchLearn";
	}
	
	
	//========================================== 전체달력 ========================================================
	@RequestMapping("/calender.do")
	public String calender(String calDay, Model model) {
		List<ExhibitionVO> exList = exhibitionservice.getExhibitionCal(calDay);
		List<LearnVO> lnnowList = exhibitionservice.getLearnCal(calDay);
		
		model.addAttribute("exList", exList);
		model.addAttribute("lnnowList", lnnowList);
		
		return "exhibition/Calender";
	}
	
	
}
