package com.kh.pet.date.model.service;

import java.util.HashMap;

import com.kh.pet.info.model.vo.Comment;
import com.kh.pet.info.model.vo.Info;
import com.kh.pet.info.model.vo.Reply;

public interface DateService {


	Info selectDate(int placeNo);

	int insertReply(Reply reply);

	int insertComment(Comment comment);

	int updateRepCom(HashMap<String, String> map);

}
