package com.kh.pet.member.model.service;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.kh.pet.common.model.vo.Animal;
import com.kh.pet.info.model.vo.Info;
import com.kh.pet.member.model.vo.CertVO;
import com.kh.pet.member.model.vo.Member;

public interface MemberService {
	
	Member login(Member member);

	int join(Member member);

	int idCheck(String checkId);

	int checkNick(String nickname);

	int checkPhone(String phone);

	int checkEmail(String email);

	void sendMail(CertVO certVo);

	int insertAnimals(Animal animal);

	int validate(CertVO certVo);

	String searchId(Member member);

	int searchPwd(Member member);

	int updatePwd(Member member);

	int update(Member member);

	int pwdCheck(Member member);

	int upProfile(Member member);

	Member selectUpMember(int memberNo);

	List<Info> selectBoard(HashMap<Object, Object> map, RowBounds rowBounds);
	
	List<Info> selectMyBoard(List<Info> boardList);
	
	List<Info> selectCategory(HashMap<String, Object> map);

	Info selectBoardDetail(int boardNo);

	int selectListCount(HashMap<Object, Object> map);

	int selectMember(String id);

	int socialJoin(Member member);

	Member selectSocialMember(String memberId);

	List<Animal> selectMyAnimal(int memberNo);


}
