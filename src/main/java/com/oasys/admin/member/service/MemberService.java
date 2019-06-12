package com.oasys.admin.member.service;

import java.util.List;

import com.oasys.common.member.vo.MemberVO;

public interface MemberService {

	public List<MemberVO> memberList(MemberVO mvo);
	
	public List<MemberVO> adminList(MemberVO mvo);

	public int memberListCnt(MemberVO mvo);

	public MemberVO memberDetail(int m_no);

	public int adminDelete(int m_no);
	
	public List<MemberVO> memberGradeList(MemberVO mvo);

}
