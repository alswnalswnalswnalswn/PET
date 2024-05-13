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
	private String replyWriter;
	private int boardNo;
	private String replyContent;
	private LocalDateTime createDate;
	private LocalDateTime updateDate;
	private String replyStatus;

	private List<Comment> commentList;
	
}
