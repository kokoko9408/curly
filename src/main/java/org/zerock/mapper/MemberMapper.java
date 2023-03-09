package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.zerock.domain.MemberVO;

public interface MemberMapper {
	
	//@Select("select * from member where m_seq>0")
	public List<MemberVO> getList();
	
	
	public void memberJoin(MemberVO member); //회원가입
	public int idCheck(String m_userid);//아이디 중복 검사
    public MemberVO memberLogin(MemberVO member); //로그인
    public void memberUpdate(MemberVO member);
    
    public void withdrawal(MemberVO member);
    
}
