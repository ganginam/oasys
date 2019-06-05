package com.oasys.common.member.dao;

import java.util.List;

import com.oasys.common.member.vo.MemberVO;

public interface MemberDao {
	public List<MemberVO> memberList(MemberVO mvo);
	public List<MemberVO> adminList(MemberVO mvo);
	public int memberListCnt(MemberVO mvo);
}
