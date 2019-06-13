package com.oasys.client.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.oasys.common.member.dao.MemberDao;
import com.oasys.common.member.vo.MemberVO;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class MemberClientServiceImpl implements MemberClientService {
	@Setter(onMethod_ = @Autowired)
	private MemberDao memberDao;

	
	//회원가입
	@Override
	public int memberInsert(MemberVO mvo) {
		int sCode = 2;
		if(memberDao.memberSelect(mvo.getM_id()) != null){
			return 1;
		}else {
			try {
				sCode = memberDao.memberInsert(mvo);
				if(sCode == 1) {
					return 3;
				}else {
					return 2;
				}
			} catch (RuntimeException e) {
				e.printStackTrace();
				return 2;
			}
		}
	}


	//아이디 중복체크
	@Override
	public int idCheck(MemberVO mvo) {
		int result = 0;
		result = memberDao.idCheck(mvo);
		
		return result;
	}

	@Override
	public MemberVO memberSelect(String m_id) {
		MemberVO vo = memberDao.memberSelect(m_id);
		return vo;
	}

	@Transactional
	@Override
	public int memberUpdate(MemberVO mvo) {
		int result = memberDao.memberUpdate(mvo);
		return result;
		
	}

	@Override
	public int memberDelete(String m_id) {
		int mCode, isSuccessCode = 3;
		try {
			mCode = memberDao.memberDelete(m_id);
			if(mCode == 1) {
				isSuccessCode = 2;
			}
		}catch(Exception e) {
			e.printStackTrace();
			isSuccessCode = 3;
		}
		return isSuccessCode;
	}
	
	@Override
	public int memberNo() {

		int m_no = memberDao.memberNo();

		return m_no;
	}
	
	
	@Override
	public MemberVO loginCheck(String m_id, String m_pwd) {
		MemberVO mvo = new MemberVO();
		mvo.setM_id(m_id);
		mvo.setM_pwd(m_pwd);
		
		MemberVO vo = memberDao.loginCheck(mvo);
		
		return vo;
	}

	@Override
	public int memberGradeInsert(MemberVO mvo) {
		int result = memberDao.memberGradeInsert(mvo);
		return result;
	}

	@Override
	public MemberVO adminCheck(String m_type) {
		MemberVO mvo = new MemberVO();
		mvo.setM_type(m_type);
		
		MemberVO vo = memberDao.adminCheck(mvo);
		
		return vo;
	}


	//아이디 찾기
	@Override
	public MemberVO idSearch(String m_name, String m_email) {
		MemberVO mvo = new MemberVO();
		mvo.setM_name(m_name);
		mvo.setM_email(m_email);
		
		MemberVO vo = memberDao.idSearch(mvo);
		
		return vo;
	}


	@Override
	public MemberVO pwSearch(String m_name, String m_email, String m_id) {
		MemberVO mvo = new MemberVO();
		mvo.setM_name(m_name);
		mvo.setM_email(m_email);
		mvo.setM_id(m_id);
		MemberVO vo = memberDao.pwSearch(mvo);
		
		return vo;
	}
}
