package com.kh.pet.shop.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.pet.shop.model.vo.Product;
import com.kh.pet.shop.model.vo.ProductColor;
import com.kh.pet.shop.model.vo.ProductOption;

@Mapper
public interface ProductMapper {

	int selectListCount(HashMap<String, String> map);

	Product selectOne(int productNo);

	List<Product> selectCount(HashMap<String, String> map, RowBounds rowBounds);

	List<Product> selectAll(List<Product> list);

	List<ProductColor> selectColor(int productNo);

	List<ProductOption> selectSize(HashMap<String, String> map);



}
