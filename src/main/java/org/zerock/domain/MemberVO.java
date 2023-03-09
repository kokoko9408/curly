package org.zerock.domain;

import java.util.Date;

import lombok.Data;


@Data
public class MemberVO {
	
	
	private int m_seq; //회원 번호
	private String m_userid; // 회원 아이디
	private String m_password; //회원 비밀번호
	private String m_useremail; //회원 이메일
	private String m_address; //회원 주소
	private String m_address1; //회원 주소
	private String m_zipcode; //회원 우편번호
	private Date m_regdate; //등록일자
	private int m_adminCK; //관리자 구분(0:일반사용자, 1:관리자)
	
	
	
	

}
