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

	
	private int productNo;
	private int productAmount;
	private String sizeName;
}
