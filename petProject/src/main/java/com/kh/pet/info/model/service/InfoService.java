package com.kh.pet.info.model.service;

import java.util.HashMap;
import java.util.List;

import com.kh.pet.common.model.vo.Attachment;
import com.kh.pet.info.model.vo.Info;

public interface InfoService {
	
	int selectListCount();
	
	Info selectInfoByBoardNo(Integer boardNo);
	
	List<Integer> selectBoardNoList(HashMap<String, Object> map);
	
	List<Attachment> selectAttNoListByBoardNo(Integer boardNo);
}
