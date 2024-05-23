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
import com.kh.pet.member.model.dao.memberMapper;
import com.kh.pet.member.model.vo.CertVO;
import com.kh.pet.member.model.vo.Member;
import com.kh.pet.member.model.vo.SocialMember;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Member login(Member member) {
		return memberMapper.login(sqlSession, member);
	}

	@Override
	public int join(Member member) {
		return memberMapper.join(sqlSession, member);
	}
	@Override
	public int insertAnimals(Animal animal) {
		return memberMapper.insertAnimals(sqlSession, animal);
	}

	@Override
	public int idCheck(String checkId) {
		return memberMapper.idCheck(sqlSession, checkId);
	}

	@Override
	public int checkNick(String nickname) {
		return memberMapper.checkNick(sqlSession, nickname);
	}

	@Override
	public int checkPhone(String phone) {
		return memberMapper.checkPhone(sqlSession, phone);
	}

	@Override
	public int checkEmail(String email) {
		return memberMapper.checkEmail(sqlSession, email);
	}

	@Override
	public void sendMail(CertVO certVo) {
		memberMapper.insertCode(sqlSession, certVo);
	}

	@Override
	public boolean validate(CertVO certVo) {
		boolean result =  memberMapper.validate(sqlSession, certVo);
		
		if(result != false) {
			memberMapper.deleteCert(sqlSession, certVo);
		}
		return result;
	}

	@Override
	public String searchId(Member member) {
		return memberMapper.searchId(sqlSession, member);
	}

	@Override
	public int searchPwd(Member member) {
		return memberMapper.searchPwd(sqlSession, member);
	}

	@Override
	public int updatePwd(Member member) {
		return memberMapper.updatePwd(sqlSession, member);
	}

	@Override
	public int update(Member member) {
		return memberMapper.update(sqlSession, member);
	}

	@Override
	public int pwdCheck(Member member) {
		return memberMapper.pwdCheck(sqlSession, member);
	}

	@Override
	public int upProfile(Member member) {
		return memberMapper.upProfile(sqlSession, member);
	}

	@Override
	public Member selectUpMember(int memberNo) {
		return memberMapper.selectUpMember(sqlSession, memberNo);
	}
	
	@Override
	public int selectListCount(HashMap<Object, Object> map) {
		return memberMapper.selectListCount(sqlSession, map);
	}

	@Override
	public List<Info> selectCategory(HashMap<String, Object> map) {
		return memberMapper.selectCategory(sqlSession, map);
	}

	@Override
	public Info selectBoardDetail(int boardNo) {
		return memberMapper.selectBoardDetail(sqlSession, boardNo);
	}

	@Override
	public List<Info> selectBoard(HashMap<Object, Object> map, RowBounds rowBounds) {
		return memberMapper.selectBoard(sqlSession, map, rowBounds);
	}

	@Override
	public List<Info> selectMyBoard(List<Info> list) {
		return memberMapper.selectMyBoard(sqlSession, list);
	}



}
