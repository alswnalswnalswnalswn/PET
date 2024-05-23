package com.kh.pet.info.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.pet.common.model.vo.Attachment;
import com.kh.pet.info.model.dao.InfoMapper;
import com.kh.pet.info.model.vo.Info;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class InfoServiceImpl implements InfoService {

	private final InfoMapper infoMapper;
	
	@Override
	public int selectListCount() {
		return infoMapper.selectListCount();
	}

	public Info selectInfoByBoardNo(Integer boardNo) {
		return infoMapper.selectInfoByBoardNo(boardNo);
	}

	public List<Integer> selectBoardNoList(HashMap<String, Object> map) {
		return infoMapper.selectBoardNoList(map);
	}

	public List<Attachment> selectAttNoListByBoardNo(Integer boardNo) {
		return infoMapper.selectAttNoListByBoardNo(boardNo);
	}


	
}
