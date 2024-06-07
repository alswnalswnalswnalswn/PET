package com.kh.pet.date.model.service;

import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.kh.pet.date.model.dao.DateMapper;
import com.kh.pet.info.model.vo.Comment;
import com.kh.pet.info.model.vo.Info;
import com.kh.pet.info.model.vo.Reply;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class DateServiceImpl implements DateService {


	private final DateMapper dateMapper;
	


	@Override
	public int likeCheck(HashMap<String, Integer> map) {
		return dateMapper.likeCheck(map);
	}
	
	@Override
	public int updateCount(int placeNo) {
		return dateMapper.updateCount(placeNo);
	}
	
	@Override
	public Info selectDate(int placeNo) {
		return dateMapper.selectDate(placeNo);
	}

	@Override
	public int insertReply(Reply reply) {
		return dateMapper.insertReply(reply);
	}

	@Override
	public int insertComment(Comment comment) {
		return dateMapper.insertComment(comment);
	}

	@Override
	public int updateRepCom(HashMap<String, String> map) {
		return dateMapper.updateRepCom(map);
	}

	@Override
	public int insertLike(HashMap<String, Integer> map) {
		return dateMapper.insertLike(map);
	}

	@Override
	public int deleteLike(HashMap<String, Integer> map) {
		return dateMapper.deleteLike(map);
	}

	@Override
	public int deleteRepCom(HashMap<String, String> map) {
		return dateMapper.deleteRepCom(map);
	}


	
	

}
