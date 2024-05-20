package com.kh.pet.shop.model.vo;

import java.time.LocalDateTime;
import java.util.List;

import com.kh.pet.common.model.vo.Animal;
import com.kh.pet.common.model.vo.Attachment;
import com.kh.pet.common.model.vo.PageInfo;
import com.kh.pet.info.model.vo.Reply;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class ProductOption {

	private String colorName;
	private String sizeName;
	private int productNo;
	private int productAmount;
}
