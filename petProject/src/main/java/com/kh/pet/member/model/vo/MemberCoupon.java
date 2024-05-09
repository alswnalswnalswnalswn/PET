package com.kh.pet.member.model.vo;

import java.util.Date;

import com.kh.pet.common.model.vo.Coupon;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class MemberCoupon {
	private int memberNo;
	private int couponNo;
	private Date issueDate;
	private String memberCouponStatus;
	private Coupon coupon;
}
