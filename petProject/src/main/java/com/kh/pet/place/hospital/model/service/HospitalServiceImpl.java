package com.kh.pet.place.hospital.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pet.place.hospital.model.dao.HospitalRepository;
import com.kh.pet.place.model.vo.Place;

@Service
public class HospitalServiceImpl implements HospitalService {
	
	@Autowired
	private HospitalRepository hospitalRepository;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	
	
	@Override
	public List<Place> selectHospital() {
		return hospitalRepository.selectHospital(sqlSession);
	}
	

}
