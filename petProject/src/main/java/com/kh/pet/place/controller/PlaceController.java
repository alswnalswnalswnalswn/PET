package com.kh.pet.place.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kh.pet.place.model.service.PlaceService;
import com.kh.pet.place.model.vo.Place;

@RestController
@RequestMapping(value="places")
public class PlaceController {
	
	@Autowired
	private PlaceService reserService;
	
	@ResponseBody
	@GetMapping("/{categoryCode}/{neLat}/{neLng}/{swLat}/{swLng}")
	public List<Place> searchPlace(@PathVariable("categoryCode")String categoryCode, 
			@PathVariable("neLat") String neLat, 
			@PathVariable("neLng") String neLng, 
			@PathVariable("swLat") String swLat, 
			@PathVariable("swLng") String swLng) {
		
		HashMap<String, String> map = new HashMap();
		
		map.put("categoryCode", categoryCode);
		map.put("neLat", neLat);
		map.put("neLng", neLng);
		map.put("swLat", swLat);
		map.put("swLng", swLng);
		
		List<Place> list = reserService.searchPlace(map);
		
		return list;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
