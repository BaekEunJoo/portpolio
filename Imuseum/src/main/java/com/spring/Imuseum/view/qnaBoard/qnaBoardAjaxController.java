package com.spring.Imuseum.view.qnaBoard;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.spring.Imuseum.qnaBoard.QnaAnswerVO;
import com.spring.Imuseum.qnaBoard.QnaBoardCategoryService;
import com.spring.Imuseum.qnaBoard.QnaBoardCategoryVO;
import com.spring.Imuseum.qnaBoard.QnaBoardFileService;
import com.spring.Imuseum.qnaBoard.QnaBoardService;


@RestController
public class qnaBoardAjaxController {
	
	private QnaBoardCategoryService qnaCategory;
	private QnaBoardFileService qnaFileService;
	private QnaBoardService qnaBoardService;
	
	@Autowired
	private void setQnaBoardCategoryService(QnaBoardCategoryService qnaCategory) {
		this.qnaCategory = qnaCategory;
	}
	
	@Autowired
	private void setQnaBoardFileService(QnaBoardFileService qnaFileService) {
		this.qnaFileService = qnaFileService;
	}
	
	@Autowired
	private void setQnaBoardService(QnaBoardService qnaBoardService) {
		this.qnaBoardService = qnaBoardService;
	}
	
	@RequestMapping("/getCategoryList.do")	
	public List<QnaBoardCategoryVO> getCategoryList(QnaBoardCategoryVO cvo){
		System.out.println(":::: cvo :" + cvo);
		List<QnaBoardCategoryVO> categoryList = qnaCategory.getCategory(cvo);
		System.out.println(categoryList);
		return categoryList;
	}
	
	@RequestMapping(value = "/getFileVO.do",
				produces = "application/text; charset=utf8",
				method = RequestMethod.GET)
	public String getFileVO(@RequestParam("fileIdx") String fileIdx) {
		System.out.println(fileIdx);
		String result = "";
		try {
			String path = qnaFileService.getFileInfo(Integer.parseInt(fileIdx)).getUploadfile();
			System.out.println("path:" + qnaFileService.getFileInfo(Integer.parseInt(fileIdx)).getUploadfile());
			if(path != "" || path != null) {
				result = path;
			}
		} catch (NullPointerException e) {
			e.printStackTrace();
			result = "false";
		}
		System.out.println(result);
		return result;
	}
	
	@RequestMapping(value = "/getAnswerVO.do" , 
					produces = "application/text; charset=utf8",
					method = RequestMethod.POST)
	public String getAnswerVO(@RequestParam("qnaIdx") String qnaIdx,HttpServletResponse response) {
	    response.setCharacterEncoding("UTF-8");
		QnaAnswerVO qavo = qnaBoardService.getQnaAnswer(Integer.parseInt(qnaIdx));	
		
		return qavo.getContent();
	}	
	
}
