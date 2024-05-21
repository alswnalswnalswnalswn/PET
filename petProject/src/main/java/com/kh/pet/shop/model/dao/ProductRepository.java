package com.kh.pet.shop.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.pet.shop.model.vo.Product;
import com.kh.pet.shop.model.vo.ProductColor;
import com.kh.pet.shop.model.vo.ProductOption;

@Repository
public class ProductRepository {

	public int selectListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("shopMapper.selectListCount",map);
	}

	public Product selectOne(SqlSessionTemplate sqlSession, int productNo) {
		return sqlSession.selectOne("shopMapper.selectOne",productNo);
	}

	public List<Product> selectCount(SqlSessionTemplate sqlSession, HashMap<String, String> map, RowBounds rowBounds) {
		return sqlSession.selectList("shopMapper.selectCount",map,rowBounds);
	}

	public List<Product> selectAll(SqlSessionTemplate sqlSession, List<Product> list) {
		return sqlSession.selectList("shopMapper.selectAll",list);
	}

	public List<ProductColor> selectColor(SqlSessionTemplate sqlSession, int productNo) {
		return sqlSession.selectList("shopMapper.selectColor",productNo);
	}

	public List<ProductOption> selectSize(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectList("shopMapper.selectSize",map);
	}

}
