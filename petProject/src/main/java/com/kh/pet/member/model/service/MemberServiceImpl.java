package com.kh.pet.member.model.service;

import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pet.common.model.vo.Animal;
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
	public int join(Member member, List<Animal> animal) {
		int result = 0;
		if(memberRepository.join(sqlSession, member) > 0) {
			result = memberRepository.insertAnimals(sqlSession, animal);
		}
		return result;
	}

	@Override
	public int idCheck(String checkId) {
		return memberRepository.idCheck(sqlSession, checkId);
	}

	@Override
	public int checkNick(String nickname) {
		return memberRepository.checkNick(sqlSession, nickname);
	}

	@Override
	public int checkPhone(String phone) {
		return memberRepository.checkPhone(sqlSession, phone);
	}

	@Override
	public int checkEmail(String email) {
		return memberRepository.checkEmail(sqlSession, email);
	}

	@Override
	public void sendMail() {
		
	}

}
