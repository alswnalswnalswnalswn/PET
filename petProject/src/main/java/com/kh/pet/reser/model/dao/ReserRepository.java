package com.kh.pet.reser.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.pet.place.model.vo.Place;

@Repository
public class ReserRepository{

	public List<Place> selectHospital(SqlSessionTemplate sqlSession){
		return sqlSession.selectList("placeMapper.selectHospital");
	}
	
	public List<Place> searchPlace(SqlSessionTemplate sqlSession, HashMap<String, String> map){
		return sqlSession.selectList("placeMapper.searchPlace", map);
	}
	
	
	
	
}