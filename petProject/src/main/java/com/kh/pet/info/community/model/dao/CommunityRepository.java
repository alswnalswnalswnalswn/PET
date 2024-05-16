package com.kh.pet.info.community.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.pet.info.model.vo.Info;

@Repository
public class CommunityRepository {
	
	public int selectListCount(SqlSessionTemplate sqlSession, HashMap<String, String> commMap){
		return sqlSession.selectOne("communityMapper.selectListCount", commMap);
	}
	
	public List<Info> selectCommunityList(SqlSessionTemplate sqlSession, HashMap<String, String> commMap, RowBounds rowBounds){
		return sqlSession.selectList("communityMapper.selectCommunityList", commMap, rowBounds);
	}

}
