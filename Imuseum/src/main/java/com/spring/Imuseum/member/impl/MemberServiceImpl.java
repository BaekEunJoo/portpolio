package com.spring.Imuseum.member.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.Imuseum.member.MemberPaging;
import com.spring.Imuseum.member.MemberService;
import com.spring.Imuseum.member.MemberVO;
import com.spring.Imuseum.member.dao.MemberDAO;

@Service("memberService")
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDAO memberDAO;
		
	@Override
	public MemberVO getMember(MemberVO vo) {
		return memberDAO.getMember(vo);
	}

	@Override
	public MemberVO getMemberById(MemberVO vo) {
		return memberDAO.getMemberById(vo);
	}
	@Override
	public MemberVO getMemberForAdmin(MemberVO vo) {
		return memberDAO.getMemberForAdmin(vo);
	}
	
	@Override
	public MemberVO idCheck(MemberVO vo) {
		return memberDAO.idCheck(vo);
	}
	
	@Override
	public MemberVO findIDByPhone(MemberVO vo) {
		return memberDAO.findIdByPhone(vo);
	}
	
	@Override
	public MemberVO findIDByBirth(MemberVO vo) {
		return memberDAO.findIdByBirth(vo);
	}
	
	@Override
	public MemberVO findPasswordByPhone(MemberVO vo) {
		return memberDAO.findPasswordByPhone(vo);
	}
	
	@Override
	public MemberVO findPasswordByBirth(MemberVO vo) {
		return memberDAO.findPasswordByBirth(vo);
	}
	
	@Override
	public MemberVO findPasswordByEmail(MemberVO vo) {
		return memberDAO.findPasswordByEmail(vo);
	}
	
	@Override
	public int joinMember(MemberVO vo) {
		return memberDAO.joinMember(vo);
	}
	
	@Override
	public int joinMemberKakao(MemberVO vo) {
		// TODO Auto-generated method stub
		return memberDAO.joinMemberKakao(vo);
	}

	@Override
	public void updateMember(MemberVO vo) {
		memberDAO.updateMember(vo);
	}
	@Override
	public void updateWithoutPhone(MemberVO vo) {
		memberDAO.updateWithoutPhone(vo);
	}
	
	@Override
	public void updateWithoutEmail(MemberVO vo) {
		memberDAO.updateWithoutEmail(vo);
	}

	@Override
	public void deleteMember(MemberVO vo) {
		memberDAO.deleteMember(vo);
	}

	@Override
	public MemberPaging caculateMemberPage(String cPage) {
		//1. 전체 게시물 수량 구하기
				MemberPaging p = new MemberPaging();

				 p.setTotalRecord(memberDAO.getMemberAllCount());
				 p.setTotalPage();		
				
				 //2. 현재 페이지 구하기
				 if (cPage != null) {
					 p.setNowPage(Integer.parseInt(cPage));
				 }		
				 //3. 현재 페이지에 표시할 게시글 시작번호(begin), 끝번호(end) 구하기
				 p.setEnd(p.getNowPage() * p.getNumPerPage());
				 p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
				
				 //3-1.(선택적) 끝번호(end)가 건수보다 많으면 데이터 건수와 동일하게 처리
				 if (p.getEnd() > p.getTotalRecord()) {
					 p.setEnd(p.getTotalRecord());
				 }
				
				 //System.out.println(">> 시작번호(begin) : " + p.getBegin());
				 //System.out.println(">> 끝번호(end) : " + p.getEnd());
				
				 //------ 블록(block) 계산하기 -----------
				 //4. 블록 시작페이지, 끝페이지 구하기(현재페이지 번호 사용)
				 int nowPage = p.getNowPage();
				 int beginPage = (nowPage - 1) / p.getNumPerBlock() * p.getNumPerBlock() + 1;
				 p.setBeginPage(beginPage);
				 p.setEndPage(beginPage + p.getNumPerBlock() - 1);
				
				//끝페이지(endPage)가 전체 페이지 수(totalPage) 보다 크면
				// 끝페이지를 전체페이지 수로 변경 처리
				 if (p.getEndPage() > p.getTotalPage()) {
					 p.setEndPage(p.getTotalPage());
				 }
				
				return p;
	}

	@Override
	public List<MemberVO> getMemberAll(int begin,int end) {
		
		return memberDAO.getMemberAll(begin,end);
	}





	
}
