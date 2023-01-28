package com.spring.Imuseum.qnaBoard.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.Imuseum.qnaBoard.QnaAnswerVO;
import com.spring.Imuseum.qnaBoard.QnaBoardService;
import com.spring.Imuseum.qnaBoard.QnaBoardVO;
import com.spring.Imuseum.qnaBoard.QnaPagination;
import com.spring.Imuseum.qnaBoard.QnaPaging;
import com.spring.Imuseum.qnaBoard.dao.QnaBoardDAO;

@Service("QnaBoardService")
public class QnaBoardImpl implements QnaBoardService{

	private QnaBoardDAO qnaBoardDAO;
	
	@Autowired
	private void setQnaBoard(QnaBoardDAO qnaBoardDAO) {
		this.qnaBoardDAO = qnaBoardDAO;
	}
	
	@Override
	public void insertQnaBoard(QnaBoardVO qbvo) {
		if(qbvo.getUploadFile() == null) {
			qnaBoardDAO.insertQnaBoardWithoutFile(qbvo);
		} else {
			qnaBoardDAO.insertQnaBoard(qbvo);
		}
	}
	@Override
	public List<QnaBoardVO> getQnaBoardListById(QnaPagination qpvo) {
		return qnaBoardDAO.getQnaBoardListById(qpvo);
	}
	
	@Override
	public List<QnaBoardVO> getQnaBoardList(QnaPagination qpvo) {
		return qnaBoardDAO.getQnaBoardList(qpvo);
	}
	
	@Override
	public QnaBoardVO getQnaBoard(String qnaIdx) {
		return qnaBoardDAO.getQnaBoard(qnaIdx);
	}
	@Override
	public QnaAnswerVO getQnaAnswer(int qnaIdx) {
		return qnaBoardDAO.getQnaAnswer(qnaIdx);
	}


	@Override
	public void insertQnaReply(QnaAnswerVO qavo) {
		qnaBoardDAO.insertQnaAnswer(qavo);
		
	}

	@Override
	public void updateStatus(int qnaIdx) {
		qnaBoardDAO.updateStatus(qnaIdx);
	}


	@Override
	public void deleteQnaBoard(int qnaIdx) {
		qnaBoardDAO.deleteQnaBoard(qnaIdx);
		
	}
	
	@Override
	public QnaPaging calculatePage(String id, String cPage) {
		
		//1. 전체 게시물 수량 구하기
		QnaPaging p = new QnaPaging();
		if(id.equals("1") || id.equals("2")) {
			p.setTotalRecord(qnaBoardDAO.getTotalCountByStatus(id));
		} else {
			p.setTotalRecord(qnaBoardDAO.getTotalCountFromQnaBoard(id));
		}
		 p.setTotalPage();		
		
		 //2. 현재 페이지 구하기
		 if (cPage != null) {
			 p.setNowPage(Integer.parseInt(cPage));
		 }		
		 //3. 현재 페이지에 표시할 게시글 시작번호(begin), 끝번호(end) 구하기
		 p.setEnd(p.getNowPage() * p.getNumPerPage());
		 p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
		
		 //3-1.(선택적) 끝번호(end)가 건수보다 많으면 데이터 건수와 동일하게 처리
		 if (p.getEnd() > p.getTotalRecord()) {
			 p.setEnd(p.getTotalRecord());
		 }
		
		 //System.out.println(">> 시작번호(begin) : " + p.getBegin());
		 //System.out.println(">> 끝번호(end) : " + p.getEnd());
		
		 //------ 블록(block) 계산하기 -----------
		 //4. 블록 시작페이지, 끝페이지 구하기(현재페이지 번호 사용)
		 int nowPage = p.getNowPage();
		 int beginPage = (nowPage - 1) / p.getNumPerBlock() * p.getNumPerBlock() + 1;
		 p.setBeginPage(beginPage);
		 p.setEndPage(beginPage + p.getNumPerBlock() - 1);
		
		//끝페이지(endPage)가 전체 페이지 수(totalPage) 보다 크면
		// 끝페이지를 전체페이지 수로 변경 처리
		 if (p.getEndPage() > p.getTotalPage()) {
			 p.setEndPage(p.getTotalPage());
		 }
		
		return p;
	}


	@Override
	public QnaPagination getMapperKeyword(String id, int begin, int end) {
		QnaPagination qpvo = new QnaPagination();
		System.out.println(":::: getMapperKeyword - param:" + id);
		if(id.equals("1") || id.equals("2")) {
			qpvo.setStatus(id);
		} else {
			qpvo.setId(id);
		}
		
		 qpvo.setBegin(begin);
		 qpvo.setEnd(end);	
		return qpvo;
	}

	@Override
	public int getQnaBoardCount(String id) {
		return qnaBoardDAO.getTotalCountFromQnaBoard(id);
	}
	
}
