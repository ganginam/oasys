package com.oasys.common.member.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class MgradeVO extends GradeVO{
	private int m_no		=0;
	private String mg_date	="";
}
