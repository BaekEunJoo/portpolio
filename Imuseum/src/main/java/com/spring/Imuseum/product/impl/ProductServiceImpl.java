package com.spring.Imuseum.product.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.Imuseum.product.OptionVO;
import com.spring.Imuseum.product.ProductQnaVO;
import com.spring.Imuseum.product.ProductService;
import com.spring.Imuseum.product.ProductVO;
import com.spring.Imuseum.product.ReviewVO;
import com.spring.Imuseum.product.dao.ProductDAO;

@Service("productService")
public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProductDAO productDao;
	
	public ProductServiceImpl() {
		System.out.println(">> ProductServiceImpl() 객체 생성");
	}
	
	@Override //2022-12-15
	public void insertProductQna(ProductQnaVO vo) {
		productDao.insertProductQna(vo);
	}
	@Override
	public void insertProduct(ProductVO vo) {
		productDao.insertProduct(vo);
	}
	
	@Override
	public void insertOption(OptionVO vo) {
		productDao.insertOption(vo);
	}

	@Override
	public void updateProduct(ProductVO vo) {
		productDao.updateProduct(vo);
	}
	
	@Override
	public void updateOption(OptionVO vo) {
		productDao.updateOption(vo);
	}
	
	@Override
	public void updateAnswer(ProductQnaVO vo) {
		productDao.updateAnswer(vo);
	}

	@Override
	public void deleteProduct(ProductVO vo) {
		productDao.deleteProduct(vo);
	}
	
	@Override
	public void deleteOption(OptionVO vo) {
		productDao.deleteOption(vo);
	}
	
	@Override
	public void deleteReview(ReviewVO vo) {
		productDao.deleteReview(vo);
	}
	
	@Override
	public void deleteQna(ProductQnaVO vo) {
		productDao.deleteQna(vo);
	}

	@Override
	public ProductVO getProduct(ProductVO vo) {
		return productDao.getProduct(vo);
	}
	
	@Override
	public ProductQnaVO getQna(ProductQnaVO vo) {
		return productDao.getQna(vo);
	}

	@Override
	public List<ProductVO> getProductList(ProductVO vo) {
		return productDao.getProductList(vo);
	}
	

	@Override
	public List<ProductVO> getGoodsList(ProductVO vo) {
		return productDao.getGoodsList(vo);
	}
	
	@Override
	public List<ProductVO> GoodsSort(ProductVO vo) {
		return productDao.GoodsSort(vo);
	}
	
	@Override
	public List<ProductVO> GoodsAsc(ProductVO vo) {
		return productDao.GoodsAsc(vo);
	}

	@Override
	public List<ProductVO> getEditionsList(ProductVO vo) {
		return productDao.getEditionsList(vo);
	}
	
	@Override
	public List<ProductVO> EditionsSort(ProductVO vo) {
		return productDao.EditionsSort(vo);
	}
	
	@Override
	public List<ProductVO> EditionsAsc(ProductVO vo) {
		return productDao.EditionsAsc(vo);
	}

	@Override
	public List<ProductVO> AdminProduct(ProductVO vo) {
		return productDao.getEditionsList(vo);
	}

	@Override
	public List<OptionVO> getOption(ProductVO vo) {
		return productDao.getOption(vo);
	}
	
	@Override
	public List<OptionVO> getOptionList(OptionVO vo) {
		return productDao.getOptionList(vo);
	}
	
	@Override
	public List<ReviewVO> getReview(ProductVO vo) {
		return productDao.getReview(vo);
	}
	
	@Override
	public List<ReviewVO> getReviewList(ReviewVO vo) {
		return productDao.getReviewList(vo);
	}
	
	@Override
	public List<ProductQnaVO> getProductQna(ProductVO vo) {
		return productDao.getProductQna(vo);
	}
	
	@Override
	public List<ProductQnaVO> getProductQnaList(ProductQnaVO vo) {
		return productDao.getProductQnaList(vo);
	}
}	
