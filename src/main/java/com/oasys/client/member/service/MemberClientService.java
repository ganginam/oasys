package com.oasys.client.member.service;

import com.oasys.common.member.vo.MemberVO;

public interface MemberClientService {

	public int memberInsert(MemberVO mvo);

	public int idCheck(MemberVO mvo);
	
	public MemberVO memberSelect(String m_id);

	public int memberUpdate(MemberVO mvo);

	public int memberDelete(String m_id);

	//public void create(MemberVO mvo) throws Exception;

	//public void updateAuthstatus(MemberVO mvo);

	public int memberGradeInsert(MemberVO mvo);
	public int memberNo();

	public MemberVO loginCheck(String m_id, String m_pwd);
}
