package com.kh.pet.info.model.vo;


import java.time.LocalDateTime;
import java.util.List;

import com.kh.pet.common.model.vo.Attachment;
import com.kh.pet.common.model.vo.PageInfo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class Info {
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private int boardCount;
	private LocalDateTime  createDate;
	private String memberNo;
	private String categoryCode;
	private LocalDateTime  updateDate;
	private String boardStatus;
	
	private int boardLike;
	
	private int sumCount;
	
	private List<Attachment> attachmentList;
	
	private List<Reply> replyList;
	
	private PageInfo pageInfo;

	
	
}
