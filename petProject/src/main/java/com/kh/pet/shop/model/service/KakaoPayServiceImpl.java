package com.kh.pet.shop.model.service;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.kh.pet.shop.model.vo.KakaoPayReadyVO;
import com.kh.pet.shop.model.vo.KakaoPayVo;

import lombok.extern.java.Log;



@Service
@CrossOrigin("*")
@Log
public class KakaoPayServiceImpl implements KakaoPayService {

	private static final String Host = "https://open-api.kakaopay.com/online/v1/payment/ready";
    private static final String Host2 = "https://open-api.kakaopay.com/online/v1/payment/approve";
    private static final String SECRET_KEY = "DEVDF135E73B347847ECC5A40D7DA0FFFA13D105";
	private KakaoPayReadyVO kakaoPayReadyVO;
	@Override
	public String kakaoPayReady() {
		
		
		RestTemplate restTemplate = new RestTemplate();
        
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "SECRET_KEY " + SECRET_KEY);
		headers.add("Content-type", "application/json");
		Map<String, String> params = new HashMap();
		
		params.put("cid", "TC0ONETIME");
		params.put("partner_order_id", "1");
		params.put("partner_user_id", "id");
		params.put("item_name", "item");
		params.put("quantity", "1");
		params.put("total_amount", "15000");
		params.put("tax_free_amount", "100");
		params.put("approval_url", "http://localhost:7777/pet/kakaopay/success");
		params.put("cancel_url", "http://localhost:7777/pet/");
		params.put("fail_url", "http://localhost:7777/pet/");
		
		HttpEntity<Map<String, String>> body = new HttpEntity<Map<String, String>>(params, headers);

		try {
			kakaoPayReadyVO = restTemplate.postForObject(new URI(Host), body, KakaoPayReadyVO.class);

		} catch (RestClientException | URISyntaxException e) {
			e.printStackTrace();
		}

		return kakaoPayReadyVO.getNext_redirect_pc_url();

	}
	private KakaoPayVo kakaopayVo;
	
	@Override
    public KakaoPayVo kakaopayVo(String pg_token) {
    	 RestTemplate restTemplate = new RestTemplate();

         // Server Request Header : 서버 요청 헤더
         HttpHeaders headers = new HttpHeaders();
         headers.add("Authorization", "SECRET_KEY " + SECRET_KEY); // 어드민 키
         //headers.add("Accept", "application/json");
         //headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
         headers.add("Content-type", "application/json");
         // Server Request Body : 서버 요청 본문
         Map<String, String> params = new HashMap<String, String>();
         params.put("cid", "TC0ONETIME"); // 가맹점 코드 - 테스트용
         params.put("tid", kakaoPayReadyVO.getTid());
         //paramss.put("partner_order_id", String.valueOf(((Experience)session.getAttribute("experince")).getExperienceNo())); // 주문 번호
         //paramss.put("partner_user_id",  ((Experience)session.getAttribute("experince")).getUserId()); // 회원 아이디
         params.put("partner_order_id", "1");
         params.put("partner_user_id", "id");
         params.put("pg_token", pg_token);
//         params.put("total_amount", "20000"); // 상품 가격
//         params.put("tax_free_amount", "100"); // 상품 비과세 금액
//         params.put("approval_url", "http://localhost:8024/success"); // 성공시 url
//         params.put("fail_url", "http://localhost:8024/fail"); // 실패시 url
//         params.put("cancel_url", "http://localhost:8024/cancel");
         // 헤더와 바디 붙이기
         HttpEntity<Map<String, String>> body = new HttpEntity<Map<String, String>>(params, headers);
         try {
        	 kakaopayVo = restTemplate.postForObject(new URI(Host2), body, KakaoPayVo.class);
            //HttpEntity<Reserve> reserve = restTemplate.exchange(new URI(Host + "/online/v1/payment/ready"), HttpMethod.POST, body, Reserve.class);
            log.info(""+ kakaopayVo);
            
         } catch (RestClientException e) {
             e.printStackTrace();
         } catch (URISyntaxException e) {
             e.printStackTrace();
         }
         return kakaopayVo;
    }
	

}
