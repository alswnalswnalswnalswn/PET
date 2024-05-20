package com.kh.pet.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pet.shop.model.service.ProductService;

@Controller
@RequestMapping("product")
public class ProductController {

	
	@Autowired
	ProductService productService;
	
	@GetMapping("/{productNo}")
	public ModelAndView selectOne(@PathVariable int productNo,ModelAndView mv){
		
		mv.addObject("product", productService.selectOne(productNo)).setViewName("shop/productDetail");;
		
		
			
		return mv;
	}
}
