package com.kh.pet.date.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pet.date.model.dao.DateRepository;
import com.kh.pet.place.model.vo.Place;

@Service
public class DateServiceImpl implements DateService {

	@Autowired
	private DateRepository dateRepository;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public Place selectDate(int placeNo) {
		return dateRepository.selectDate(sqlSession,placeNo);
	}
	

}
