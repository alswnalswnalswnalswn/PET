package com.kh.pet.reser.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.pet.place.model.vo.Place;
import com.kh.pet.reser.model.service.ReserService;

@Controller
public class ReserController {
	
	
	@Autowired
	private ReserService reserService;
	
	@GetMapping("deleteLater")
	public String aasdasd() {
		return "hospital/deleteLaterFolder/deleteLater";
	}
	
	@GetMapping("hospital")
	public String hospitalForwarding() {
		return "hospital/hospitalMain";
	}
	
	@GetMapping("reservation")
	public String reservation() {
		return "";
	}
	

}
