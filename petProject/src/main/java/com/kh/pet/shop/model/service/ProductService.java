package com.kh.pet.shop.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.kh.pet.shop.model.vo.Product;

public interface ProductService {

	int selectListCount(String category);

	List<Product> selectAll(String category, RowBounds rowBounds);

}
