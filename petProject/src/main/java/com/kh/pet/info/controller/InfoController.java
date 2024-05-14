package com.kh.pet.info.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("info")
public class InfoController {

	@GetMapping("date")
	public ModelAndView selectAll(ModelAndView mv) {
		mv.setViewName("info/dateList");
		return mv;
	}

	
}
