package com.kh.pet.shop.model.vo;

import java.time.LocalDateTime;
import java.util.List;

import com.kh.pet.member.model.vo.Member;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@ToString
@NoArgsConstructor
public class Order {
	private int orderNo;
	private int deliveryNo;
	private LocalDateTime orderDate;
	private String orderStatus;
	private LocalDateTime orderUp;
	private Member member;
	
	private List<ProductOption> optionList;
}
