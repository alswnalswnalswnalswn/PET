package com.kh.pet.member.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;

import com.kh.pet.common.model.vo.Animal;
import com.kh.pet.info.model.vo.Info;
import com.kh.pet.member.model.vo.CertVO;
import com.kh.pet.member.model.vo.Member;

@Mapper
public interface MemberMapper {
	
	 Member login(Member member);
	 
	 int join(Member member);
	 
	 int insertAnimals(Animal animal);
	 
	 int idCheck(String checkId);
	 
	 int checkNick(String nickname);
	 
	 int checkPhone(String phone);
	 
	 int checkEmail(String email);
	 
	 void insertCode(CertVO certVo);
	 
	 boolean validate(CertVO certVo);
	 
	 void deleteCert(CertVO certVo);

	 String searchId(Member member);
	 
	 int searchPwd(Member member);
	 
	 int updatePwd(Member member);
	 
	 int update(Member member);
	 
	 int pwdCheck(Member member);
	 
	 int upProfile(Member member);
	 
	 Member selectUpMember(int memberNo);
	 
	 List<Info> selectBoard(HashMap<Object, Object> map, RowBounds rowBounds);
	 
	 List<Info> selectMyBoard(List<Info> list);
	 
	 Info selectBoardDetail(int boardNo);
	 
	 int selectListCount(HashMap<Object, Object> map);
	 

}
