package com.mystudy.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.project.mybatis.DBService;
import com.mystudy.project.vo.QAVO;
import com.mystudy.project.vo.ReviewVO;

public class BBSDAO {

	public static int getTotalQACount() {
		
		SqlSession ss = DBService.getFactory().openSession(true);
		int totalCount = ss.selectOne("project.seleteTotalQACnt");
		ss.close();
		return totalCount;
		
	}
	
	public static List<QAVO> getQAList(int begin, int end){
		
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		
		SqlSession ss = DBService.getFactory().openSession(true);
		List<QAVO> list = ss.selectList("project.seleteQAList", map);
		ss.close();
		
		return list;
	}

	public static int getTotalReviewCount() {
		
		SqlSession ss = DBService.getFactory().openSession(true);
		int totalCount = ss.selectOne("project.seleteTotalReviewCnt");
		ss.close();
		return totalCount;
		
	}

	public static List<ReviewVO> getReviewList(int begin, int end) {
		
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		
		SqlSession ss = DBService.getFactory().openSession(true);
		List<ReviewVO> list = ss.selectList("project.seleteReviewList", map);
		ss.close();
		
		return list;
	}

	public static QAVO getQADetail(String qnaNo) {
		// TODO Auto-generated method stub
		
		SqlSession ss = DBService.getFactory().openSession(true);
		QAVO qa = ss.selectOne("project.selectQADetail", qnaNo);
		ss.close();
		
		return qa;
	}

	public static void addQAHit(String qnaNo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.update("project.addQAHit", qnaNo);
		ss.close();
	}

	public static void deleteQA(String qnaNo) {
		
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.delete("project.deleteQA", qnaNo);
		ss.close();
		
	}
	
	public static void insertQA(QAVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.insert("project.insertQA", vo);
		ss.close();
	}

	public static void updateQAVO(QAVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.update("project.updateQA", vo);
		ss.close();
		
	}
	

	public static void addReviewHit(String reviewNo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.update("project.addReviewHit", reviewNo);
		ss.close();
	}
	
	
	public static ReviewVO getReviewDetail(String reviewNo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ReviewVO review = ss.selectOne("project.selectReviewDetail", reviewNo);
		ss.close();
		
		return review;
	}
	

	public static void deleteReview(String reviewNo) {
		
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.delete("project.deleteReview", reviewNo);
		ss.close();
		
	}

	public static void updateReviewVO(ReviewVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.update("project.updateReview", vo);
		ss.close();
	}

	public static void insertReview(ReviewVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.insert("project.insertReview", vo);
		ss.close();
	}
	
}
