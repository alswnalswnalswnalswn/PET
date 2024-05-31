package com.kh.pet.shop.model.service;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.kh.pet.shop.model.vo.KakaoPayReadyVO;
import com.kh.pet.shop.model.vo.KakaoPayVo;
import com.kh.pet.shop.model.vo.Order;

import lombok.RequiredArgsConstructor;
import lombok.extern.java.Log;



@Service
@CrossOrigin("*")
@Transactional
@RequiredArgsConstructor
@Log
public class KakaoPayServiceImpl implements KakaoPayService {

	private static final String Host = "https://open-api.kakaopay.com/online/v1/payment/ready";
    private static final String Host2 = "https://open-api.kakaopay.com/online/v1/payment/approve";
    private static final String SECRET_KEY = "DEVDF135E73B347847ECC5A40D7DA0FFFA13D105";
	private KakaoPayReadyVO kakaoPayReadyVO;
	
	private String memberId = "";
	private String orderId = "";
	
	@Override
	public String kakaoPayReady(int price, String itemName, Order newOrder) {
		
		
		RestTemplate restTemplate = new RestTemplate();
        
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "SECRET_KEY " + SECRET_KEY);
		headers.add("Content-type", "application/json");
		Map<String, String> params = new HashMap();
		memberId = String.valueOf(newOrder.getMember().getMemberId());
		orderId = String.valueOf(newOrder.getOrderNo());
		params.put("cid", "TC0ONETIME");
		params.put("partner_order_id", orderId);
		params.put("partner_user_id", memberId);
		params.put("item_name", itemName);
		params.put("quantity", "1");
		params.put("total_amount", String.valueOf(price));
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
    	 log.info(""+ kakaoPayReadyVO);

         HttpHeaders headers = new HttpHeaders();
         headers.add("Authorization", "SECRET_KEY " + SECRET_KEY); // 어드민 키
         headers.add("Content-type", "application/json;charset=UTF-8");

         Map<String, String> params = new HashMap<String, String>();
         params.put("cid", "TC0ONETIME");
         params.put("tid", kakaoPayReadyVO.getTid());
         params.put("partner_order_id", orderId);
         params.put("partner_user_id", memberId);
         params.put("pg_token", pg_token);

         HttpEntity<Map<String, String>> body = new HttpEntity<Map<String, String>>(params, headers);
         try {
        	 kakaopayVo = restTemplate.postForObject(new URI(Host2), body, KakaoPayVo.class);
            
         } catch (RestClientException e) {
             e.printStackTrace();
         } catch (URISyntaxException e) {
             e.printStackTrace();
         }
         return kakaopayVo;
    }



	

}
