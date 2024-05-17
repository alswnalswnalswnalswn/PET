package com.kh.pet.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kh.pet.common.model.vo.Animal;
import com.kh.pet.member.model.dao.MemberRepository;
import com.kh.pet.member.model.vo.CertVO;
import com.kh.pet.member.model.vo.Member;
import com.kh.pet.member.model.vo.SocialMember;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberRepository memberRepository;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Member login(Member member) {
		return memberRepository.login(sqlSession, member);
	}

	@Override
	public int join(Member member) {
		return memberRepository.join(sqlSession, member);
	}
	@Override
	public int insertAnimals(Animal animal) {
		return memberRepository.insertAnimals(sqlSession, animal);
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
	public void sendMail(CertVO certVo) {
		memberRepository.insertCode(sqlSession, certVo);
	}

	@Override
	public SocialMember selectMember(SocialMember sm) {
		return null;
	}

	@Override
	public boolean validate(CertVO certVo) {
		boolean result =  memberRepository.validate(sqlSession, certVo);
		
		if(result != false) {
			memberRepository.deleteCert(sqlSession, certVo);
		}
		return result;
	}

	@Override
	public String searchId(Member member) {
		return memberRepository.searchId(sqlSession, member);
	}

	@Override
	public int searchPwd(Member member) {
		return memberRepository.searchPwd(sqlSession, member);
	}

	@Override
	public int updatePwd(Member member) {
		return memberRepository.updatePwd(sqlSession, member);
	}

	@Override
	public int update(Member member) {
		return memberRepository.update(sqlSession, member);
	}

	@Override
	public int pwdCheck(Member member) {
		return memberRepository.pwdCheck(sqlSession, member);
	}


}
