package com.oasys.common.member.vo;

import com.oasys.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class MemberVO extends CommonVO{
	private String m_id;
	private String m_pwd;
	private String m_name;
	private int m_no;	//회원번호
	private String m_oldpwd;	//기존 비밀번호 
	private String m_phone;	//핸드폰 번호
	private String m_email;	//이메일
	private String m_birth;	//생년월일
	private double m_total;	//누적금액
	private double m_ytotal;	//연간누적금액
	private String m_joindate;	//회원 가입일
	private String m_gender;	//성별
	private String m_type;	//타입(회원 or 관리자)
	private String m_pwdchanged;	//비밀번호 수정일
	private String authkey;
	private int authstatus;
	private String m_agreement ="";
	private String mg_grade   ="";
	private String mg_upgrade   ="";
	private int mg_discount   =0;
    //private int m_no      =0;
    private String mg_date   ="";
}
