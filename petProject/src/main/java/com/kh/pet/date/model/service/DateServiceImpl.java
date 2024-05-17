package com.kh.pet.date.model.service;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pet.date.model.dao.DateRepository;
import com.kh.pet.info.model.vo.Comment;
import com.kh.pet.info.model.vo.Info;
import com.kh.pet.info.model.vo.Reply;
import com.kh.pet.place.model.vo.Place;

@Service
public class DateServiceImpl implements DateService {

	@Autowired
	private DateRepository dateRepository;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	@Override
	public int updateCount(int placeNo) {
		return dateRepository.updateCount(sqlSession,placeNo);
	}
	
	@Override
	public Info selectDate(int placeNo) {
		return dateRepository.selectDate(sqlSession,placeNo);
	}

	@Override
	public int insertReply(Reply reply) {
		return dateRepository.insertReply(sqlSession,reply);
	}

	@Override
	public int insertComment(Comment comment) {
		return dateRepository.insertComment(sqlSession,comment);
	}

	@Override
	public int updateRepCom(HashMap<String, String> map) {
		return dateRepository.updateRepCom(sqlSession,map);
	}

	
	

}
