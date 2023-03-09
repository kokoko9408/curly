package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.MemberMapper;

@Service
public class MemberServiceimpl implements MemberService{

	@Autowired
	MemberMapper membermapper;
	
	@Override
	public void memberJoin(MemberVO member) throws Exception {
		// TODO Auto-generated method stub
		membermapper.memberJoin(member);
	}

	@Override
	public int idCheck(String m_userid) throws Exception {
		// TODO Auto-generated method stub
		return membermapper.idCheck(m_userid);
	}

	@Override
	public MemberVO memberLogin(MemberVO member) throws Exception {
		// TODO Auto-generated method stub
		return membermapper.memberLogin(member);
	}

	@Override
	public List<MemberVO> getList() {
		// TODO Auto-generated method stub
		return membermapper.getList();
	}
	@Override
	public void memberUpdate(MemberVO member) {
		membermapper.memberUpdate(member);
		
	}

	@Override
	public void withdrawal(MemberVO member) {
		membermapper.withdrawal(member);
		// TODO Auto-generated method stub
		
	}

}
