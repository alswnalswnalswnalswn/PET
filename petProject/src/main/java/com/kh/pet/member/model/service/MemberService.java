package com.kh.pet.member.model.service;

import java.util.List;

import com.kh.pet.common.model.vo.Animal;
import com.kh.pet.member.model.vo.Member;

public interface MemberService {
	
	Member login(Member member);

	int join(Member member, List<Animal> animal);

	int idCheck(String checkId);

	int checkNick(String nickname);

	int checkPhone(String phone);

	int checkEmail(String email);

	void sendMail();

}
