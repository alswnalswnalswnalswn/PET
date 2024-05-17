package com.kh.pet.member.model.vo;

import java.util.Date;
import java.util.List;

import com.kh.pet.common.model.vo.Animal;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class Member {
	private int memberNo;
	private String memberId;
	private String memberPwd;
	private String memberName;
	private String email;
	private String nickname;
	private String phone;
	private String memberStatus;
	private Date enrollDate;
	private Date ModifyDate;
	private String animalName;
	private String animalCode;
	private String profile;
	private String originName;
	private String changeName;
	private String[] animalList;
	private List<MemberCoupon> couponList;
	
}
