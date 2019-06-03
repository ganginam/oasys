package com.oasys.common.login.service;

import com.oasys.common.login.vo.LoginVO;

public interface LoginService {

	public LoginVO loginCheck(String m_id, String m_pwd);

}
