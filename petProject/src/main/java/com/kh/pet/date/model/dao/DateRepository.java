package com.kh.pet.date.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.pet.info.model.vo.Comment;
import com.kh.pet.info.model.vo.Info;
import com.kh.pet.info.model.vo.Reply;
import com.kh.pet.place.model.vo.Place;

@Repository
public class DateRepository {

	public int updateCount(SqlSessionTemplate sqlSession, int placeNo) {
		return sqlSession.update("infoMapper.updateCount",placeNo);
	}
	public int likeCheck(SqlSessionTemplate sqlSession, HashMap<String, Integer> map) {
		return sqlSession.selectOne("infoMapper.likeCheck",map);
	}
	public Info selectDate(SqlSessionTemplate sqlSession, int placeNo) {
		return sqlSession.selectOne("infoMapper.selectDate",placeNo);
	}

	public int insertReply(SqlSessionTemplate sqlSession, Reply reply) {
		return sqlSession.insert("infoMapper.inserReply",reply);
	}

	public int insertComment(SqlSessionTemplate sqlSession, Comment comment) {
		return sqlSession.insert("infoMapper.insertComment",comment);
	}

	public int updateRepCom(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.update("infoMapper.updateRepCom",map); 
	}
	public int insertLike(SqlSessionTemplate sqlSession, HashMap<String, Integer> map) {
		return sqlSession.insert("infoMapper.insertLike",map);
	}
	public int deleteLike(SqlSessionTemplate sqlSession, HashMap<String, Integer> map) {
		return sqlSession.delete("infoMapper.deleteLike",map);
	}


}
