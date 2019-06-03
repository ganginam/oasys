package com.oasys.common.member.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class MemberVO extends MgradeVO{
	private String m_name	="";
	private String m_id		="";
	private String m_pwd 	="";
	private String m_email 	="";
	private String m_birth 	="";
	private String m_total 	="";
	private String m_joindate ="";
	private String m_gender ="";
	private String m_type 	="";
	private String m_pwdchangedate ="";
}
