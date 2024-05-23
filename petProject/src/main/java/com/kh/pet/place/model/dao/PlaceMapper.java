package com.kh.pet.place.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kh.pet.place.model.vo.Place;

@Mapper
public interface PlaceMapper {

	List<Place> searchPlace(HashMap<String, String> map);

	Place selectPlace(int placeNo);
	
}
