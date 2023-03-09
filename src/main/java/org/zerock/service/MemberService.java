package org.zerock.service;

import java.util.List;

import org.zerock.domain.MemberVO;

public interface MemberService {
	
	public List<MemberVO> getList(); //전체 회원 불러오기
	
	public void memberJoin(MemberVO member) throws Exception;
	
	public int idCheck(String m_userid) throws Exception; //아이디 중복 검사
	 /* 로그인 */
    public MemberVO memberLogin(MemberVO member) throws Exception;
 
	public void memberUpdate(MemberVO member);
	
	public void withdrawal(MemberVO member);

}
