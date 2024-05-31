package com.kh.pet.shop.model.service;

import java.util.List;
import java.util.Map;

import com.kh.pet.shop.model.vo.KakaoPayVo;
import com.kh.pet.shop.model.vo.Order;

public interface KakaoPayService {
	String kakaoPayReady(int price, String itemName, Order newOrder);
	
	KakaoPayVo kakaopayVo(String pg_token);

	
}
