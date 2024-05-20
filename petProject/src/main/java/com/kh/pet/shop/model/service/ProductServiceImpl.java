package com.kh.pet.shop.model.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pet.shop.model.dao.ProductRepository;
import com.kh.pet.shop.model.vo.Product;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductRepository productRepository;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectListCount(HashMap<String, String> map) {
		
		return productRepository.selectListCount(sqlSession,map);
	}

	@Override
	public Product selectOne(int productNo) {
		return productRepository.selectOne(sqlSession,productNo);
	}

	@Override
	public List<Product> selectCount(HashMap<String, String> map, RowBounds rowBounds) {
		return productRepository.selectCount(sqlSession,map,rowBounds);
	}

	@Override
	public List<Product> selectAll(List<Product> list) {
		return productRepository.selectAll(sqlSession,list);
	}
	
	
}
