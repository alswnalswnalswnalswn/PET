package com.kh.pet.shop.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.pet.shop.model.vo.Product;

@Repository
public class ProductRepository {

	public int selectListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("shopMapper.selectListCount",map);
	}

	public List<Product> selectAll(SqlSessionTemplate sqlSession, HashMap<String, String> map, RowBounds rowBounds) {
		return sqlSession.selectList("shopMapper.selectAll",map,rowBounds);
	}

}
