package com.kh.pet.place.model.service;

import java.util.HashMap;
import java.util.List;

import com.kh.pet.place.model.vo.Place;

public interface PlaceService {
	
	List<Place> selectHospital();
	
	List<Place> searchPlace(HashMap<String, String> map);
	
	
	
	
	
	
	
	
	
}
