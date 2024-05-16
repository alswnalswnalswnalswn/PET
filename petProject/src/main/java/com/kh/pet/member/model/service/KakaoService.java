package com.kh.pet.member.model.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pet.member.model.dao.MemberRepository;
import com.kh.pet.member.model.vo.Member;
import com.kh.pet.member.model.vo.SocialMember;

@Service
public class KakaoService {
	
	@Autowired
	private MemberRepository memberRepository;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public String getToken(String code) throws IOException, ParseException{
		String tokenUrl = "https://kauth.kakao.com/oauth/token";
		URL url = new URL(tokenUrl);
		HttpURLConnection urlConnection = (HttpURLConnection)url.openConnection();
		
		urlConnection.setRequestMethod("POST");
		urlConnection.setDoOutput(true);
		
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(urlConnection.getOutputStream()));
		
		StringBuilder sb = new StringBuilder();
		sb.append("client_id=bf4263613861b95f8402b64976c94858");
		sb.append("&grant_type=authorization_code");
		sb.append("&redirect_uri=http://localhost:7777/pet/member/code");
		sb.append("&code="+code);
		
		bw.write(sb.toString());
		bw.flush();
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		
		String line = "";
		String responseData = "";
		while((line = br.readLine()) != null) {
			responseData += line;
		}
		
		JSONParser parser = new JSONParser();
		JSONObject element = (JSONObject)parser.parse(responseData);
		
		String accessToken = element.get("access_token").toString();
		
		// System.out.println(accessToken);
		
		return accessToken;
	}

	public SocialMember getUserInfo(String accessToken) throws IOException, ParseException {
		
		String userInfoUrl = "https://kapi.kakao.com/v2/user/me";
		
		URL url = new URL(userInfoUrl);
		
		HttpURLConnection urlConnection = (HttpURLConnection)url.openConnection();
		urlConnection.setRequestMethod("GET");
		urlConnection.setRequestProperty("Authorization", "Bearer " + accessToken);
		
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		
		String responseData = br.readLine();
		
		JSONObject responseObj = (JSONObject)new JSONParser().parse(responseData);
		
		SocialMember sm = new SocialMember();
		
		sm.setId(responseObj.get("id").toString());
		
		JSONObject propObj = (JSONObject)responseObj.get("properties");
		sm.setNickname(propObj.get("nickname").toString());
		sm.setThumbnailImage(propObj.get("thumbnail_image").toString());
		
		return sm;
	}


}
