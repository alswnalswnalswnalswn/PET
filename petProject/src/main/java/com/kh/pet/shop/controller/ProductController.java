package com.kh.pet.shop.controller;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
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
public class ProductController {

	ProductService productService;
	
	@GetMapping()
	public List<Product> selectAll(@PathVariable(required = false)int page,
								   @PathVariable(required = false)String category){
		
		PageInfo pi = Pagination.getPageInfo(productService.selectListCount(category), page, 10, 10);
		
		RowBounds rowBounds = new RowBounds(
				(pi.getCurrentPage() - 1) * pi.getBoardLimit(),
				pi.getBoardLimit()
				);
		List<Product> productList = productService.selectAll(category,rowBounds);
				
		for(Product product : productList) {
			product.setPageInfo(pi);
		}
		
		return productList;
	}

}
