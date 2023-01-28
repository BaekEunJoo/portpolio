package com.mystudy.project.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.project.mybatis.DBService;
import com.mystudy.project.vo.CartListVO;
import com.mystudy.project.vo.CartVO;
import com.mystudy.project.vo.LikeVO;
import com.mystudy.project.vo.ProductVO;
import com.mystudy.project.vo.QAVO;
import com.mystudy.project.vo.ReviewVO;
import com.mystudy.project.vo.SizeVO;

public class DAO {

	public static String getCategoryNo(String category) {
		SqlSession ss = DBService.getFactory().openSession(true);
		String categoryNo = ss.selectOne("project.selectCategoryNo", category);
		ss.close();
		return categoryNo;		
	}

	public static int getTotalCount(String categoryNo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int totalCount = ss.selectOne("project.selectTotalCount", categoryNo);
		ss.close();
		return totalCount;
	}
	
	public static List<ProductVO> getBestitems () {
		SqlSession ss = DBService.getFactory().openSession(true);
		List<ProductVO> list = ss.selectList("project.selectBest");
		return list;
	}
	
	public static List<ProductVO> getNewitems () {
		SqlSession ss = DBService.getFactory().openSession(true);
		List<ProductVO> list = ss.selectList("project.selectNewest");
		return list;
	}
	

	public static List<ProductVO> orderNew (int categoryNo, int begin, int end) {
		Map <String, Integer> map = new HashMap<>();
		// key값 category에 categoryNum, begin(key)에 begin값, end(key)에 end값(string)
		map.put("categoryNo", categoryNo);
		map.put("begin", begin);
		map.put("end", end);
		
		SqlSession ss = DBService.getFactory().openSession(true);
		List<ProductVO> selectedList = ss.selectList("project.selectListNew", map);
		return selectedList;
	}

	
	public static List<ProductVO> orderName (int categoryNo, int begin, int end) {
		Map <String, Integer> map = new HashMap<>();
		// key값 category에 categoryNum, begin(key)에 begin값, end(key)에 end값(string)
		map.put("categoryNo", categoryNo);
		map.put("begin", begin);
		map.put("end", end);
		
		SqlSession ss = DBService.getFactory().openSession(true);
		List<ProductVO> selectedList = ss.selectList("project.selectListName", map);
		System.out.println(selectedList.size());
		return selectedList;
	}
	
	public static List<ProductVO> orderPrice (int categoryNo, int begin, int end) {
		Map <String, Integer> map = new HashMap<>();
		map.put("categoryNo", categoryNo);
		map.put("begin", begin);
		map.put("end", end);
		
		SqlSession ss = DBService.getFactory().openSession(true);
		List<ProductVO> selectedList = ss.selectList("project.selectListPrice", map);
		return selectedList;
	}
	
	public static ProductVO getProductInfo (String productNo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ProductVO vo = ss.selectOne("project.selectProductVO", productNo);
		return vo;
	}
	
	public static List<SizeVO> getOptionList (String productNo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		List<SizeVO> list = ss.selectList("project.selectProductOption", productNo);
		return list;
	}
	
	public static int insertCart(String optionNo, String userId, String amount, String price) {
		
		Map<String, String> map = new HashMap<>();
		map.put("optionNo", optionNo);
		map.put("userId", userId);
		map.put("amount", amount);
		map.put("price", price);
		
		SqlSession ss = DBService.getFactory().openSession(true);
		
		return ss.insert("project.insertCart", map);
		
	}

	public static String getOptionNo (String productNo, String productOption) {
		
		Map<String, String> map = new HashMap<>();
		
		map.put("productNo", productNo);
		map.put("productOption", productOption);
		
		System.out.println(map.keySet());
		System.out.println(map.values());
		
		SqlSession ss = DBService.getFactory().openSession(true);
		String optionNo = ss.selectOne("project.selectOptionNo", map);
		
		System.out.println("optionNo: " + optionNo);
		return optionNo;
	}
	
	public static LikeVO selectLike (String productNo, String userId) {
		Map<String, String> map = new HashMap<>();
		map.put("productNo", productNo);
		map.put("userId", userId);
		
		SqlSession ss = DBService.getFactory().openSession(true);
		return ss.selectOne("project.selectLikeProduct", map);
	}
	
	public static int insertLike (String productNo, String userId) {
		Map<String, String> map = new HashMap<>();
		map.put("productNo", productNo);
		map.put("userId", userId);
		
		SqlSession ss = DBService.getFactory().openSession(true);
		return ss.insert("project.inserLikeProduct", map);
	}
	
	public static int deleteLike (String productNo, String userId) {
		Map<String, String> map = new HashMap<>();
		map.put("productNo", productNo);
		map.put("userId", userId);
		
		SqlSession ss = DBService.getFactory().openSession(true);
		return ss.delete("project.deleteLikeProduct", map);
	}
	
	
	public static int getTotalReviewCount(String productNo) {
		
		SqlSession ss = DBService.getFactory().openSession(true);
		int totalCount = ss.selectOne("project.selectTotalReviewCount", productNo);
		ss.close();
		return totalCount;
		
	}
	
	public static List<ReviewVO> getProductReview (String productNo, int begin, int end) {
		Map<String, Integer> map = new HashMap<>();
		
		map.put("productNo", Integer.valueOf(productNo));
		map.put("begin", begin);
		map.put("end", end);
		
		SqlSession ss = DBService.getFactory().openSession(true);
		List<ReviewVO> list = ss.selectList("project.selectReview", map);
		ss.close();
		return list;
	}
	
	
	public static int getTotalQACount(String productNo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int totalCount = ss.selectOne("project.selectTotalQACount", productNo);
		ss.close();
		return totalCount;
	}
	
	public static List<QAVO> getProductQA (String productNo, int begin, int end) {
		
		Map<String, Integer> map = new HashMap<>();
		
		map.put("productNo", Integer.valueOf(productNo));
		map.put("begin", begin);
		map.put("end", end);
		
		SqlSession ss = DBService.getFactory().openSession(true);
		List<QAVO> list = ss.selectList("project.selectQA", map);
		ss.close();
		
		return list;

	}

	public static List<CartListVO> getCartList(String userId) {

		SqlSession ss = DBService.getFactory().openSession(true);
		List<CartListVO> list = ss.selectList("project.selectCartList", userId);
		ss.close();
		return list;
		
	}
	
	public static CartListVO getCartListVO (String cartNo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		CartListVO vo = ss.selectOne("project.selectCartListVO", cartNo);
		ss.close();
		return vo;
		
	}

	public static void delectCart(String cartNo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.delete("project.deleteCart", cartNo);
		ss.close();
	}

	public static void updateQtyCart(String amount, String cartNo, String userId) {
		
		Map<String, String> map = new HashMap<>();
		
		map.put("amount", amount);
		map.put("cartNo", cartNo);
		map.put("userId", userId);
		
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.update("project.updateQtyCart", map);
		ss.close();
		
	}

	
	public static int getCartProductPrice(String cartNo) {

		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.selectOne("project.selectCartPrice", cartNo);
		ss.close();
		return result;
	}
	
	public static int deleteCartAll (String userId) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.delete("project.deleteCartAll", userId);
		ss.close();
		return result;
	}


	
}

