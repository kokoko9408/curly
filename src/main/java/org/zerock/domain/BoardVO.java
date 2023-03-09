package org.zerock.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {
	
	private int m_seq; //회원번호
	private int b_seq; //게시물 번호
	private String b_title; //게시물 제목
	private String b_content; //게시물 내용
	private String b_writer; //게시물 작성자
	private Date b_regdate; //게시물 작성일
	private Date b_updateDate; //게시물 수정일
	private int b_replyCnt; //댓글수
	private int readCount; // 게시물 조회수
	private List<BoardAttachVO> attachList;//첨부파일
	

	
}
