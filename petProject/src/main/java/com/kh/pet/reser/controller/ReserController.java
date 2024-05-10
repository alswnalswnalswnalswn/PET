package com.kh.pet.reser.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.pet.place.model.service.PlaceService;
import com.kh.pet.place.model.vo.Place;

@Controller
public class ReserController {
	
	@Autowired
	private PlaceService reserService;
	
	@GetMapping("hospital")
	public String hospitalForwarding() {
		return "hospital/hospitalMain2";
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
