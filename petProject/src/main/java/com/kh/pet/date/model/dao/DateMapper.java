package com.kh.pet.date.model.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.kh.pet.info.model.vo.Comment;
import com.kh.pet.info.model.vo.Info;
import com.kh.pet.info.model.vo.Reply;

@Mapper
public interface DateMapper {

	int updateCount(int placeNo);

	Info selectDate(int placeNo);

	int insertReply(Reply reply);

	int insertComment(Comment comment);

	int updateRepCom(HashMap<String, String> map);

	int likeCheck(HashMap<String, Integer> map);

	int insertLike(HashMap<String, Integer> map);

	int deleteLike(HashMap<String, Integer> map);

	int deleteRepCom(HashMap<String, String> map);

}
