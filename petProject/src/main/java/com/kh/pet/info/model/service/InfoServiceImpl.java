package com.kh.pet.info.model.service;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pet.common.model.vo.Attachment;
import com.kh.pet.info.model.dao.InfoRepository;
import com.kh.pet.info.model.vo.Info;

@Service
public class InfoServiceImpl implements InfoService {

	@Autowired
	private InfoRepository infoRepository;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectListCount() {
		return infoRepository.selectListCount(sqlSession);
	}

	public Info selectInfoByBoardNo(Integer boardNo) {
		return infoRepository.selectInfoByBoardNo(sqlSession, boardNo);
	}

	public List<Integer> selectBoardNoList(HashMap<String, Object> map) {
		return infoRepository.selectBoardNoList(sqlSession, map);
	}

	public List<Attachment> selectAttNoListByBoardNo(Integer boardNo) {
		return infoRepository.selectAttNoListByBoardNo(sqlSession, boardNo);
	}


	
}
