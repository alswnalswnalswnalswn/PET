package com.kh.pet.shop.model.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.kh.pet.shop.model.vo.Order;
import com.kh.pet.shop.model.vo.Product;
import com.kh.pet.shop.model.vo.ProductColor;
import com.kh.pet.shop.model.vo.ProductOption;

public interface ProductService {

	int selectListCount(HashMap<String, String> map);

	Product selectOne(int productNo);

	List<Product> selectCount(HashMap<String, String> map, RowBounds rowBounds);

	List<Product> selectAll(List<Product> list);

	List<ProductColor> selectColor(int productNo);

	List<ProductOption> selectSize(HashMap<String, String> map);

	int insertOrder(Order order);

	Order selectNowOrder();

	int updateOrder(int orderNo);
	
	

}
