package com.kh.pet.shop.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pet.shop.model.service.ProductService;
import com.kh.pet.shop.model.vo.ProductColor;
import com.kh.pet.shop.model.vo.ProductOption;

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
	
	@ResponseBody
	@GetMapping("color/{productNo}")
	public List<ProductColor> selectColor(@PathVariable int productNo){
		
		
		
		return productService.selectColor(productNo);
	}
	
	@ResponseBody
	@GetMapping("size/{productNo}/{colorName}")
	public List<ProductOption> selectSize(@PathVariable String productNo,@PathVariable String colorName){
		
		HashMap<String, String> map = new HashMap();
		
		map.put("productNo",productNo);
		map.put("colorName",colorName);
		
		return productService.selectSize(map);
	}
	

}
