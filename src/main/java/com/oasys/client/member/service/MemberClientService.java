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
	public MemberVO memberDetail(int m_no);
	public MemberVO loginCheck(String m_id, String m_pwd);

	public MemberVO adminCheck(String m_type);

	public MemberVO idSearch(String m_name, String m_email);

	public MemberVO pwSearch(String m_name, String m_email, String m_id);
	
	//public String idSearch(MemberVO mvo);
	
}
