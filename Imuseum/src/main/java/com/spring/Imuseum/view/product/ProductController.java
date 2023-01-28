package com.spring.Imuseum.view.product;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.spring.Imuseum.member.MemberVO;
import com.spring.Imuseum.order.CartService;
import com.spring.Imuseum.order.CartVO;
import com.spring.Imuseum.order.WishService;
import com.spring.Imuseum.product.OptionVO;
import com.spring.Imuseum.product.ProductQnaVO;
import com.spring.Imuseum.product.ProductService;
import com.spring.Imuseum.product.ProductVO;
import com.spring.Imuseum.product.ReviewVO;

@Controller
@SessionAttributes({"product","member"})
public class ProductController {
	@Autowired
	private ProductService productService;
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private WishService wishService;
	
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		System.out.println("=======> Map searchConditionMap() 실행");
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("상품명", "PRODUCTNAME");
		conditionMap.put("내용", "PRODUCTCONTENT");
		return conditionMap;
	}	
	
	@ModelAttribute("cartCnt")
	public int getCartCnt(MemberVO mvo,
						  HttpSession session) {
		System.out.println(">> getCartCnt() 실행 : 장바구니 건수");
		CartVO vo = new CartVO();
			
		mvo = (MemberVO) session.getAttribute("member");
			
		if(mvo == null) {
			return 0;
		} else {
			System.out.println(mvo.getId());
			vo.setId(mvo.getId());
			int cartCnt = cartService.getCartCnt(vo);			
			System.out.println("장바구니 건수: " + cartCnt);
			return cartCnt;
		}
	}
	
	@ModelAttribute("wishCnt")
	public int getWishCnt(Model model,MemberVO mvo,HttpSession session) {
		mvo = (MemberVO) session.getAttribute("member");
		if(mvo == null) {
			return 0;
		} else {
			int wishCnt = wishService.getWishCnt(mvo.getId());
			System.out.println("위시리스트 건수: " + wishCnt);
			model.addAttribute("wishCnt", wishCnt);
			return wishCnt;
		}
	}
	
	@RequestMapping("/getProduct.do")
	public String getProduct(ProductVO vo, Model model) {
		System.out.println("vo : " + vo);
		ProductVO product = productService.getProduct(vo);
		model.addAttribute("product", product);
		List<OptionVO> option = productService.getOption(vo);
		model.addAttribute("option", option);
		List<ReviewVO> review = productService.getReview(vo);
		model.addAttribute("review", review);
		List<ProductQnaVO> qna = productService.getProductQna(vo);
		model.addAttribute("qna", qna);
		return "product/ProductView";
	}
	
	@RequestMapping("/ProductList.do")
	public String getProductList(ProductVO vo, Model model) {
		System.out.println("vo : " + vo);
		System.out.println("ProductList.do 실행");
		List<ProductVO> list = productService.getProductList(vo);
		model.addAttribute("productList", list);
		return "product/ProductList";
	}
	
	@RequestMapping("/optionList.do")
	public String getOptionList(OptionVO vo, Model model) {
		System.out.println("vo : " + vo);
		List<OptionVO> option = productService.getOptionList(vo);
		model.addAttribute("option", option);
		return "product/OptionList";
	}
	
	@RequestMapping("/EditionsList.do")
	public String getEditions(ProductVO vo, Model model) {
		System.out.println("vo : " + vo);
		System.out.println("EditionsList.do 실행");
		List<ProductVO> Editions = productService.getEditionsList(vo);
		model.addAttribute("EditionsList", Editions);
		return "product/EditionsList";
	}
	
	@RequestMapping("/EditionsSort.do")
	public String EditionsSort(ProductVO vo, Model model) {
		System.out.println("vo : " + vo);
		List<ProductVO> EditionsSort = productService.EditionsSort(vo);
		model.addAttribute("EditionsSort", EditionsSort);
		return "product/EditionsSort";
	}
	
	@RequestMapping("/EditionsAsc.do")
	public String EditionsAsc(ProductVO vo, Model model) {
		System.out.println("vo : " + vo);
		List<ProductVO> EditionsAsc = productService.EditionsAsc(vo);
		model.addAttribute("EditionsAsc", EditionsAsc);
		return "product/EditionsAsc";
	}
	
	@RequestMapping("/GoodsList.do")
	public String getGoods(ProductVO vo, Model model) {
		System.out.println("vo : " + vo);
		System.out.println("GoodsList.do 실행");
		List<ProductVO> Goods = productService.getGoodsList(vo);
		model.addAttribute("GoodsList", Goods);
		return "product/GoodsList";
	}
	
	@RequestMapping("/GoodsSort.do")
	public String GoodsSort(ProductVO vo, Model model) {
		System.out.println("vo : " + vo);
		List<ProductVO> GoodsSort = productService.GoodsSort(vo);
		model.addAttribute("GoodsSort", GoodsSort);
		return "product/GoodsSort";
	}
	
	@RequestMapping("/GoodsAsc.do")
	public String GoodsAsc(ProductVO vo, Model model) {
		System.out.println("vo : " + vo);
		List<ProductVO> GoodsAsc = productService.GoodsAsc(vo);
		model.addAttribute("GoodsAsc", GoodsAsc);
		return "product/GoodsAsc";
	}
	
	@RequestMapping(value = "/insertOption.do")
	public String insertOption(OptionVO vo) {
		System.out.println(">>>>> 게시글 입력");
		System.out.println("vo : " + vo);
		productService.insertOption(vo);
		return "redirect:productAdmin.do";
	}
		
	@RequestMapping(value = "/insertProduct.do", method = RequestMethod.POST)
	public String insertProduct(ProductVO vo) throws IllegalStateException, IOException {
		System.out.println(">>>>> 게시글 입력");
		System.out.println("vo : " + vo);
		MultipartFile uploadFile1 = vo.getUploadFile1();
		MultipartFile uploadFile2 = vo.getUploadFile2();
		MultipartFile uploadFile3 = vo.getUploadFile3();
		MultipartFile uploadFile4 = vo.getUploadFile4();
		MultipartFile uploadFile5 = vo.getUploadFile5();
		
		if (!uploadFile1.isEmpty()) {
			System.out.println("uploadFile1.isEmpty() : " + uploadFile1.isEmpty());
			String fileName1 = uploadFile1.getOriginalFilename(); //원본파일명
			System.out.println("::: 원본파일명 : " + fileName1);
			vo.setPhoto1(fileName1);
			uploadFile1.transferTo(new File("C:/MyStudy/70_Spring/Imuseum/src/main/webapp/img//MyStudy/70_Spring/Imuseum/src/main/webapp/img/" + fileName1));
		} else if (uploadFile1.isEmpty()) {
			vo.setPhoto1("이미지준비중.jpg");
		}
		
		if (!uploadFile2.isEmpty()) {
			System.out.println("uploadFile2.isEmpty() : " + uploadFile2.isEmpty());
			String fileName2 = uploadFile2.getOriginalFilename(); //원본파일명
			System.out.println("::: 원본파일명 : " + fileName2);
			vo.setPhoto2(fileName2);
			uploadFile2.transferTo(new File("C:/MyStudy/70_Spring/Imuseum/src/main/webapp/img/MyStudy/70_Spring/Imuseum/src/main/webapp/img/" + fileName2));
		} else if (uploadFile2.isEmpty()) {
			vo.setPhoto2("이미지준비중.jpg");
		}
		
		if (!uploadFile3.isEmpty()) {
			System.out.println("uploadFile3.isEmpty() : " + uploadFile3.isEmpty());
			String fileName3 = uploadFile3.getOriginalFilename(); //원본파일명
			System.out.println("::: 원본파일명 : " + fileName3);
			vo.setPhoto3(fileName3);
			uploadFile3.transferTo(new File("C:/MyStudy/70_Spring/Imuseum/src/main/webapp/img/MyStudy/70_Spring/Imuseum/WebContent/imgs/" + fileName3));
		} else if (uploadFile3.isEmpty()) {
			vo.setPhoto3("이미지준비중.jpg");
		}
		
		if (!uploadFile4.isEmpty()) {
			System.out.println("uploadFile4.isEmpty() : " + uploadFile4.isEmpty());
			String fileName4 = uploadFile4.getOriginalFilename(); //원본파일명
			System.out.println("::: 원본파일명 : " + fileName4);
			vo.setPhoto4(fileName4);
			uploadFile4.transferTo(new File("C:/MyStudy/70_Spring/Imuseum/src/main/webapp/img/MyStudy/70_Spring/Imuseum/WebContent/imgs/" + fileName4));
		} else if (uploadFile4.isEmpty()) {
			vo.setPhoto4("이미지준비중.jpg");
		}
		if (!uploadFile5.isEmpty()) {
			System.out.println("uploadFile5.isEmpty() : " + uploadFile5.isEmpty());
			String fileName5 = uploadFile5.getOriginalFilename(); //원본파일명
			System.out.println("::: 원본파일명 : " + fileName5);
			vo.setProductcontent(fileName5);
			uploadFile5.transferTo(new File("C:/MyStudy/70_Spring/Imuseum/src/main/webapp/img/MyStudy/70_Spring/Imuseum/WebContent/imgs/" + fileName5));
		} else if (uploadFile5.isEmpty()) {
			vo.setProductcontent("이미지준비중.jpg");
		}
		productService.insertProduct(vo);
		
		if (vo.getCategory().equals("EDITIONS")) {
			return "redirect:EditionsList.do";
		} else {
			return "redirect:GoodsList.do";
		}
	}
	
	@RequestMapping("/insertProductgo.do")
	public String insertProductView() {
		System.out.println(">>>>> 게시글 입력화면으로 ");
		return "product/insertProduct";
	}
	
	
	@RequestMapping("/updateProductgo.do")
	public String updateProductView(ProductVO vo, Model model) {
		ProductVO product = productService.getProduct(vo);
		model.addAttribute("product", product);
		return "product/updateProduct";
	}
	
	@RequestMapping("/insertOptiongo.do")
	public String insertOptiongo(ProductVO vo, Model model) {
		ProductVO product = productService.getProduct(vo);
		model.addAttribute("product", product);
		return "product/insertOption";
	}
	
	@RequestMapping("/updateProduct.do")
	public String updateProduct(ProductVO vo) {
		productService.updateProduct(vo);
		return "redirect:productAdmin.do";
	}
	
	@RequestMapping("/deleteProduct.do")
	public String deleteProduct(ProductVO vo) {
		productService.deleteProduct(vo);
		return "redirect:productAdmin.do";
	}
	
	//2022-12-15
	@RequestMapping("/productQnaGo.do")
	public String productQnaGo(ProductVO vo, Model model) {
		ProductVO product = productService.getProduct(vo);
		model.addAttribute("product", product);
		return "product/ProductQna";
	}
	
	@RequestMapping("/insertProductQna.do")
	public String insertProductQna(ProductQnaVO vo) {
		productService.insertProductQna(vo);
		return "redirect:ProductList.do";
	}
	
	
	
}



























