package com.kh.pet.place.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pet.place.model.dao.PlaceMapper;
import com.kh.pet.place.model.vo.Place;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PlaceServiceImpl implements PlaceService {
	
	private final PlaceMapper placeMapper;


	@Override
	public List<Place> selectHospital() {
		/*return placeRepository.selectHospital(sqlSession);*/
		return null;
	}

	@Override
	public List<Place> searchPlace(HashMap<String, String> map) {
		return placeMapper.searchPlace(map);
	}

	@Override
	public Place selectPlace(int placeNo) {
		return placeMapper.selectPlace(placeNo);
	}

	

}
