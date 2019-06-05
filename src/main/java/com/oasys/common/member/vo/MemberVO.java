package com.oasys.common.member.vo;

import com.oasys.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class MemberVO extends CommonVO {
	
	//Grade
	private String mg_grade	="";
	private int mg_discount	=0;

	//Membergrade
	private int m_no		=0;
	private String mg_date	="";
	
	//Member
	private String m_name	="";
	private String m_id		="";
	private String m_pwd 	="";
	private String m_phone 	="";
	private String m_email 	="";
	private String m_birth 	="";
	private String m_total 	="";
	private String m_joindate ="";
	private String m_gender ="";
	private String m_type 	="";
	private String m_pwdchanged ="";
	private String m_agreement ="";
	
	
}
