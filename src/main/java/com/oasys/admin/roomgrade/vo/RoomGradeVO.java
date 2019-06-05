package com.oasys.admin.roomgrade.vo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class RoomGradeVO {
	private String rg_grade;
    private int rg_price;
    private String rg_peoples   ;
    private String rg_area      ;
    private String rg_explain   ;
    private String image1=""    ;
    private String image2=""    ;
    private String image3=""    ;
    private String image4=""    ;
    private String image5=""    ;
	private String rg_date		;
	
	private List<MultipartFile> file ;
	
	public RoomGradeVO() {
		file = new ArrayList<MultipartFile>();
	}
}
