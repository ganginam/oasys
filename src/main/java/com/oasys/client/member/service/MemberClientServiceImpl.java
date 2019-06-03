package com.oasys.client.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oasys.common.member.dao.MemberDAO;
import com.oasys.common.member.vo.MemberVO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class MemberClientServiceImpl implements MemberClientService {
	@Setter(onMethod_ = @Autowired)
	private MemberDAO memberDAO;
	
	//회원가입
	@Override
	public int memberInsert(MemberVO mvo) {
		int sCode = 2;
		if(memberDAO.memberSelect(mvo.getM_id()) != null){
			return 1;
		}else {
			try {
				sCode = memberDAO.memberInsert(mvo);
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
		result = memberDAO.idCheck(mvo);
		
		return result;
	}

	@Override
	public MemberVO memberSelect(String m_id) {
		MemberVO vo = memberDAO.memberSelect(m_id);
		return vo;
	}

	@Transactional
	@Override
	public int memberUpdate(MemberVO mvo) {
		int result = memberDAO.memberUpdate(mvo);
		return result;
		
	}

	@Override
	public int memberDelete(String m_id) {
		int mCode, isSuccessCode = 3;
		try {
			mCode = memberDAO.memberDelete(m_id);
			if(mCode == 1) {
				isSuccessCode = 2;
			}
		}catch(Exception e) {
			e.printStackTrace();
			isSuccessCode = 3;
		}
		return isSuccessCode;
	}

}
