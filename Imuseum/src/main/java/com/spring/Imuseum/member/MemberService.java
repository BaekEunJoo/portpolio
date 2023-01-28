package com.spring.Imuseum.member;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface MemberService {
	MemberVO idCheck(MemberVO vo);
	MemberVO getMember(MemberVO vo);
	MemberVO getMemberById(MemberVO vo);
	MemberVO getMemberForAdmin(MemberVO vo);
	
	MemberPaging caculateMemberPage(String cPage);
	List<MemberVO> getMemberAll(@Param("begin")int begin,@Param("end") int end);
	
	int joinMember(MemberVO vo);
	
	int joinMemberKakao(MemberVO vo);
	MemberVO findIDByPhone(MemberVO vo);
	
	MemberVO findIDByBirth(MemberVO vo);
	MemberVO findPasswordByPhone(MemberVO vo);	
	MemberVO findPasswordByBirth(MemberVO vo);	
	MemberVO findPasswordByEmail(MemberVO vo);	
	
	void updateMember(MemberVO vo);
	void updateWithoutPhone(MemberVO vo);
	void updateWithoutEmail(MemberVO vo);
	void deleteMember(MemberVO vo);
	
}
