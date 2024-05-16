package com.kh.pet.date.controller;

import java.text.ParseException;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.pet.date.model.service.DateService;
import com.kh.pet.info.model.vo.Comment;
import com.kh.pet.info.model.vo.Info;
import com.kh.pet.info.model.vo.Reply;

@RestController
@RequestMapping("info/date")
public class DateController {

	@Autowired
	DateService dateService;
	
	@GetMapping("/{placeNo}")
	public Info selectDate(@PathVariable("placeNo")int placeNo) throws ParseException {
		
		Info dateInfo = dateService.selectDate(placeNo);
		return dateInfo;
	}
	
	
	@PostMapping("reply")
	public String insertReply(Reply reply) {
		return dateService.insertReply(reply) > 0 ? "Y" : "N";
	}
	
	@PostMapping("comment")
	public String insertComment(Comment comment) {
		return dateService.insertComment(comment) > 0 ? "Y" : "N";
	}
	
	@PutMapping
	public String updateRepCom(String type, String number, String content) {
		
		HashMap<String,String> map = new HashMap();
		
		map.put("type", type);
		
		map.put("number", number);
		
		map.put("content", content);
		
		
		
		return dateService.updateRepCom(map) > 0 ? "Y" : "N";
	}
	
}
