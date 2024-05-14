package com.kh.pet.date.model.service;

import com.kh.pet.info.model.vo.Info;
import com.kh.pet.info.model.vo.Reply;

public interface DateService {


	Info selectDate(int placeNo);

	int insertReply(Reply reply);

}
