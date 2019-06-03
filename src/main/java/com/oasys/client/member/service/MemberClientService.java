package com.oasys.client.member.service;

import com.oasys.common.member.vo.MemberVO;

public interface MemberClientService {

	public int memberInsert(MemberVO mvo);

	public int idCheck(MemberVO mvo);
	
	public MemberVO memberSelect(String m_id);

	public int memberUpdate(MemberVO mvo);

	public int memberDelete(String m_id);

}
