package com.kh.pet.place.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pet.place.model.service.PlaceService;
import com.kh.pet.place.model.vo.Place;

@Controller
public class PlaceController {
	
	@Autowired
	private PlaceService reserService;
	
	@RequestMapping("hospital")
	public String hospitalForwarding(ModelAndView mv) {
		return "hospital/hospitalMain";
	}
	
	@ResponseBody
	@GetMapping(value="searchPlace")
	public List<Place> searchPlace(String categoryCode, String neLat, String neLng, String swLat, String swLng) {
		
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
