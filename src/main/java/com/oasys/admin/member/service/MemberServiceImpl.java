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
}
