package com.spring.Imuseum.view.member;


import java.io.IOException;
import java.sql.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.fasterxml.jackson.databind.JsonNode;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.spring.Imuseum.member.GoogleService;
import com.spring.Imuseum.member.KakaoService;
import com.spring.Imuseum.member.MemberService;
import com.spring.Imuseum.member.MemberVO;
import com.spring.Imuseum.member.NaverLoginBO;

@SessionAttributes("member")

@Controller
public class MemberController {

	private MemberService memberService;
	
	private KakaoService kakaoService;
	
	private GoogleService googleService;
	
	/* naverLoginBO */
    private NaverLoginBO naverLoginBO;
    private String apiResult = null;
	
    //멤버
    @Autowired
    private void setMemberService (MemberService memberService) {
    	this.memberService = memberService;
    }
    //카카오
    @Autowired
    private void setKakaoService (KakaoService kakaoService) {
    	this.kakaoService = kakaoService;
    }   
    //구글
    @Autowired
    private void setKakaoService (GoogleService googleService) {
    	this.googleService = googleService;
    }    
    
    //네이버
    @Autowired
    private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
        this.naverLoginBO = naverLoginBO;
    }
    
	@RequestMapping(value="moveTologin.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String login(Model model, HttpSession session) {
        
/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        String googleAuthUrl = googleService.getReturnAccessToken();
        
        model.addAttribute("naverUrl", naverAuthUrl);
        model.addAttribute("googleUrl", googleAuthUrl);
        
        System.out.println("네이버:" + naverAuthUrl);
        System.out.println("구글:" + googleAuthUrl);        
      	
        /* 생성한 인증 URL을 View로 전달 */
        return "member/login";
    }
	
    //네이버 로그인 성공시 callback호출 메소드
    @RequestMapping(value = "callback.do", method = { RequestMethod.GET, RequestMethod.POST })
    public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session,
    		MemberVO vo)
            throws IOException, ParseException {
        System.out.println("여기는 callback");
        OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
        //로그인 사용자 정보를 읽어온다.
        apiResult = naverLoginBO.getUserProfile(oauthToken);
        
        JSONParser jsonParser = new JSONParser();
        JSONObject jsonObj;
        jsonObj = (JSONObject) jsonParser.parse(apiResult);
		JSONObject response_obj = (JSONObject) jsonObj.get("response");	
        
		System.out.println(response_obj);
		//Json 파싱
        String id = (String) response_obj.get("id");
		String email = (String) response_obj.get("email");
		String name = (String) response_obj.get("name");
		String birthday = (String) response_obj.get("birthday");
		String birthyear = (String) response_obj.get("birthyear");
		String phone = (String) response_obj.get("mobile");
		String birthDay = birthyear + "-"  + birthday;
		
		vo.setId(id);
		
		Date sqlDate = Date.valueOf(birthDay);
		if(memberService.getMemberById(vo) == null) {
			vo.setEmail(email);
			vo.setName(name);
			vo.setPhone(phone);			
			vo.setGrade("SEED");	
			vo.setAdmin("NORMAL");
			vo.setSnsType(2);
			vo.setBirth(sqlDate);
			memberService.joinMember(vo);
			session.setAttribute("member", vo);
		} else {
			session.setAttribute("member", memberService.getMemberById(vo));
		}
	
		
		System.out.println("memberVO:" + vo);
		
        /* 네이버 로그인 성공 페이지 View 호출 */
        return "redirect:login.do";
    }
    
    /*카카오 로그인 Callback*/
    @RequestMapping(value = "/kakao_callback.do", method = RequestMethod.GET)
    public String redirectkakao(@RequestParam String code, HttpSession session,MemberVO vo) throws IOException {
            System.out.println("::: kakaoCallback " + code);
            
            //접속토큰 get
            String kakaoToken = kakaoService.getReturnAccessToken(code);
            
            //접속자 정보 get
            Map<String,Object> result = kakaoService.getUserInfo(kakaoToken);
            System.out.println(result);
            
            vo.setId((String)result.get("id"));
            
            if(memberService.getMemberById(vo) == null) {
            	vo.setName((String)result.get("name"));
            	vo.setEmail((String)result.get("email"));
    			vo.setGrade("SEED");	
    			vo.setAdmin("NORMAL");
    			vo.setSnsType(3);
            	memberService.joinMemberKakao(vo);
            	session.setAttribute("member", vo);
            } else {
            	session.setAttribute("member", memberService.getMemberById(vo));
            }
            /*로그아웃 처리 시, 사용할 토큰 값*/
            session.setAttribute("kakaoToken", kakaoToken);
            
        return "redirect:login.do";
    }
    
    /* 구글 로그인 */
    //구글 콜백
    @RequestMapping(value = "/googleCallback.do")
    public String oauth_google(@RequestParam(value = "code") String authCode,HttpSession session, MemberVO vo ) throws Exception {
    	System.out.println(":::google 콜백 ");
    	
    	//Auth_code로 AccessToken 발급 요청
    	JsonNode jsonToken = googleService.getAccessToken(authCode);
    	
    	//Access 토큰 획득
    	String accessToken = jsonToken.get("access_token").toString();
    	String refreshToken = "";
        if(jsonToken.has("refresh_token")) {
            refreshToken = jsonToken.get("refresh_token").toString();
        }
        String expiresTime = jsonToken.get("expires_in").toString();
        
        //Access Token으로 사용자 정보 획득
        
        JsonNode userInfo = googleService.getGoogleUserInfo(accessToken);
        System.out.println(userInfo);
        
        //Json 파싱 
        String id = userInfo.get("id").asText();
        String email = userInfo.get("email").asText();
        
        String name = "";
        Object nameCheck = userInfo.get("family_name");
        
        if(nameCheck == null) {
        	name = userInfo.get("name").asText();
        } else {
        	name = userInfo.get("family_name").asText() + userInfo.get("given_name").asText();
        }
        
        System.out.println("id :" + id);
        System.out.println("email :" + email);
        System.out.println("name :" + name);
        
        //파싱한 Json으로 멤버 VO에 정보 등록
        
        vo.setId(id);
        
        if (memberService.getMemberById(vo) == null) {
        	vo.setName(name);
        	vo.setEmail(email);
			vo.setGrade("SEED");	
			vo.setAdmin("NORMAL");
			vo.setSnsType(4);
			memberService.joinMemberKakao(vo);
			session.setAttribute("member", vo);
        } else {
        	session.setAttribute("member", memberService.getMemberById(vo));        	
        }
        
        return "redirect:login.do";
    }
    
    
	@GetMapping("/login.do")
	public String loginComplete(@ModelAttribute("member") MemberVO vo) {
		System.out.println("로그인 성공 후 member:" + vo);
		return "redirect:goHome.do";
	}
	
	@RequestMapping("/logout.do")
	public String logout(SessionStatus ss,HttpSession session) {
        String access_Token = (String)session.getAttribute("kakaoToken");

        if(access_Token != null && !"".equals(access_Token)){
        	System.out.println(":::: 카카오 로그아웃 실행");
            kakaoService.getLogout(access_Token);
            session.removeAttribute("access_Token");
        }
        session.removeAttribute("member");
        ss.setComplete();
        return "redirect:goHome.do";
	}
    
	
	@RequestMapping("moveToSign.do")
	public String moveToSign() {
		return "member/memberJoin";
	}
	
	@RequestMapping("moveToJoin.do")
	public String moveToJoin(Model model, HttpSession session) {
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        String googleAuthUrl = googleService.getReturnAccessToken();
        
        model.addAttribute("naverUrl", naverAuthUrl);
        model.addAttribute("googleUrl", googleAuthUrl);
        
		return "member/join";
	}
	
	@RequestMapping("moveTomemberFind.do")
	public String moveTomemberFind() {
		return "member/memberFind";
	}	
	
}
