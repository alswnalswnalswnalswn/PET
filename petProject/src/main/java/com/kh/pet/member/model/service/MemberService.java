package com.kh.pet.member.model.service;

import com.kh.pet.member.model.vo.Member;

public interface MemberService {
	
	Member login(Member member);

	int join(Member member, int animalCode);
}
