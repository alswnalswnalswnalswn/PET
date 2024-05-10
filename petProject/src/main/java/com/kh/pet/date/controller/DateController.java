package com.kh.pet.date.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.pet.date.model.service.DateService;
import com.kh.pet.place.model.vo.Place;

@RestController
@RequestMapping("date")
public class DateController {

	@Autowired
	DateService dateService;
	
	@GetMapping("/{placeNo}")
	public Place selectDate(@PathVariable("placeNo")int placeNo) {
		
		Place place = dateService.selectDate(placeNo);
		
		return place;
	}
}
