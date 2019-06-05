package com.oasys.common.member.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class MemberVO {
	private String m_id;
	private String m_pwd;
	private String m_name;
	private int m_no;	//회원번호
	private String m_oldPwd;	//기존 비밀번호
	private String m_phone;	//핸드폰 번호
	private String m_email;	//이메일
	private String m_birth;	//생년월일
	private int m_total;	//누적금액
	private String m_joinDate;	//회원 가입일
	private String m_gender;	//성별
	private String m_type;	//타입(회원 or 관리자)
	private String m_pwdChanged;	//비밀번호 수정일
	private String authkey;
	private int authstatus;
	
	private String mg_grade   ="";
	private int mg_discount   =0;
    //private int m_no      =0;
    private String mg_date   ="";
}
