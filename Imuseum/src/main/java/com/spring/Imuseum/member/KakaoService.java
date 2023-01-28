package com.spring.Imuseum.member;

import java.util.Map;

public interface KakaoService {
	String getReturnAccessToken(String code);
	Map<String,Object> getUserInfo(String access_token);
	void getLogout(String access_token);
}
