package com.oasys.common.review.vo;

import com.oasys.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class ReviewVO extends CommonVO {
	private int re_num;		//게시판 번호
	private String re_name;		//작성자
	private String re_title;	//글 제목
	private String re_content;	//글 내용
	private String re_date;	//작성일
	private String r_cnt;	//댓글 개수
}