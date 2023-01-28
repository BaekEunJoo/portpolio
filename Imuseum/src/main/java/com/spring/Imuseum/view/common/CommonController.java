package com.spring.Imuseum.view.common;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.Imuseum.product.ProductService;
import com.spring.Imuseum.product.ProductVO;

@Controller
public class CommonController {
	
	private ProductService product;
	
	@Autowired
	private void setProductService(ProductService product) {
		this.product = product;
	}
	
	@RequestMapping("/goHome.do")
	public String goHome(Model model,ProductVO vo) {
		System.out.println("ProductList.do 실행");
		List<ProductVO> list = product.getProductList(vo);
		model.addAttribute("productList", list);
		System.out.println(list);
		return "index";
	}
}
