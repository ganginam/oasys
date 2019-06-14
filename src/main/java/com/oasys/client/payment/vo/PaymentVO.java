package com.oasys.client.payment.vo;

import com.oasys.common.booking.vo.BookingVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class PaymentVO extends BookingVO{
	private int p_no;
	private String p_method;
	private String p_info;
	private String p_pay;
	private String p_date;
	private String p_state;
	
	//»ó¼Ó°ª
	//private int b_num;
}
