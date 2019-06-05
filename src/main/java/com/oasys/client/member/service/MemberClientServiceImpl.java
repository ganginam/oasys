package com.oasys.client.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oasys.common.mail.MailUtils;
import com.oasys.common.mail.TempKey;
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
	
	//membergrade 추가
//	@Override
//	public int memberGradeInsert(MemberVO mvo) {
//		int sCode = 2;
//		if(memberDAO.memberSelect(mvo.getM_id()) != null){
//			return 1;
//		}else {
//			try {
//				sCode = memberDAO.memberGradeInsert(mvo);
//				if(sCode == 1) {
//					return 3;
//				}else {
//					return 2;
//				}
//			} catch (RuntimeException e) {
//				e.printStackTrace();
//				return 2;
//			}
//		}
//	}

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
	
	@Override
	public int memberNo() {
		int m_no = memberDAO.memberNo();
		return m_no;
	}
	
	
	@Override
	public MemberVO loginCheck(String m_id, String m_pwd) {
		MemberVO mvo = new MemberVO();
		mvo.setM_id(m_id);
		mvo.setM_pwd(m_pwd);
		
		MemberVO vo = memberDAO.loginCheck(mvo);
		
		return vo;
	}

	@Override
	public int memberGradeInsert(MemberVO mvo) {
		int result = memberDAO.memberGradeInsert(mvo);
		return result;
	}

//	@Autowired
//	private JavaMailSender mailSender;
//	
//	@Transactional
//	@Override
//	public void create(MemberVO mvo) throws Exception {
//		memberDAO.create(mvo);
//		
//		//임의의 authkey 생성
//		String authkey = new TempKey().getKey(50, false);
//		
//		mvo.setAuthkey(authkey);
//		memberDAO.updateAuthkey(mvo);
//		
//		//mail 작성 관련
//		MailUtils sendMail = new MailUtils(mailSender);
//		
//		sendMail.setSubject("회원가입 이메일 인증");
//		sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
//				.append("<p>아래 링크로 클릭하면 메일 인증이 완료됩니다.</p>")
//				.append("<a href='http://localhost:8080/common/joinConfirm?m_id=")
//				.append(mvo.getM_id())
//				.append("&m_email=")
//				.append(mvo.getM_email())
//				.append("&authkey=")
//				.append(authkey)
//				.append("' target='_blenk'>이메일 인증 확인</a>")
//				.toString());
//		sendMail.setFrom("관리자 ", "관리자명");
//		sendMail.setTo(mvo.getM_email());
//		sendMail.send();
//	}
//
//	@Override
//	public void updateAuthstatus(MemberVO mvo) {
//		// TODO Auto-generated method stub
//		
//	}

	

}
