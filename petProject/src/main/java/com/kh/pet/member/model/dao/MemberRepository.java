package com.kh.pet.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.pet.member.model.vo.Member;

@Repository
public class MemberRepository {

	public Member login(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.selectOne("memberMapper.login",member);
	}

	public int join(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.insert("memberMapper.join", member);
	}

	public int insertAnimals(SqlSessionTemplate sqlSession, String animalCode) {
		return sqlSession.insert("memberMapper", animalCode);
	}

}
