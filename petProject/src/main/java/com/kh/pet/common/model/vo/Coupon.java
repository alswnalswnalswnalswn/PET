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
public class Coupon {
	private int couponNo;
	private String couponName;
	private Date createDate;
	private Date endDate;
	private int discountRate;
	private String couponStatus;
}
