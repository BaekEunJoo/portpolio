package com.spring.Imuseum.product;

import java.util.List;


public interface ProductService {
	void insertProduct(ProductVO vo);
	void insertOption(OptionVO vo);
	void insertProductQna(ProductQnaVO vo); //2022-12-15
	void updateProduct(ProductVO vo);
	void updateOption(OptionVO vo);
	void updateAnswer(ProductQnaVO vo);
	void deleteProduct(ProductVO vo);
	void deleteOption(OptionVO vo);
	void deleteReview(ReviewVO vo);
	void deleteQna(ProductQnaVO vo);
	ProductVO getProduct(ProductVO vo); //1개의 데이터 조회
	ProductQnaVO getQna(ProductQnaVO vo); //1개의 데이터 조회
	List<ProductVO> getProductList(ProductVO vo);
	List<ProductVO> getGoodsList(ProductVO vo); 
	List<ProductVO> GoodsSort(ProductVO vo); 
	List<ProductVO> GoodsAsc(ProductVO vo); 
	List<ProductVO> getEditionsList(ProductVO vo); 
	List<ProductVO> EditionsSort(ProductVO vo); 
	List<ProductVO> EditionsAsc(ProductVO vo); 
	List<ProductVO> AdminProduct(ProductVO vo);
	List<OptionVO> getOption(ProductVO vo);
	List<OptionVO> getOptionList(OptionVO vo);
	List<ReviewVO> getReview(ProductVO vo);
	List<ReviewVO> getReviewList(ReviewVO vo);
	List<ProductQnaVO> getProductQna(ProductVO vo);
	List<ProductQnaVO> getProductQnaList(ProductQnaVO vo);
}
