package com.kh.pet.info.model.vo;

import java.time.LocalDateTime;

import com.kh.pet.common.model.vo.Attachment;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class Comment {
	private int commentNo;
	private int replyNo;
	private int memberNo;
	private String commentWriter;
	private String commentContent;
	private LocalDateTime createDate;
	private LocalDateTime updateDate;
	private String connentStatus;
	
	

}
