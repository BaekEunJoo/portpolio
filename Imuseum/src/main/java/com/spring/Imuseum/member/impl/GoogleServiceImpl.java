package com.spring.Imuseum.member.impl;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.Imuseum.member.GoogleService;

@Service
public class GoogleServiceImpl implements GoogleService{
	
	private final String LoginUrl = "https://accounts.google.com";
	private final String ClientId = "823701064865-qt234ui11kpthfqh28ptkua9cuav1kmr.apps.googleusercontent.com";
	private final String ClientSecret = "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";
	private final String RedirectUri = "http://localhost:8080/Imuseum/googleCallback.do";
	private final String GrantType = "authorization_code";
	
	
	@Override
	public @ResponseBody String getReturnAccessToken() {
		String reqUrl = LoginUrl + "/o/oauth2/v2/auth?client_id=" + ClientId + "&redirect_uri=" + RedirectUri
        + "&response_type=code&scope=email%20profile%20openid&access_type=offline";

		return reqUrl;
	}
	
	@Override
	public JsonNode getAccessToken(String autorize_code) {
		final String RequestUrl = "https://www.googleapis.com/oauth2/v4/token";
		 
        final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
        postParams.add(new BasicNameValuePair("grant_type", GrantType));
        postParams.add(new BasicNameValuePair("client_id", ClientId));
        postParams.add(new BasicNameValuePair("client_secret", ClientSecret));
        postParams.add(new BasicNameValuePair("redirect_uri", RedirectUri)); // 리다이렉트 URI
        postParams.add(new BasicNameValuePair("code", autorize_code)); // 로그인 과정중 얻은 code 값
 
        final HttpClient client = HttpClientBuilder.create().build();
        final HttpPost post = new HttpPost(RequestUrl);
        JsonNode returnNode = null;
 
        try {
            post.setEntity(new UrlEncodedFormEntity(postParams));
            final HttpResponse response = client.execute(post);
            final int responseCode = response.getStatusLine().getStatusCode();
 
            System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
            System.out.println("Post parameters : " + postParams);
            System.out.println("Response Code : " + responseCode);
 
            // JSON 형태 반환값 처리
            ObjectMapper mapper = new ObjectMapper();
            returnNode = mapper.readTree(response.getEntity().getContent());

 
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            // clear resources
        }
 
        return returnNode;
 
    }


	@Override
	public JsonNode getGoogleUserInfo(String autorize_code) {
		final String RequestUrl = "https://www.googleapis.com/oauth2/v2/userinfo";
		 
        final HttpClient client = HttpClientBuilder.create().build();
        final HttpGet get = new HttpGet(RequestUrl);
 
        JsonNode returnNode = null;
        
        // add header
        get.addHeader("Authorization", "Bearer " + autorize_code);
 
        try {
            final HttpResponse response = client.execute(get);
            final int responseCode = response.getStatusLine().getStatusCode();
            
            ObjectMapper mapper = new ObjectMapper();
            returnNode = mapper.readTree(response.getEntity().getContent());
            
            System.out.println("\nSending 'GET' request to URL : " + RequestUrl);
            System.out.println("Response Code : " + responseCode);
 
 
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            // clear resources
        }
        return returnNode;
 
    }
		
		




}
