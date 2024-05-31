package com.kh.pet.common.model.vo;

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@ToString
@NoArgsConstructor
public class Alert {
	
	private int alertNo;
	private int boardNo;
	private String alertType;
	private int seMemNo;
	private LocalDateTime alertTime;
	private LocalDateTime readTime;
	private String alertName;
	private int replyNo;
}
