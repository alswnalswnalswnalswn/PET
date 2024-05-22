package com.kh.pet.info.model.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

	@Override
	public List<Info> selectInfo(HashMap<String, Object> map, RowBounds rowBounds) {
		return infoRepository.selectInfo(sqlSession, map, rowBounds);
	}

	@Override
	public List<Info> selectInfoList(List<Info> list) {
		return infoRepository.selectInfoList(list, sqlSession);
	}

	
}
