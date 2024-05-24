package com.kh.pet.community.model.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import com.kh.pet.community.model.dao.CommunityMapper;
import com.kh.pet.info.model.vo.Info;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class CommunityServiceImpl implements CommunityService {
	
	private final CommunityMapper communityMapper;

	@Override
	public int selectListCount(HashMap<String, String> commMap) {
		return communityMapper.selectListCount(commMap);
	}

	@Override
	public List<Info> selectForwardCount(HashMap<String, String> commMap, RowBounds rowBounds) {
		return communityMapper.selectForwardCount(commMap, rowBounds);
	}

	@Override
	public List<Info> selectCommunityList(List<Info> list) {
		return communityMapper.selectCommunityList(list);
	}

	@Override
	public int updateBoardCount(int boardNo) {
		return communityMapper.updateBoardCount(boardNo);
	}

	@Override
	public int likeCheck(HashMap<String, Integer> map) {
		return communityMapper.likeCheck(map);
	}

	@Override
	public int insertCommunity(Info info) {
		return communityMapper.insertCommunity(info);
	};
	




	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
