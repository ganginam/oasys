package com.oasys.common.vo;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
@Data
public class CommonVO {
	private int pageNum;
	private int amount;
	
	private String search="";
	private String keyword = "";
	
	public CommonVO() {
		this(1, 10);
	}
	
	public CommonVO(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
		
		
	}
}