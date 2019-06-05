package com.oasys.common.member.dao;

import java.util.List;

import com.oasys.common.member.vo.MemberVO;

public interface MemberDao {

	
	public MemberVO memberSelect(String m_id);

	public int memberInsert(MemberVO mvo);

	public int idCheck(MemberVO mvo);

	public int memberUpdate(MemberVO mvo);

	public int memberDelete(String m_id);

	//public void create(MemberVO mvo);

	//public void updateAuthkey(MemberVO mvo);

	public int memberGradeInsert(MemberVO mvo);
	
	public int memberNo();

	public MemberVO loginCheck(MemberVO mvo);
	
	public List<MemberVO> memberList(MemberVO mvo);
	
	public List<MemberVO> adminList(MemberVO mvo);
	
	public int memberListCnt(MemberVO mvo);
}
