package com.kh.pet.community.model.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.kh.pet.info.model.vo.Info;

public interface CommunityService {
	
	int selectListCount(HashMap<String, String> commMap);
	List<Info> selectForwardCount(HashMap<String, String> commMap, RowBounds rowBounds);
	
	int updateBoardCount(int boardNo);
	List<Info> selectCommunityList(List<Info> list);
	
	int likeCheck(HashMap<String, Integer> map);
	
}
