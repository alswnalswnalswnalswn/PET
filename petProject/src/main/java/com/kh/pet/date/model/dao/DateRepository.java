package com.kh.pet.date.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.pet.info.model.vo.Comment;
import com.kh.pet.info.model.vo.Info;
import com.kh.pet.info.model.vo.Reply;
import com.kh.pet.place.model.vo.Place;

@Repository
public class DateRepository {

	public Info selectDate(SqlSessionTemplate sqlSession, int placeNo) {
		return sqlSession.selectOne("infoMapper.selectDate",placeNo);
	}

	public int insertReply(SqlSessionTemplate sqlSession, Reply reply) {
		return sqlSession.insert("infoMapper.inserReply",reply);
	}

	public int insertComment(SqlSessionTemplate sqlSession, Comment comment) {
		return sqlSession.insert("infoMapper.insertComment",comment);
	}

}
