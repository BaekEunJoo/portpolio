package com.mystudy.project.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.project.common.PagingQA;
import com.mystudy.project.common.PagingReview;
import com.mystudy.project.dao.BBSDAO;
import com.mystudy.project.dao.DAO;
import com.mystudy.project.vo.QAVO;
import com.mystudy.project.vo.ReviewVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/BBSController")
public class BBSController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String type = request.getParameter("type");
		
		if (type.equals("COMMUNITY")) {
				
				String bbs = request.getParameter("bbs");
				
				if (bbs.equals("QA")) {
				
					PagingQA pq = qaPaging(request);
					request.setAttribute("pq", pq);
					System.out.println("pq 객체 " + pq.getBegin()+ ","+ pq.getEnd());
					
					//QA 게시글 리스트업
					List<QAVO> qaList = BBSDAO.getQAList(pq.getBegin(), pq.getEnd());
					request.setAttribute("qaList", qaList);
					request.getRequestDispatcher("/BBS/qa.jsp").forward(request, response);
				
				} else {

	
					PagingReview pr = reviewPaging(request);
					request.setAttribute("pr", pr);
					System.out.println("pr 객체 " + pr.getBegin()+ ","+ pr.getEnd());

					List<ReviewVO> reviewList = BBSDAO.getReviewList(pr.getBegin(), pr.getEnd());
					request.setAttribute("reviewList", reviewList);
					request.getRequestDispatcher("/BBS/review.jsp").forward(request, response);
					
				}
			}
			
			if (type.equals("qnaView")) {
				
				String qnaNo = request.getParameter("qnaNo");
				BBSDAO.addQAHit(qnaNo);
				QAVO vo = BBSDAO.getQADetail(qnaNo);
				request.setAttribute("qa", vo);
				request.getRequestDispatcher("/BBS/qaView.jsp").forward(request, response);
				
			}
			

			if (type.equals("deleteQA")) {
				String qnaNo = request.getParameter("qnaNo");
				BBSDAO.deleteQA(qnaNo);
				request.getRequestDispatcher("/BBSController?type=COMMUNITY&bbs=QA").forward(request, response);
			}
			
			if (type.equals("qaWrite")) {				
				request.getRequestDispatcher("/BBS/qaWrite.jsp").forward(request, response);
			} 
			
			if (type.equals("insertQA")) {

				String path = this.getServletContext().getRealPath("/upload");

				System.out.println("> path : " + path);
				// 생성된 위치는 이클립스에서 프로젝트를 종료하면 소멸되는 것?
				// 위치 변경해 줄 수도 있음
				
				String title = request.getParameter("title");
				String content = request.getParameter("content");
				String userId = request.getParameter("userId");
				String userName = request.getParameter("userName");
				String productNo = request.getParameter("productNo");
				/*
				MultipartRequest mr = new MultipartRequest(
						request, // 요청객체
						path, // 실제 파일을 저장할 경로
						10 * 1024 * 1024, // 업로드 파일의 최대 크기 지정 (byte 단위)
						"UTF-8", // 인코딩 형식
						new DefaultFileRenamePolicy() // 동일 파일명 있으면 이름 자동 변경 처리
						);
				String title = mr.getParameter("title");
				String content = mr.getParameter("content");
				String userId = mr.getParameter("userId");
				String userName = mr.getParameter("userName");
				String productNo = mr.getParameter("productNo");
				*/
				
				/*
				String filename = mr.getParameter("filename");
				String productNo = mr.getFilesystemName("filename");
				아래가 실제 폴더에 저장된 이름인데 지금 qa나 review에 이미지까지 첨부할 수가 없을 듯..
				*/
				
				QAVO vo = new QAVO(title, content, userId, userName, productNo);
				
				BBSDAO.insertQA(vo);
				
				request.getRequestDispatcher("/BBSController?type=COMMUNITY&bbs=QA").forward(request, response);
			}
			
			if (type.equals("updateQAform")) {
				String qnaNo = request.getParameter("qnaNo");
				QAVO vo = BBSDAO.getQADetail(qnaNo);
				request.setAttribute("qa", vo);
				request.getRequestDispatcher("/BBS/qaUpdate.jsp").forward(request, response);
			}
			
			if (type.equals("updateQA")) {
				
				String qnaNo = request.getParameter("qnaNo");
				String title = request.getParameter("title");
				String productNo = request.getParameter("productNo");
				String content = request.getParameter("content");
				//원래는 file도 있어야 되는데 DB에 컬럼 반영할 시간이 없음
				
				QAVO vo = new QAVO(qnaNo, title, content, productNo);
				BBSDAO.updateQAVO(vo);
				
				request.setAttribute("qa", vo);
				request.getRequestDispatcher("/BBSController?type=qnaView&qnaNo="+qnaNo).forward(request, response);
				
			}
			
			
			if (type.equals("reviewView")) {
				
				String reviewNo = request.getParameter("reviewNo");
				BBSDAO.addReviewHit(reviewNo);
				ReviewVO vo = BBSDAO.getReviewDetail(reviewNo);
				request.setAttribute("review", vo);
				request.getRequestDispatcher("/BBS/reviewView.jsp").forward(request, response);

			}
			
			if (type.equals("deleteReview")) {
				String reviewNo = request.getParameter("reviewNo");
				BBSDAO.deleteReview(reviewNo);
				request.getRequestDispatcher("/BBSController?type=COMMUNITY&bbs=Review").forward(request, response);
			}
			
			if (type.equals("updateReviewform")) {
				String reviewNo = request.getParameter("reviewNo");
				ReviewVO vo = BBSDAO.getReviewDetail(reviewNo);
				request.setAttribute("review", vo);
				request.getRequestDispatcher("/BBS/reviewUpdate.jsp").forward(request, response);
			}
			
			if (type.equals("updateReview")) {
				
				String reviewNo = request.getParameter("reviewNo");
				String title = request.getParameter("title");
				String productNo = request.getParameter("productNo");
				String content = request.getParameter("content");
				//원래는 file도 있어야 되는데 DB에 컬럼 반영할 시간이 없음
				
				ReviewVO vo = new ReviewVO(reviewNo, title, content, productNo);
				BBSDAO.updateReviewVO(vo);
				
				request.getRequestDispatcher("/BBSController?type=reviewView&reviewNo="+reviewNo).forward(request, response);
				
			}
			
			if (type.equals("reviewWrite")) {				
				request.getRequestDispatcher("/BBS/reviewWrite.jsp").forward(request, response);
			} 
			
			if (type.equals("insertReview")) {

				String path = this.getServletContext().getRealPath("/upload");

				System.out.println("> path : " + path);
				// 생성된 위치는 이클립스에서 프로젝트를 종료하면 소멸되는 것?
				// 위치 변경해 줄 수도 있음
				
				String title = request.getParameter("title");
				String content = request.getParameter("content");
				String userId = request.getParameter("userId");
				String userName = request.getParameter("userName");
				String productNo = request.getParameter("productNo");
				/*
				MultipartRequest mr = new MultipartRequest(
						request, // 요청객체
						path, // 실제 파일을 저장할 경로
						10 * 1024 * 1024, // 업로드 파일의 최대 크기 지정 (byte 단위)
						"UTF-8", // 인코딩 형식
						new DefaultFileRenamePolicy() // 동일 파일명 있으면 이름 자동 변경 처리
						);
				String title = mr.getParameter("title");
				String content = mr.getParameter("content");
				String userId = mr.getParameter("userId");
				String userName = mr.getParameter("userName");
				String productNo = mr.getParameter("productNo");
				*/
				
				/*
				String filename = mr.getParameter("filename");
				String productNo = mr.getFilesystemName("filename");
				아래가 실제 폴더에 저장된 이름인데 지금 qa나 review에 이미지까지 첨부할 수가 없을 듯..
				*/
				
				ReviewVO vo = new ReviewVO(title, content, userId, userName, productNo);
				
				BBSDAO.insertReview(vo);
				
				request.getRequestDispatcher("/BBSController?type=COMMUNITY&bbs=REVIEW").forward(request, response);
			
			}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
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

}
