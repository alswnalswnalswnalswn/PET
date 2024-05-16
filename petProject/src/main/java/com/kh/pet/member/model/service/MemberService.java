package com.kh.pet.member.model.service;


import com.kh.pet.common.model.vo.Animal;
import com.kh.pet.member.model.vo.CertVO;
import com.kh.pet.member.model.vo.Member;
import com.kh.pet.member.model.vo.SocialMember;

public interface MemberService {
	
	Member login(Member member);

	int join(Member member);

	int idCheck(String checkId);

	int checkNick(String nickname);

	int checkPhone(String phone);

	int checkEmail(String email);

	void sendMail(CertVO certVo);

	SocialMember selectMember(SocialMember sm);

	int insertAnimals(Animal animal);

	boolean validate(CertVO certVo);

	String searchId(Member member);

	int searchPwd(Member member);

	int updatePwd(Member member);


}
