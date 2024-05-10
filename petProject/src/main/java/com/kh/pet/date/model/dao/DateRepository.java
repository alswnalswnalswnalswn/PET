package com.kh.pet.date.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.pet.place.model.vo.Place;

@Repository
public class DateRepository {

	public Place selectDate(SqlSessionTemplate sqlSession, int placeNo) {
		return sqlSession.selectOne("infoMapper.selectDate",placeNo);
	}

}
