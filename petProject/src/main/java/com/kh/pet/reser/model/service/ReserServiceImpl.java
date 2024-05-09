package com.kh.pet.reser.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pet.place.model.vo.Place;
import com.kh.pet.reser.model.dao.ReserRepository;

@Service
public class ReserServiceImpl implements ReserService {
	
	@Autowired
	private ReserRepository reserRepository;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	
	
	@Override
	public List<Place> selectHospital() {
		return reserRepository.selectHospital(sqlSession);
	}
	

}
