package com.kh.pet.place.hospital.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.pet.place.model.vo.Place;

@Repository
public class HospitalRepository{

	public List<Place> selectHospital(SqlSessionTemplate sqlSession){
		return sqlSession.selectList("hospitalMapper.selectHospital");
	}
	
}
