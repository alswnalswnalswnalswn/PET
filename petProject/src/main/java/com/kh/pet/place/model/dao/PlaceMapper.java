package com.kh.pet.place.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.kh.pet.place.model.vo.Place;

@MapperScan
public interface PlaceMapper {

	List<Place> searchPlace(HashMap<String, String> map);

	Place selectPlace(int placeNo);
	
}
