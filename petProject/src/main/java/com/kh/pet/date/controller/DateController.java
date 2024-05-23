package com.kh.pet.date.controller;

import java.text.ParseException;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.pet.date.model.service.DateService;
import com.kh.pet.info.model.vo.Comment;
import com.kh.pet.info.model.vo.Info;
import com.kh.pet.info.model.vo.Reply;
import com.kh.pet.member.model.vo.Member;
import com.kh.pet.place.model.service.PlaceService;

import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;


@RestController
@RequestMapping("info/date")
@RequiredArgsConstructor
public class DateController {


	private final DateService dateService;
	
	@GetMapping("/{placeNo}")
	public Info selectDate(@PathVariable("placeNo")int placeNo, HttpSession session) throws ParseException {
	
		HashMap<String, Integer> map = new HashMap();
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		int likeCheck = 0;
		
		if(loginUser != null) {
			map.put("loginUser", loginUser.getMemberNo());
			map.put("placeNo",placeNo);
			likeCheck = dateService.likeCheck(map);
			
		}
		
		dateService.updateCount(placeNo);
		
		Info dateInfo = dateService.selectDate(placeNo);
		
		dateInfo.setLikeCheck(likeCheck);
		
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
	
	@PostMapping
	public String updateRepCom(@RequestParam("type") String type,@RequestParam("number") String number,@RequestParam("content") String content) {
		
		HashMap<String,String> map = new HashMap();
		System.out.println(type+number+content);
		
		map.put("type", type);
		
		map.put("number", number);
		
		map.put("content", content);
		
		
		
		return dateService.updateRepCom(map) > 0 ? "Y" : "N";
	}


	@PostMapping("like")
	public String insertLike(int boardNo,int memberNo) {
		HashMap<String,Integer> map = new HashMap();
		
		map.put("boardNo", boardNo);
		map.put("memberNo",memberNo);
		
		
		return dateService.insertLike(map) > 0 ? "Y" : "N";
	}
	


	@DeleteMapping("like")
	public String deleteLike(@RequestBody String obj) {
		
		JsonObject jsonObject = JsonParser.parseString(obj).getAsJsonObject();
		
		
		int boardNum = jsonObject.get("boardNum").getAsInt();
	    int memberNo = jsonObject.get("memberNo").getAsInt();	

		HashMap<String,Integer> map = new HashMap();
		
		map.put("boardNo", boardNum);
		map.put("memberNo",memberNo);

		return dateService.deleteLike(map) > 0 ? "Y" : "N";
	}
}
