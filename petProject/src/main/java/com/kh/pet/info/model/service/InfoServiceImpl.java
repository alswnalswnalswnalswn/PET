package com.kh.pet.info.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import com.kh.pet.common.model.vo.Attachment;
import com.kh.pet.info.model.dao.InfoMapper;
import com.kh.pet.info.model.vo.Info;
import com.kh.pet.info.model.vo.Reply;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class InfoServiceImpl implements InfoService {

	private final InfoMapper infoMapper;
	
	public int selectListCount(String animal) {
		return infoMapper.selectListCount(animal);
	}

	public Info selectInfoByBoardNo(Integer boardNo) {
		return infoMapper.selectInfoByBoardNo(boardNo);
	}
	
	public List<Attachment> selectAttNoListByBoardNo(Integer boardNo) {
		return infoMapper.selectAttNoListByBoardNo(boardNo);
	}

	@Override
	public List<Integer> selectBoardNoList(String animal, RowBounds rowBounds) {
		return infoMapper.selectBoardNoList(animal, rowBounds);
	}

	@Override
	public Info infoDetail(int boardNo) {
		return infoMapper.infoDetail(boardNo);
	}

	@Override
	public int selectReplyListCount(int boardNo) {
		return infoMapper.selectReplyListCount(boardNo);
	}

	@Override
	public List<Integer> selectReplyNoList(int boardNo, RowBounds rowBounds) {
		return infoMapper.selectReplyNoList(boardNo, rowBounds);
	}

	@Override
	public List<Reply> selectCommentNoList(int replyNo) {
		return infoMapper.selectCommentNoList(replyNo);
	}


	
}
