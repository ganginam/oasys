package com.oasys.common.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oasys.common.login.dao.LoginDAO;
import com.oasys.common.login.vo.LoginVO;

import lombok.Setter;

@Service
public class LoginServiceImpl implements LoginService {
	@Setter(onMethod_ = @Autowired)
	private LoginDAO loginDAO;
	
	//로그인 처리
	@Override
	public LoginVO loginCheck(String m_id, String m_pwd) {
		// TODO Auto-generated method stub
		LoginVO lvo = new LoginVO();
		lvo.setM_id(m_id);
		lvo.setM_pwd(m_pwd);
		
		LoginVO vo = loginDAO.loginCheck(lvo);
		
		return vo;
	}

}
