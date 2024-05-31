package com.kh.pet.community.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.pet.common.model.vo.Animal;
import com.kh.pet.common.model.vo.Attachment;
import com.kh.pet.info.model.vo.Info;

import lombok.RequiredArgsConstructor;

@Mapper
public interface CommunityMapper {
	
	int selectListCount(HashMap<String, String> commMap);
	List<Info> selectForwardCount(HashMap<String, String> commMap, RowBounds rowBounds);
	List<Info> selectCommunityList(List<Info> list);
	
	int updateBoardCount(int boardNo);

	int likeCheck(HashMap<String, Integer> map);
	int selectLike(int boardNo);
	int addLike(HashMap<String, Integer> map);
	int deleteLike(HashMap<String, Integer> map);
	
	int insertCommunity(Info info);
	int insertBoardAnimal(List<Animal> animalList);
	int insertAttachment(List<Attachment> attachmentList);
	
	

}
