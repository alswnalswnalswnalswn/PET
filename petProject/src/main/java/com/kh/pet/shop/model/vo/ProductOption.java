package com.kh.pet.shop.model.vo;

import java.util.List;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class ProductOption {

	private int optionNo;
	private int productNo;
	private int productAmount;
	private int sizeCode;
	private String sizeName;;
	
}
