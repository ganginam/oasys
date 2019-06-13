package com.oasys.admin.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oasys.common.member.dao.MemberDao;
import com.oasys.common.member.vo.MemberVO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService{
	
	@Setter(onMethod_=@Autowired)
	private MemberDao memberDao;

	@Override
	public List<MemberVO> memberList(MemberVO mvo) {
		log.info("memberList...");
		
		List<MemberVO> memberList = null;
		memberList = memberDao.memberList(mvo);
		
		return memberList;
	}

	@Override
	public List<MemberVO> adminList(MemberVO mvo) {
		log.info("adminList...");
		
		List<MemberVO> adminList = null;
		adminList = memberDao.adminList(mvo);
		return adminList;
	}

	@Override
	public int memberListCnt(MemberVO mvo) {
		log.info("memberListCnt...");
		
		int total = memberDao.memberListCnt(mvo);
		
		return total;
	}

	@Override
	public MemberVO memberDetail(int m_no) {
		MemberVO mvo = memberDao.memberDetail(m_no);
		
		return mvo;
	}

	@Override
	public int adminDelete(int m_no) {
		log.info("adminDelete...");
		int value = memberDao.adminDelete(m_no);
		log.info(value);
		
		return value;
	}

	@Override
	public List<MemberVO> memberGradeList(MemberVO mvo) {
		log.info("memberGradeList...");
		
		List<MemberVO> mbGradeList = null;
		mbGradeList = memberDao.memberGradeList(mvo);
		
		return mbGradeList;
	}

	@Override
	public int gradeDataUpgradeToGold() {
		int result = 0;
		result = memberDao.gradeDataUpgradeToGold();
		return result;
	}

	@Override
	public int gradeDataUpgradeToVIP() {
		int result = 0;
		result = memberDao.gradeDataUpgradeToVIP();
		return result;
	}

	@Override
	public int gradeDataUpgradeToVVIP() {
		int result = 0;
		result = memberDao.gradeDataUpgradeToVVIP();
		return result;
	}

	@Override
	public int updateGrade() {
		int result = 0;
		result = memberDao.updateGrade();
		return result;
	}

}
