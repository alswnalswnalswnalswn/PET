package com.kh.pet.reser.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pet.reser.model.service.ReserService;

@Controller
public class ReserController {
	
	@Autowired
	private ReserService reserService;
	
	@RequestMapping("hospital")
	public String hospitalForwarding(ModelAndView mv) {
		return "hospital/hospitalMain";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
