package com.oasys.admin.roomgrade.vo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.oasys.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class RoomGradeVO extends CommonVO {
	private int rg_num ;
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
