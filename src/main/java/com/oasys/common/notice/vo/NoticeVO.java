package com.oasys.common.notice.vo;

import com.oasys.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class NoticeVO extends CommonVO{

	private int n_num=0;				//게시판 번호
	private String n_name="";			//작성자
	private String n_content="";			//내용
	private String n_title="";			//제목
	private String n_date="";			//날짜

}
