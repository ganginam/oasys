package com.oasys.common.booking.vo;



import com.oasys.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class BookingVO extends CommonVO{
	private int b_num = 0;
	private String b_date ="";
	private String b_indate = "";
	private String b_outdate = "";
	private String b_ismember = "";
	private String b_name = "";
	private String b_phone = "";
	private String b_email = "";
	private String b_payment ="";
	private String b_state = "";
	private int m_no;
	private String rg_grade;
}
