package com.kh.pet.shop.model.vo;


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
public class Product {
	private int productNo;
	private String productName;
	private int price;
	private LocalDateTime productDate;
	private LocalDateTime updateDate;
	private String productDetail;
	
	private String prCategoryName;
	
	
	private PageInfo pageInfo;
	
	private Attachment attachment;
}
