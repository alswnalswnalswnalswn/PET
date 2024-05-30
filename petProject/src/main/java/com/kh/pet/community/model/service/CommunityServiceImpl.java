package com.kh.pet.community.model.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.pet.common.model.vo.Animal;
import com.kh.pet.common.model.vo.Attachment;
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

	// aop 개념
	@Override
	@Transactional 
	public int insertCommunity(Info info) {
		
		// 필수
		int result1 = communityMapper.insertCommunity(info);
		
		// 필수
		int result2 = communityMapper.insertBoardAnimal(info.getAnimalCode());
		
		// 선택
		int result3 = 1;
		if(info.getAttachmentList() != null) {
			result3 = communityMapper.insertAttachment(info.getAttachmentList());
		}
		
		// select문 sql 하나 새로 만들어서 방금 들어간게 추가 된건가? 확인하라고?
		
		
		
		return result1 * result2 * result3;
	};
	




	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
