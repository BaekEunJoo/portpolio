package com.spring.Imuseum.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.Imuseum.member.MemberVO;

public interface MemberDAO {
	//메소드명이 Mapper 파일의 id명으로 사용
	
	MemberVO idCheck(MemberVO vo);
	MemberVO getMember(MemberVO vo);
	MemberVO getMemberById(MemberVO vo);
	MemberVO getMemberForAdmin(MemberVO vo);
	
	int getMemberAllCount();
	List<MemberVO> getMemberAll(@Param("begin")int begin,@Param("end")int end);
	
	int joinMember(MemberVO vo);
	int joinMemberKakao(MemberVO vo);
	MemberVO findIdByPhone(MemberVO vo);
	MemberVO findIdByBirth(MemberVO vo);
	MemberVO findPasswordByPhone(MemberVO vo);	
	MemberVO findPasswordByBirth(MemberVO vo);	
	MemberVO findPasswordByEmail(MemberVO vo);	
	void updateMember(MemberVO vo);
	void updateWithoutPhone(MemberVO vo);
	void updateWithoutEmail(MemberVO vo);
	void deleteMember(MemberVO vo);
}
