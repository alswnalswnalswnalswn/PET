package com.kh.pet.date.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.pet.date.model.service.DateService;
import com.kh.pet.info.model.vo.Info;

@RestController
@RequestMapping("date")
public class DateController {

	@Autowired
	DateService dateService;
	
	@GetMapping("/{placeNo}")
	public Info selectDate(@PathVariable("placeNo")int placeNo) {
		
		Info dateInfo = dateService.selectDate(placeNo);
		
		return dateInfo;
	}
}
