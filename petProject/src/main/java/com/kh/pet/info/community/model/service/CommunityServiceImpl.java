package com.kh.pet.info.community.model.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pet.info.community.model.dao.CommunityRepository;
import com.kh.pet.info.model.vo.Info;

@Service
public class CommunityServiceImpl implements CommunityService {
	
	@Autowired
	private CommunityRepository communityRepository;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectListCount(HashMap<String, String> commMap) {
		return communityRepository.selectListCount(sqlSession, commMap);
	}

	@Override
	public List<Info> selectCommunityList(HashMap<String, String> commMap, RowBounds rowBounds) {
		return communityRepository.selectCommunityList(sqlSession, commMap, rowBounds);
	}

	@Override
	public Info communityDetail(int boardNo) {
		return communityRepository.communityDetail(sqlSession, boardNo);
	}


}
