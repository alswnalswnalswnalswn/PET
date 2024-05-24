package com.kh.pet.info.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.kh.pet.common.model.vo.Attachment;
import com.kh.pet.info.model.vo.Info;
import com.kh.pet.info.model.vo.Reply;

public interface InfoService {
	
	int selectListCount(String animal);
	
	Info selectInfoByBoardNo(Integer boardNo);

	List<Integer> selectBoardNoList(String animal, RowBounds rowBounds);
	
	List<Attachment> selectAttNoListByBoardNo(Integer boardNo);

	Info infoDetail(int boardNo);

	int selectReplyListCount(int boardNo);

	List<Integer> selectReplyNoList(int boardNo, RowBounds rowBounds);

	List<Reply> selectCommentNoList(int replyNo);

}
