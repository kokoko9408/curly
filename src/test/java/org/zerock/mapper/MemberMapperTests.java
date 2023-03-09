package org.zerock.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.MemberVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberMapperTests {
	
	@Autowired
	private MemberMapper membermapper;
	
	@Test
	public void testGetList() {
		membermapper.getList().forEach(member -> log.info(member));
		
	}
	
//	@Test
//	public void memberJoin() throws Exception { //회원가입 쿼리 실행 테스트 메서드
//		
//		MemberVO member = new MemberVO();
//		
////		member.setM_seq(1);
//		member.setM_userid("slrkanj22"); //회원 id
//		member.setM_password("1231"); //회원 비밀번호
//		member.setM_useremail("sfes@naver.com"); //회원 이메일
//		member.setM_address("수원시"); //회원 주소
//		member.setM_address1("팔달구"); //회원 주소
//		member.setM_zipcode("333-222"); //회원 우편번호
//		
//		
//		membermapper.memberJoin(member);
//		
//		
//	}
	
	/* 아이디중복검사 */
//	@Test
//	public void memberIdChk() throws Exception{
//		String id = "bb00"; //존재하는 아이디
//		String id2 = "test123"; //존재하지 않는 아이디
//		membermapper.idCheck(id);
//		membermapper.idCheck(id2);
//	}
	
	 /* 로그인 쿼리 mapper 메서드 테스트 */
    @Test
    public void memberLogin() throws Exception{
        
        MemberVO member = new MemberVO();    // MemberVO 변수 선언 및 초기화
        
        /* 올바른 아이디 비번 입력경우 */
        //member.setM_userid("jh001");
        //member.setM_password("9999");
        
        /* 올바른 않은 아이디 비번 입력경우 */
        member.setM_userid("cotnfla");
        member.setM_password("cotnfla");
        
        membermapper.memberLogin(member);
        System.out.println("결과 값 : " + membermapper.memberLogin(member));
        
    }
 
	
	

}
