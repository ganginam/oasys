package com.oasys.common.member.dao;

import com.oasys.common.member.vo.MemberVO;

public interface MemberDAO {

	
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
}
