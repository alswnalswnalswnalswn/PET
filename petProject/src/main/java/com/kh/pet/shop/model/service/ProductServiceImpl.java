package com.kh.pet.shop.model.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import com.kh.pet.shop.model.dao.ProductMapper;
import com.kh.pet.shop.model.vo.Product;
import com.kh.pet.shop.model.vo.ProductColor;
import com.kh.pet.shop.model.vo.ProductOption;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ProductServiceImpl implements ProductService {

	private final ProductMapper productMapper;
	
	@Override
	public int selectListCount(HashMap<String, String> map) {
		
		return productMapper.selectListCount(map);
	}

	@Override
	public Product selectOne(int productNo) {
		return productMapper.selectOne(productNo);
	}

	@Override
	public List<Product> selectCount(HashMap<String, String> map, RowBounds rowBounds) {
		return productMapper.selectCount(map,rowBounds);
	}

	@Override
	public List<Product> selectAll(List<Product> list) {
		return productMapper.selectAll(list);
	}

	@Override
	public List<ProductColor> selectColor(int productNo) {
		return productMapper.selectColor(productNo);
	}

	@Override
	public List<ProductOption> selectSize(HashMap<String, String> map) {
		return productMapper.selectSize(map);
	}
	
	
}
