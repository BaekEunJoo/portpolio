package com.spring.Imuseum.view.exhibition;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.spring.Imuseum.exhibition.ExhibitionService;
import com.spring.Imuseum.exhibition.ExhibitionVO;
import com.spring.Imuseum.learn.LearnVO;

//@Controller
@RestController //클래스 내의 요청처리 결과가 모두 @ResponseBody 처리됨
public class ExhibitionAjaxController {
	
	  @Autowired private ExhibitionService exhibitionservice;
	  
	  @RequestMapping("/getJsonExhibitionList.do")
	  @ResponseBody //response 응답객체의 몸체(body)에 데이터 전달 public List<ExhibitionVO>
	  public List<ExhibitionVO> getJsonExhibitionList(String year) {
	  //System.out.println("===== BoardAjaxController getJsonBoardList() 실행");
	  List<ExhibitionVO> exhibitionList = exhibitionservice.exhibitionPastYear(year);
	  //System.out.println("year : " + year);
	  //System.out.println("exhibitionList : " + exhibitionList);
	  
	  return exhibitionList; 
	  }
	  
	  @RequestMapping("/getJsonExhibitionCal.do")
	  @ResponseBody
	  public List<ExhibitionVO> getJsonExhibitionCal(String calDay) {
		  List<ExhibitionVO> exhibitionList = exhibitionservice.getExhibitionCal(calDay);
		  
		  return exhibitionList; 
	  }
	  
	  @RequestMapping("/getJsonLearnCal.do")
	  @ResponseBody
	  public List<LearnVO> getJsonLearnCal(String calDay) {
		  List<LearnVO> learnList = exhibitionservice.getLearnCalAjax(calDay);
		  
		  return learnList; 
	  }
	
}
