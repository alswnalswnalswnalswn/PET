package com.kh.pet.info.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kh.pet.common.model.vo.Attachment;
import com.kh.pet.info.model.vo.Info;

@Mapper
public interface InfoMapper {
	
	int selectListCount();
	
	Info selectInfoByBoardNo(Integer boardNo);
	
	List<Integer> selectBoardNoList(HashMap<String, Object> map);
	
	List<Attachment> selectAttNoListByBoardNo(Integer boardNo);

}
