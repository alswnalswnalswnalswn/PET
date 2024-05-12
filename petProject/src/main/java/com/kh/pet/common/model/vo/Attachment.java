package com.kh.pet.common.model.vo;

import java.util.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class Attachment {
	private int attNo;
	private String attPath;
	private String originName;
	private String changeName;
	private String attStaus;
	private int boardNo;
	private int attLevel;
	
}
