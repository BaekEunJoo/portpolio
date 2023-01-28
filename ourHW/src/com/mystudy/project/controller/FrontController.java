package com.mystudy.project.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.model.VO.userVO;
import com.mystudy.project.common.Paging;
import com.mystudy.project.common.PagingQA;
import com.mystudy.project.common.PagingReview;
import com.mystudy.project.dao.DAO;
import com.mystudy.project.mybatis.DBService;
import com.mystudy.project.vo.CartListVO;
import com.mystudy.project.vo.CartVO;
import com.mystudy.project.vo.LikeVO;
import com.mystudy.project.vo.ProductVO;
import com.mystudy.project.vo.QAVO;
import com.mystudy.project.vo.ReviewVO;
import com.mystudy.project.vo.SizeVO;


@WebServlet("/controllersk")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		String type = request.getParameter("type");
		System.out.println(type);
		
		if (type.equals("deleteCartSelect")) {
			
			String[] cartNo = request.getParameterValues("cartNo");
			
			for (String no : cartNo) {
				DAO.delectCart(no);
			}
			
			userVO userVo = (userVO) request.getSession().getAttribute("user");
			String userId =  userVo.getUserId();
			
			request.getRequestDispatcher("/controllersk?type=cartList").forward(request, response);
		}
		
		
		
		if (type.equals("productlist")) {
			
			String category = request.getParameter("category");
			String categoryNo = null;
			String order = request.getParameter("order");


			if (category.equals("BESTITEM")) {
				categoryNo = "0";
				
				request.setAttribute("category", category);
				List<ProductVO> productList = DAO.getBestitems();

				request.setAttribute("productList", productList);
				
			} else if (category.equals("NEW")) {
				categoryNo = "0";
				
				request.setAttribute("category", category);
				List<ProductVO> productList = DAO.getNewitems();
				
				request.setAttribute("productList", productList);

			} else { 
				
				categoryNo = DAO.getCategoryNo(category);
				
				request.setAttribute("category", category);
				request.setAttribute("categoryNo", categoryNo);
				
				Paging p = paging(categoryNo, request);			
				
				request.setAttribute("p", p);

				if (order == null || order.equals("new")) {
					List<ProductVO> productList = DAO.orderNew(Integer.valueOf(categoryNo), p.getBegin(), p.getEnd());
					request.setAttribute("productList", productList);				
				} else if (order.equals("price")) {
					List<ProductVO> productList = DAO.orderPrice(Integer.valueOf(categoryNo), p.getBegin(), p.getEnd());
					request.setAttribute("productList", productList);								
				} else if  (order.equals("name")) {
					List<ProductVO> productList = DAO.orderName(Integer.valueOf(categoryNo), p.getBegin(), p.getEnd());
					request.setAttribute("productList", productList);								
				}
				
			}			
			
			request.getRequestDispatcher("ProductPage/product_list.jsp").forward(request, response);
			
		}
		

		if (type.equals("productdetail")) {
			
			String productNo = request.getParameter("productNo");
			System.out.println("productNo" + productNo);
			
			ProductVO productVO = DAO.getProductInfo(productNo);

			userVO userVO = (userVO) request.getSession().getAttribute("user");
			if (userVO == null) {
				userVO = new userVO(0, 0);
			}
			String userId =  userVO.getUserId();

			LikeVO likeVO =  DAO.selectLike(productNo, userId);
			request.setAttribute("likeVO", likeVO);
			
			List<SizeVO> sizeList = DAO.getOptionList(productNo);
			
			request.setAttribute("productVO", productVO);
			
			request.setAttribute("SizeList", sizeList);

			
			PagingReview pr = reviewPaging(productNo, request);
			request.setAttribute("pr", pr);

			//리뷰 게시글 리스트업
			List<ReviewVO> reviewList = DAO.getProductReview(productNo, pr.getBegin(), pr.getEnd());
			request.setAttribute("reviewList", reviewList);
			
			
			PagingQA pq = qaPaging(productNo, request);
			request.setAttribute("pq", pq);
			
			//QA 게시글 리스트업
			List<QAVO> qaList = DAO.getProductQA(productNo, pq.getBegin(), pq.getEnd());
			System.out.println(qaList.size());
			request.setAttribute("qaList", qaList);
			request.getRequestDispatcher("ProductPage/product_detail.jsp").forward(request, response);
		
		}
		
		if (type.equals("pay")) {
			//바로결제로 <CartVO>를 넘기거나, 장바구니에서 <CartNo> List를 넘김
			//CartVO로 된 list는 CartNo가 없음 optionNo, userId, amount, price만
			//productNo가 필요하면 결제 페이지에서 select
			
			String[] cartNo = request.getParameterValues("cartNo");
			
			if (cartNo == null) {
				List<CartListVO> list = new ArrayList<CartListVO>();
				
				String[] productNo = request.getParameterValues("productNo");
				
				String[] price = request.getParameterValues("price");

				String[] qty = request.getParameterValues("qty");
				
				String[] eachPrice =  request.getParameterValues("eachPrice");
				
				String[] optionSize = request.getParameterValues("optionSize");
				String[] optionNo = new String[optionSize.length];
				for (int i = 0; i < optionSize.length; i++) {
					optionNo[i] = DAO.getOptionNo(productNo[i], optionSize[i]);
				}
				
				userVO userVO = (userVO) request.getSession().getAttribute("user");
				String userId =  userVO.getUserId();
				
				String productName =  request.getParameter("productName");
				String productThumnail =  request.getParameter("productThumnail");
				
				for (int i = 0; i < optionSize.length; i++) {
					if (qty[i].equals("0")) continue;	
					list.add(new CartListVO(userId, productName, productThumnail, 
							Integer.valueOf(price[i]), Integer.valueOf(qty[i]), Integer.valueOf(eachPrice[i]),
							optionSize[i], productNo[i]));
				}
				
				request.setAttribute("list", list);
				
			} else {
				
				List<CartListVO> list = new ArrayList<CartListVO>();
				
				List<String> cartNoList = Arrays.asList(cartNo);
				//System.out.println("cart에서 넘긴 리스트 : " + list);

				for (String no : cartNoList) {
					list.add(DAO.getCartListVO(no));
				}				
				
				request.setAttribute("list", list);
			
			}
			
			//단일 상품 결제를 위한 List<CartVO> list 전달 (옵션은 여러개일 수 있음)
			
			//payment 페이지 구현 전
			request.getRequestDispatcher("Cart/order.jsp").forward(request, response);
			
		}
		
		if (type.equals("addCart")) {
			
			List<CartVO> list = new ArrayList<CartVO>();

			String productNo = request.getParameter("productNo");
			String[] price = request.getParameterValues("price");
			
			String[] qty = request.getParameterValues("qty");
			String[] productOption = request.getParameterValues("optionSize");
			String optionNo[] = new String[productOption.length];

			userVO userVO = (userVO) request.getSession().getAttribute("user");
			String userId =  userVO.getUserId();

			for (int i = 0; i < productOption.length; i++) {
				
				optionNo[i] = DAO.getOptionNo(productNo, productOption[i]);
				
			}
			
			for (int i = 0; i < productOption.length; i++) {
			
				if (qty[i].equals("0")) continue;	
				DAO.insertCart(optionNo[i], userId, qty[i], price[i]);
			
			}
			System.out.println("addCart의 productNo: " + productNo);
			//request.getRequestDispatcher("controllersk?type=productdetail").forward(request, response);
			response.sendRedirect("controllersk?type=productdetail&productNo="+productNo);
			
		}
	
		if (type.equals("cartList")) {
			
			userVO userVO = (userVO) request.getSession().getAttribute("user");
			String userId =  userVO.getUserId();
			System.out.println("userId : " + userId);
			List<CartListVO> list = new ArrayList<>();
			list = DAO.getCartList(userId);
			
			request.setAttribute("list", list);
			request.getRequestDispatcher("/Cart/cart.jsp").forward(request, response);
			
		}
		


	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
	
	
	public static Paging paging (String categoryNo, HttpServletRequest request) {
		
		Paging p =  new Paging();
		

		p.setTotalRecord(DAO.getTotalCount(categoryNo));
		
		p.setTotalPage();
		
		String cPage =  request.getParameter("page");

		if (cPage != null) {
			p.setNowPage(Integer.valueOf(cPage));
		}
		
		p.setEnd(p.getNowPage() * p.getNumPerPage());
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
		
		if (p.getEnd() > p.getTotalRecord()) {
			p.setEnd(p.getTotalRecord());
		}
		
		
		int nowPage = p.getNowPage();
		int beginPage = (nowPage - 1) / p.getNumPerBlock() * p.getNumPerBlock() + 1;
		
		p.setBeginPage(beginPage);
		p.setEndPage(beginPage + p.getNumPerBlock() - 1);
		
		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}

		
		return p;

	}
	
	
	
	public static PagingQA qaPaging (String productNo, HttpServletRequest request) {

		PagingQA pq = new PagingQA();
		
		pq.setTotalRecord(DAO.getTotalQACount(productNo));
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
	
	public static PagingReview reviewPaging (String productNo, HttpServletRequest request) {
		
		PagingReview pr =  new PagingReview();
		
		pr.setTotalRecord(DAO.getTotalReviewCount(productNo));
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
