package com.kh.pet.place.model.service;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pet.place.model.dao.PlaceRepository;
import com.kh.pet.place.model.vo.Place;

@Service
public class PlaceServiceImpl implements PlaceService {
	
	@Autowired
	private PlaceRepository placeRepository;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Place> selectHospital() {
		return placeRepository.selectHospital(sqlSession);
	}

	@Override
	public List<Place> searchPlace(HashMap<String, String> map) {
		return placeRepository.searchPlace(sqlSession, map);
	}

	

}
