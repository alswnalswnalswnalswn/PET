package com.kh.pet.member.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.pet.common.model.vo.Animal;
import com.kh.pet.member.model.vo.Member;

@Repository
public class MemberRepository {

	public Member login(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.selectOne("memberMapper.login",member);
	}

	public int join(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.insert("memberMapper.join", member);
	}

	public int insertAnimals(SqlSessionTemplate sqlSession, List<Animal> animal) {
		return sqlSession.insert("memberMapper", animal);
	}

	public int idCheck(SqlSessionTemplate sqlSession, String checkId) {
		return sqlSession.selectOne("memberMapper.idCheck", checkId);
	}

	public int checkNick(SqlSessionTemplate sqlSession, String nickname) {
		return sqlSession.selectOne("memberMapper.checkNick", nickname);
	}

	public int checkPhone(SqlSessionTemplate sqlSession, String phone) {
		return sqlSession.selectOne("memberMapper.checkPhone", phone);
	}

	public int checkEmail(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("memberMapper.checkEmail", email);
	}

}
