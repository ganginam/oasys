package com.oasys.common.qna.vo;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)

public class QnaVO {
	
	private int qa_num;		//번호
	private String qa_type;	//분류
	private String qa_title;//제목
	private String qa_content;//내용
	private String qa_author;//작성자
	private String qa_date;//날짜
	private String qa_cnt;//조회수
	private String qa_anstatus;//답변상태
	private String qa_pwd;//비밀번호
		
}
	
/*
create table qna(    --문의하기
    qa_num number not null,           --번호       --board_seq.nextval
    qa_type varchar2(50) not null,    --분류
    qa_title varchar2(100) not null,  --제목
    qa_content clob,                  --내용
    qa_author varchar2(100) not null, --작성자
    qa_date date default sysdate,          --날짜
    qa_cnt varchar2(100) not null,    --조회수
    qa_anstatus varchar2(50) not null,--답변상태
    qa_pwd varchar2(20) not null,    --비밀번호
	
	*/
	
	

