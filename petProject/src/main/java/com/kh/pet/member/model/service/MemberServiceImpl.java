package com.kh.pet.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pet.member.model.dao.MemberRepository;
import com.kh.pet.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberRepository memberRepository;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Member login(Member member) {
		return memberRepository.login(sqlSession,member);
	}

	@Override
	public int join(Member member, String animalCode) {
		int result = 0;
		if(memberRepository.join(sqlSession, member) > 0) {
			result = memberRepository.insertAnimals(sqlSession, animalCode);
		}
		return result;
	}

}
