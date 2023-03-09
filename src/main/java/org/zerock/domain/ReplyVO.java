package org.zerock.domain;

import java.util.Date;

import lombok.Data;


@Data
public class ReplyVO {
	
	private int r_seq;
	private int b_seq ;
	private String r_reply;
	private String r_replyer;
	private Date r_replyDate;
	private Date r_updateDate;

}
