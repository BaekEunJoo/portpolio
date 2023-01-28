package com.spring.Imuseum.view.visit;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class VisitController {
	
	//미술관소개 페이지
	@RequestMapping("/visit.do")
	public String visit() {
		return "visit/visit";
	}
		
	//오시는길 페이지
	@RequestMapping("/us.do")
	public String visitus() {
		return "visit/us";
	}
	
	//사이트맵 페이지
	@RequestMapping("/sitemap.do")
	public String sitemap() {
		return "visit/sitemap";
	}
	
	//개인정보 처리방침 
	@RequestMapping("/privacy.do")
	public String privacy() {
		return "visit/privacy";
	}
	
	//이용약관
	@RequestMapping("/terms.do")
	public String terms() {
		return "visit/terms";
	}
	
}
