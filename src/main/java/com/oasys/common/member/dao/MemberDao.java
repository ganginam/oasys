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
	
	
	
	//관리자페이지
	//회원관리
	public List<MemberVO> memberList(MemberVO mvo);
	
	public List<MemberVO> adminList(MemberVO mvo);
	
	public int memberListCnt(MemberVO mvo);
	
	public MemberVO memberDetail(int m_no);
	
	public int adminDelete(int m_no);
	
	//회원등급관리
	public List<MemberVO> memberGradeList(MemberVO mvo);
	
	public int gradeDataUpgradeToGold();
	public int gradeDataUpgradeToVIP();
	public int gradeDataUpgradeToVVIP();
	
	public int updateGrade();
}
