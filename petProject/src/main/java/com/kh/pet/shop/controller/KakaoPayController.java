package com.kh.pet.shop.controller;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pet.member.model.vo.Member;
import com.kh.pet.shop.model.service.KakaoPayService;
import com.kh.pet.shop.model.service.ProductService;
import com.kh.pet.shop.model.vo.KakaoPayVo;
import com.kh.pet.shop.model.vo.Order;
import com.kh.pet.shop.model.vo.ProductOption;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/kakaopay")
@RequiredArgsConstructor
public class KakaoPayController {
	
	private final KakaoPayService kakaoService;
	
	
	private final ProductService productService;
	
	private KakaoPayVo kakaopayVo;
	
	@PostMapping
	@ResponseBody
	public String kakaopay(@RequestBody List<Map<String, Object>> data,HttpSession session) {
		
		
		List<ProductOption> optionList = new ArrayList();
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		int price = 0;
		String itemName = "";
		for (Map<String, Object> item : data) {
	        ProductOption option = new ProductOption();
	        option.setOptionNo(Integer.parseInt(String.valueOf(item.get("optionNo"))));
	        option.setProductAmount(Integer.parseInt(String.valueOf(item.get("productAmount"))));
	        
	        price += Integer.parseInt(String.valueOf(item.get("price")));
	        
	        itemName = String.valueOf(item.get("productName"));
	        optionList.add(option);
	    }
		
		Order order = new Order();
		
		Order newOrder = new Order();
		order.setMember(loginUser);
		order.setOptionList(optionList);
		
		if(productService.insertOrder(order) > 0) {
			newOrder = productService.selectNowOrder();
			newOrder.setMember(loginUser);
		} else {
			
		}
		
		
		return kakaoService.kakaoPayReady(price,itemName,newOrder);
	}
	

	
	@GetMapping("success")
	public String kakaopaySuccess(@RequestParam("pg_token")String pg_token){
		Order order = productService.selectNowOrder();
		int result = productService.updateOrder(order.getOrderNo());
		
		if(result > 0) {
			kakaopayVo = kakaoService.kakaopayVo(pg_token);
			return "shop/paymentPage";
		}
		return "";
		
		
		
		
	}
	
	@GetMapping("result")
	public ModelAndView kakaopayResult(HttpSession session,ModelAndView mv) {
		
		Order order = productService.selectNowOrder();
		
		mv.addObject("order",order).setViewName("shop/orderResult");
		
		
		return mv;
	}

}
