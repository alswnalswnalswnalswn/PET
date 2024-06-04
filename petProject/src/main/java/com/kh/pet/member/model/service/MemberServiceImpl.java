package com.kh.pet.member.model.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pet.common.model.vo.Animal;
import com.kh.pet.info.model.vo.Info;
import com.kh.pet.member.model.dao.MemberMapper;
import com.kh.pet.member.model.vo.CertVO;
import com.kh.pet.member.model.vo.Member;
import com.kh.pet.member.model.vo.SocialMember;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {

	private final MemberMapper memberMapper;
	
	@Override
	public Member login(Member member) {
		return memberMapper.login(member);
	}

	@Override
	public int join(Member member) {
		return memberMapper.join(member);
	}
	@Override
	public int insertAnimals(Animal animal) {
		return memberMapper.insertAnimals(animal);
	}

	@Override
	public int idCheck(String checkId) {
		return memberMapper.idCheck(checkId);
	}

	@Override
	public int checkNick(String nickname) {
		return memberMapper.checkNick(nickname);
	}

	@Override
	public int checkPhone(String phone) {
		return memberMapper.checkPhone(phone);
	}

	@Override
	public int checkEmail(String email) {
		return memberMapper.checkEmail(email);
	}

	@Override
	public void sendMail(CertVO certVo) {
		memberMapper.insertCode(certVo);
	}

	@Override
	public int validate(CertVO certVo) {
		int result =  memberMapper.validate(certVo);
		System.out.println(result);
		if(result > 0) {
			memberMapper.deleteCert(certVo);
		}
		return result;
	}

	@Override
	public String searchId(Member member) {
		return memberMapper.searchId(member);
	}

	@Override
	public int searchPwd(Member member) {
		return memberMapper.searchPwd(member);
	}

	@Override
	public int updatePwd(Member member) {
		return memberMapper.updatePwd(member);
	}

	@Override
	public int update(Member member) {
		return memberMapper.update(member);
	}

	@Override
	public int pwdCheck(Member member) {
		return memberMapper.pwdCheck(member);
	}

	@Override
	public int upProfile(Member member) {
		return memberMapper.upProfile(member);
	}

	@Override
	public Member selectUpMember(int memberNo) {
		return memberMapper.selectUpMember(memberNo);
	}
	
	@Override
	public int selectListCount(HashMap<Object, Object> map) {
		return memberMapper.selectListCount(map);
	}
/*
	@Override
	public List<Info> selectCategory(HashMap<String, Object> map) {
		return memberMapper.selectCategory(map);
	}

*/
	@Override
	public Info selectBoardDetail(int boardNo) {
		return memberMapper.selectBoardDetail(boardNo);
	}

	@Override
	public List<Info> selectBoard(HashMap<Object, Object> map, RowBounds rowBounds) {
		return memberMapper.selectBoard(map, rowBounds);
	}

	@Override
	public List<Info> selectMyBoard(List<Info> list) {
		return memberMapper.selectMyBoard(list);
	}

	@Override
	public List<Info> selectCategory(HashMap<String, Object> map) {
		return null;
	}

	@Override
	public int selectMember(String id) {
		return  memberMapper.selectMember(id);
	}

	@Override
	public int socialJoin(Member member) {
		return memberMapper.socialJoin(member);
	}

	@Override
	public Member selectSocialMember(Member member) {
		return memberMapper.selectSocialMember(member);
	}



}
