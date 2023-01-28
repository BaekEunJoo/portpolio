package com.spring.Imuseum.member;

import com.fasterxml.jackson.databind.JsonNode;


public interface GoogleService {
	String getReturnAccessToken();
	public JsonNode getAccessToken(String autorize_code);
	public JsonNode getGoogleUserInfo(String autorize_code);
}