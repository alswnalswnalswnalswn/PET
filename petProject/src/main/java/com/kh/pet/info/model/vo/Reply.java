package com.kh.pet.info.model.vo;

import java.time.LocalDateTime;
import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class Reply {
	private int replyNo;
	private int memberNo;
	private String replyWriter;
	private int boardNo;
	private String replyContent;
	private LocalDateTime createDate;
	private LocalDateTime updateDate;
	private String replyStatus;
	private int commentNo;
	private String commentWriter;
	private String commentContent;
	private LocalDateTime comCreateDate;

	private List<Comment> commentList;
	
}
