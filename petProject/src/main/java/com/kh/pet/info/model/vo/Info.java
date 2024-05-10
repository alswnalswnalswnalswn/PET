package com.kh.pet.info.model.vo;

import java.util.Date;

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
	private Date createDate;
	private int memberNo;
	private String categoryCode;
	private Date updateDate;
	private String boardStatus;

}
