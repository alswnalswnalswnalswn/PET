package com.kh.pet.info.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.pet.info.model.vo.Info;

@Repository
public class InfoRepository {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("infoMapper.selectListCount");
	}
	
	public List<Info> selectInfo(SqlSessionTemplate sqlSession, HashMap<String, Object> map, RowBounds rowBounds) {
		return sqlSession.selectList("infoMapper.selectInfo", map, rowBounds);
	}

	public List<Info> selectInfoList(List<Info> list, SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("infoMapper.selectInfoList", list);
	}

}
