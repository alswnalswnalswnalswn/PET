package com.kh.pet.info.model.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.kh.pet.common.model.vo.Attachment;
import com.kh.pet.info.model.vo.Comment;
import com.kh.pet.info.model.vo.Info;
import com.kh.pet.info.model.vo.Reply;

public interface InfoService {
	
	int selectListCount(String animal);
	
	Info selectInfoByBoardNo(Integer boardNo);

	List<Integer> selectBoardNoList(String animal, RowBounds rowBounds);
	
	List<Attachment> selectAttNoListByBoardNo(Integer boardNo);

	Info infoDetail(int boardNo);

	int selectReplyListCount(int boardNo);

	List<Reply> selectReplyNoList(int boardNo, RowBounds rowBounds);

	List<Reply> selectCommentList(int replyNo);

	int insertLike(HashMap<Object, Object> map);

	int selectLike(int boardNo);

	int deleteLike(HashMap<Object, Object> map);

	List<Reply> selectReply(int boardNo);

}
