package com.oasys.common.faq.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)

public class FaqVO {	
	private int fa_num 	=0;     	//번호
	private String fa_type	=""; 	//분류
	private String fa_title	="";	//제목
	private String fa_content =""; //내용
	private String fa_date	="";	//날짜


}
