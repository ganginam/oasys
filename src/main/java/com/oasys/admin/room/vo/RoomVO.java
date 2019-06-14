package com.oasys.admin.room.vo;

import com.oasys.admin.roomgrade.vo.RoomGradeVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class RoomVO extends RoomGradeVO{
	private String rg_grade;
	private int r_number;
	//private String r_view;
	private String r_strange;
	//private String r_used;
	private String r_date;
	
}
