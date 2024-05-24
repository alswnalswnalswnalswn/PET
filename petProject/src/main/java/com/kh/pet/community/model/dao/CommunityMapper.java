package com.kh.pet.community.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.pet.info.model.vo.Info;

import lombok.RequiredArgsConstructor;

@Mapper
public interface CommunityMapper {
	
	int selectListCount(HashMap<String, String> commMap);
	List<Info> selectForwardCount(HashMap<String, String> commMap, RowBounds rowBounds);
	List<Info> selectCommunityList(List<Info> list);
	
	int updateBoardCount(int boardNo);
	
	int likeCheck(HashMap<String, Integer> map);
	int insertCommunity(Info info);

}
