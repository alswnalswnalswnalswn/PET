package com.kh.pet.member.model.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.pet.common.model.vo.Animal;
import com.kh.pet.member.model.vo.CertVO;
import com.kh.pet.member.model.vo.Member;

@Repository
public class MemberRepository {

	public Member login(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.selectOne("memberMapper.login", member); 
	}

	public int join(SqlSessionTemplate sqlSession, Member member) {
		sqlSession.insert("memberMapper.join", member);
		return sqlSession.selectOne("memberMapper.selectMember", member.getMemberId());
	}

	public int insertAnimals(SqlSessionTemplate sqlSession, Animal animal) {
		return sqlSession.insert("memberMapper.insertAnimals", animal);
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
	
	public void insertCode(SqlSessionTemplate sqlSession, CertVO certVo) {
		sqlSession.insert("memberMapper.insertCode", certVo);
	}

	public boolean validate(SqlSessionTemplate sqlSession, CertVO certVo) {
		CertVO cert = sqlSession.selectOne("memberMapper.validate", certVo);
		return cert != null;
	}

	public void deleteCert(SqlSessionTemplate sqlSession, CertVO certVo) {
		sqlSession.delete("memberMapper.deleteCert", certVo);
	}

}
