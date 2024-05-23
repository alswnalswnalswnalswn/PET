package com.kh.pet.info.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.pet.common.model.vo.Attachment;
import com.kh.pet.info.model.vo.Info;

@Repository
public class InfoRepository {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("infoMapper.selectListCount");
	}

	public Info selectInfoByBoardNo(SqlSessionTemplate sqlSession, Integer boardNo) {
		return null;
	}

	public List<Integer> selectBoardNoList(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return null;
	}

	public List<Attachment> selectAttNoListByBoardNo(SqlSessionTemplate sqlSession, Integer boardNo) {
		return null;
	}

}
