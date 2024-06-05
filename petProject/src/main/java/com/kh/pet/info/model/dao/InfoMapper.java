package com.kh.pet.info.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.pet.common.model.vo.Alert;
import com.kh.pet.common.model.vo.Attachment;
import com.kh.pet.info.model.vo.Comment;
import com.kh.pet.info.model.vo.Info;
import com.kh.pet.info.model.vo.Reply;

@Mapper
public interface InfoMapper {
	
	int selectListCount(String animal);
	
	Info selectInfoByBoardNo(HashMap<Object, Object> map);
	
	List<Integer> selectBoardNoList(String animal, RowBounds rowBounds);
	
	List<Attachment> selectAttNoListByBoardNo(int boardNo);

	Info infoDetail(int boardNo);

	int selectReplyListCount(int boardNo);

	List<Reply> selectReplyNoList(int boardNo, RowBounds rowBounds);

	List<Reply> selectCommentList(int replyNo);

	int insertLike(HashMap<Object, Object> map);

	int selectLike(int boardNo);

	int deleteLike(HashMap<Object, Object> map);

	List<Reply> selectReply(int boardNo);

	void selectInfoCount(int boardNo);

	int insertComment(Comment comment);

	List<Comment> selectComment(int replyNo);

	int insertAlert(Alert alert);

	int likeCheckInfo(HashMap<Object, Object> map);


}
