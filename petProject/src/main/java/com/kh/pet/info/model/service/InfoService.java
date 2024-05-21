package com.kh.pet.info.model.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.kh.pet.info.model.vo.Info;

public interface InfoService {
	
	int selectListCount();
	
	List<Info> selectInfo(HashMap<String, Object> map, RowBounds rowBounds);

	List<Info> selectInfoList(List<Info> list);
	
	
}
