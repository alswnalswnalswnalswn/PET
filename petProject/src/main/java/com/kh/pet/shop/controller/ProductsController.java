package com.kh.pet.shop.controller;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.pet.common.model.vo.PageInfo;
import com.kh.pet.common.template.Pagination;
import com.kh.pet.shop.model.service.ProductService;
import com.kh.pet.shop.model.vo.Product;

@RestController
@RequestMapping("products")
public class ProductsController {
	
	@Autowired
	ProductService productService;
	
	@GetMapping("/{page}/{category}/{animal}")
	public List<Product> selectAll(@PathVariable int page,
            					   @PathVariable String category,
            					   @PathVariable String animal){
		HashMap<String, String> map = new HashMap();
		
		map.put("category", category);
		map.put("animal", animal);

		PageInfo pi = Pagination.getPageInfo(productService.selectListCount(map), page, 15, 10);

		RowBounds rowBounds = new RowBounds(
				(pi.getCurrentPage() - 1) * pi.getBoardLimit(),
				pi.getBoardLimit()
				);
		List<Product> list = productService.selectCount(map,rowBounds);
		
		
		List<Product> productList = productService.selectAll(list);
		
		System.out.println(productList);
		
		for(Product product : productList) {
			product.setPageInfo(pi);
		}

		return productList;
	}

}
