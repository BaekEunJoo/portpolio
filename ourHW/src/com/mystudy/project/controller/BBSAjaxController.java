package com.mystudy.project.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.model.VO.userVO;
import com.mystudy.project.common.PagingQA;
import com.mystudy.project.common.PagingReview;
import com.mystudy.project.dao.BBSDAO;
import com.mystudy.project.dao.DAO;
import com.mystudy.project.vo.CartListVO;
import com.mystudy.project.vo.QAVO;
import com.mystudy.project.vo.ReviewVO;


@WebServlet("/BBSAjaxController")
public class BBSAjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		String type = request.getParameter("type");
		
		
		if (type.equals("review")) {
			
			String reviewPage = request.getParameter("reviewPage");		
			
			PagingReview pr = reviewPaging(request);
			
			request.setAttribute("pr", pr);
			
			List<ReviewVO> list = BBSDAO.getReviewList(pr.getBegin(), pr.getEnd());
			
			// request.setAttribute("reviewList", list);
			// request.setAttribute("pr", pr);
			
			//JSON 형식 문자열 만들기
			//{"list" : [{}, {}, ..., {}]}
			String result = makeJson(list, pr);
			
			System.out.println("result: " + result);
			
			PrintWriter out = response.getWriter();
			out.print(result); //{"idx":1}
			
		}
		
		if (type.equals("qa")) {
			
			String qaPage = request.getParameter("qaPage");		
			
			PagingQA pq = qaPaging(request);
			
			request.setAttribute("pq", pq);
			
			List<QAVO> list = BBSDAO.getQAList(pq.getBegin(), pq.getEnd());
			
			// request.setAttribute("reviewList", list);
			// request.setAttribute("pr", pr);
			
			//JSON 형식 문자열 만들기
			//{"list" : [{}, {}, ..., {}]}
			String result = makeJson(list, pq);
			
			System.out.println(result);
			
			PrintWriter out = response.getWriter();
			out.print(result); //{"idx":1}
			
		}
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

	
	private String makeJson(List<QAVO> list, PagingQA pq) {
		
		StringBuilder result = new StringBuilder();
		
		result.append("{ \"qa\" : {");
		result.append("\"list\" : [ ");
		for (QAVO vo : list) {
			result.append("{ \"qnaNo\" : " + vo.getQnaNo() + ",");
			result.append("\"title\" : \"" + vo.getTitle() + "\", ");
			result.append("\"userName\" : \"" + vo.getUserName() + "\",");
			result.append("\"wdate\" : \"" + vo.getWdate().substring(0,10) + "\",");
			result.append("\"hit\" : " + vo.getHit());
			result.append("} ,");			
		}
		//마지막 콤마 지워주는 것
		result.deleteCharAt(result.length()-1);
		result.append("] , ");	
		result.append("\"pq\" : { ");			
		
		result.append(" \"begin\" : " + pq.getBegin() + ",");			
		result.append(" \"end\" : " + pq.getEnd() + ",");			
		result.append(" \"beginPage\" : " + pq.getBeginPage() + ",");			
		result.append(" \"endPage\" : " + pq.getEndPage() + ",");			
		result.append(" \"nowPage\" : " + pq.getNowPage() + ",");			
		result.append(" \"totalPage\" : " + pq.getTotalPage() + "");			

		result.append(" }"); // paging 괄호	
		result.append(" }"); // review 괄호	
		result.append(" }"); // 전체 괄호			

		return result.toString();
	}
	
	
	
	private String makeJson(List<ReviewVO> list, PagingReview pr) {
		//JSON 형식 문자열 만들기
		StringBuilder result = new StringBuilder();
		
		result.append("{ \"review\" : {");
		result.append("\"list\" : [ ");
		for (ReviewVO vo : list) {
			result.append("{ \"reviewNo\" : " + vo.getReviewNo() + ",");
			result.append("\"title\" : \"" + vo.getTitle() + "\", ");
			result.append("\"userName\" : \"" + vo.getUserName() + "\",");
			result.append("\"wdate\" : \"" + vo.getWdate().substring(0,10) + "\",");
			result.append("\"hit\" : " + vo.getHit());
			result.append("} ,");			
		}
		//마지막 콤마 지워주는 것
		result.deleteCharAt(result.length()-1);
		result.append("] , ");	
		result.append("\"pr\" : { ");			
		
		result.append(" \"begin\" : " + pr.getBegin() + ",");			
		result.append(" \"end\" : " + pr.getEnd() + ",");			
		result.append(" \"beginPage\" : " + pr.getBeginPage() + ",");			
		result.append(" \"endPage\" : " + pr.getEndPage() + ",");			
		result.append(" \"nowPage\" : " + pr.getNowPage() + ",");			
		result.append(" \"totalPage\" : " + pr.getTotalPage() + "");			

		result.append(" }"); // paging 괄호	
		result.append(" }"); // review 괄호	
		result.append(" }"); // 전체 괄호			

		return result.toString();

	}
	
	
	public static PagingQA qaPaging (HttpServletRequest request) {

		PagingQA pq = new PagingQA();
		
		pq.setNumPerPage(5);
		pq.setTotalRecord(BBSDAO.getTotalQACount());
		pq.setTotalPage();
		
		String cPage = request.getParameter("qaPage");
		
		if(cPage != null) {
			pq.setNowPage(Integer.valueOf(cPage));
		}
		
		pq.setEnd(pq.getNowPage() * pq.getNumPerPage());
		pq.setBegin(pq.getEnd() - pq.getNumPerPage() + 1);
		
		if (pq.getEnd() > pq.getTotalRecord()) {
			pq.setEnd(pq.getTotalRecord());
		}
		
		int nowPage = pq.getNowPage();

		int beginPage =  (nowPage - 1) / pq.getNumPerBlock() * pq.getNumPerBlock() + 1;
		
		pq.setBeginPage(beginPage);
		pq.setEndPage(beginPage + pq.getNumPerBlock() - 1);

		if (pq.getEndPage() > pq.getTotalPage()) {
			pq.setEndPage(pq.getTotalPage());
		}
		
		
		return pq;
	}

	
	private PagingReview reviewPaging(HttpServletRequest request) {
		
		PagingReview pr =  new PagingReview();
		
		pr.setNumPerPage(5);
		pr.setTotalRecord(BBSDAO.getTotalReviewCount());
		pr.setTotalPage();
		
		String cPage = request.getParameter("reviewPage");
		
		if (cPage != null) {
			pr.setNowPage(Integer.valueOf(cPage));
		}
		
		pr.setEnd(pr.getNowPage() * pr.getNumPerPage());
		pr.setBegin(pr.getEnd() - pr.getNumPerPage() + 1);
		
		
		if (pr.getEnd() > pr.getTotalRecord()) {
			pr.setEnd(pr.getTotalRecord());
		}
		
		int nowPage = pr.getNowPage();

		int beginPage =  (nowPage - 1) / pr.getNumPerBlock() * pr.getNumPerBlock() + 1;
		
		pr.setBeginPage(beginPage);
		pr.setEndPage(beginPage + pr.getNumPerBlock() - 1);

		if (pr.getEndPage() > pr.getTotalPage()) {
			pr.setEndPage(pr.getTotalPage());
		}
		
		return pr;
		
	}
	
	
}
