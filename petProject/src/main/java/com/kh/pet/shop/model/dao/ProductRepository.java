package com.kh.pet.shop.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.pet.shop.model.vo.Product;

@Repository
public class ProductRepository {

	public int selectListCount(SqlSessionTemplate sqlSession, String category) {
		return sqlSession.selectOne("shopMapper.selectListCount",category);
	}

	public List<Product> selectAll(SqlSessionTemplate sqlSession, String category, RowBounds rowBounds) {
		return sqlSession.selectList("shopMapper.selectAll",category,rowBounds);
	}

}
