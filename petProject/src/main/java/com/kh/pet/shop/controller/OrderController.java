package com.kh.pet.shop.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pet.shop.model.vo.ProductOption;

@RestController
@RequestMapping("product/order")
public class OrderController {
	
	@PostMapping()
	public Map<String, String> order(@RequestBody List<ProductOption> productOption, HttpSession session) {
		System.out.println(productOption);
		session.setAttribute("productOptions", productOption);
		Map<String, String> response = new HashMap<>();
		response.put("redirectUrl", "/orderConfirmation");
		return response;
	}
	
	@GetMapping()
	public ModelAndView orderPage(ModelAndView mv) {
		mv.setViewName("shop/productOrder");
		return mv;
	}
	
	@GetMapping("payment")
	public ModelAndView paymentPage(ModelAndView mv) {
		mv.setViewName("shop/paymentPage");
		return mv;
	}
}
