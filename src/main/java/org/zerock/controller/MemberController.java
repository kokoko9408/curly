package org.zerock.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.MemberVO;
import org.zerock.service.MemberService;

import lombok.extern.log4j.Log4j;

@RequestMapping("/board/*")
@Log4j
@Controller
public class MemberController {

	
	
	@Autowired
	private MemberService memberservice;

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	
	/* 관리자페이지이동 */
	@GetMapping("/main")
	public void adminMainGET(Model model) throws Exception {
		log.info("관리자페이지이동");
		model.addAttribute("list", memberservice.getList());
	}
	
	
	@GetMapping("/member") //
	public void member(MemberVO member) throws Exception {

		log.info("회원가입창아 떠라"); // 회원가입페이지이동
	}

	@GetMapping("/login") // 로그인페이지 이동
	public void login() throws Exception {

		log.info("로그인창아 떠라");
	}

	// 회원가입
	@PostMapping("/member")
	public String joinPOST(MemberVO member) throws Exception {

		String rawPw = ""; // 인코딩 전 비밀번호
		String encodePw = ""; // 인코딩 후 비밀번호

		rawPw = member.getM_password(); // 비밀번호 데이터 얻음
		encodePw = pwEncoder.encode(rawPw); // 비밀번호 인코딩
		member.setM_password(encodePw); // 인코딩된 비밀번호 member객체에 다시 저장

		/* 회원가입 쿼리 실행 */
		memberservice.memberJoin(member);

		log.info("회원가입가능?");

		// memberservice.memberJoin(member);

		log.info(member);
		log.info("성공해라");

		return "redirect:/board/login";

	}

	@PostMapping("/memberIdChk")
	@ResponseBody
	public String memberIdChkPOST(String m_userid) throws Exception {

		log.info("memberIdChk() 진입");

		int result = memberservice.idCheck(m_userid);

		log.info("결과값 : " + result);

		if (result != 0) { // 중복 아이디가 존재
			return "fail";
		} else {
			return "success"; // 중복 아이디 존재x
		}
	}// memberIdChkPOST() 종료

	/* 이메일 인증 */
	@GetMapping("/mailCheck")
	@ResponseBody
	public String mailCheckGET(String email) throws Exception {

		/* view뷰로 부터 넘어온 데이터 확인 */
		log.info("이메일 데이터 전송 확인");
		log.info("인증번호 : " + email);

		Random random = new Random(); // 인증번호(난수) 생성
		int checkNum = random.nextInt(888888) + 111111; // 111111~999999범위의 숫자를 얻기 위해서
		log.info("인증번호임돠 :" + checkNum);

		String setFrom = "kokoko9408@naver.com";
		String toMail = email;
		String title = "회원가입 인증 이메일 입니다.";
		String content = "홈페이지를 방문해주셔서 감사합니다." + "<br><br>" + "인증번호는" + checkNum + "입니다." + "<br>"
				+ "해당 인증번호를 인증번호 확인란에 기입해 주세요.";

		/* 주석풀기 */
//			  try {
//			  
//			  MimeMessage message = mailSender.createMimeMessage(); MimeMessageHelper
//			  helper = new MimeMessageHelper(message, true, "utf-8");
//			  helper.setFrom(setFrom); helper.setTo(toMail); helper.setSubject(title);
//			  helper.setText(content,true); mailSender.send(message);
//			  
//			  }catch(Exception e) { e.printStackTrace(); }

		String num = Integer.toString(checkNum);

		return num;
	}

	/* 로그인 */
	@PostMapping("/login.do")
	// @RequestMapping(value="login", method=RequestMethod.POST)
	public String loginPOST(HttpServletRequest request, MemberVO member, RedirectAttributes rttr) throws Exception {

		HttpSession session = request.getSession();
		String rawPw = "";
		String encodePw = "";

		MemberVO lvo = memberservice.memberLogin(member); // 제출한아이디와 일치하는 아이디 있는지
		log.info(lvo);

		if (lvo != null) { // 일치하는 아이디 존재시

			rawPw = member.getM_password(); // 사용자가 제출한 비밀번호
			log.info("rawPw : " + rawPw);
			encodePw = lvo.getM_password(); // 데이터베이스에 저장한 인코딩된 비밀번호
			log.info("encodePw : " + encodePw);
			if (true == pwEncoder.matches(rawPw, encodePw)) { // 비밀번호 일치여부 판단
					log.info("로그인 lvo : " + lvo);
				lvo.setM_password(""); // 인코딩된 비밀번호 정보 지움
				session.setAttribute("member", lvo); // session에 사용자의 정보 저장
				return "redirect:/"; // 메인페이지 이동

			} else {

				rttr.addFlashAttribute("result", 0);
				return "redirect:/board/login"; // 로그인 페이지로 이동

			}

		} else { // 일치하는 아이디가 존재하지 않을 시 (로그인 실패)

			rttr.addFlashAttribute("result", 0);
			return "redirect:/board/login"; // 로그인 페이지로 이동

		}
	}
	/* 메인페이지 로그아웃 */
    @GetMapping("/logout.do")
    public String logoutMainGET(HttpServletRequest request) throws Exception{
    	
    	log.info("로그아웃메서드진입");
    	HttpSession session = request.getSession();
    	
    	 session.invalidate(); //세션초기화
         
         return "redirect:/"; 
        
    }
    
    @GetMapping("/memberUpdateView")
    public String registerUpdateView() throws Exception {
    	return "board/memberUpdateView";
    }
    
    @PostMapping("/memberUpdate")
    public String registerUpdate(MemberVO member,HttpSession session,RedirectAttributes rttr) throws Exception{
    	
    	String rawPw = ""; // 인코딩 전 비밀번호
		String encodePw = ""; // 인코딩 후 비밀번호

		rawPw = member.getM_password(); // 비밀번호 데이터 얻음
		encodePw = pwEncoder.encode(rawPw); // 비밀번호 인코딩
		member.setM_password(encodePw); // 인코딩된 비밀번호 member객체에 다시 저장
    	
    	memberservice.memberUpdate(member);
    	rttr.addFlashAttribute("msg", "수정완료되었습니다");
    	 	
    
    	return "redirect:/";
    }
    
	/* 회원탈퇴 */
    @GetMapping("/withdrawal")
    public void getWithdrawal() throws Exception {
    	log.info("회원탈퇴");
    }
    
    
 // 회원 탈퇴 post
    @PostMapping("/withdrawal") //session에는 암호화된 비밀번호가 담기지 않아서 null값이 뜸
    public String postWithdrawal(HttpSession session, MemberVO member, RedirectAttributes rttr) throws Exception {
     
    	log.info("post withdrawal");
    	log.info("멤버 값 : " + member);
    	
     MemberVO login = memberservice.memberLogin(member);
     
     log.info("vo 값 : " + login);
     
     String oldPass = login.getM_password();
     log.info("로그인 비밀번호 : "+ oldPass);
     String newPass = member.getM_password();
     log.info("탈퇴 시 비밀번호 : "+ newPass);
     
     boolean pwMatch = pwEncoder.matches(newPass, oldPass);
     //new는 평문, old는 암호화된 비번
     log.info("treu/false :" + pwMatch);
     
     if(pwMatch == true) {
    	 memberservice.withdrawal(member);
    	 rttr.addFlashAttribute("msg", "탈퇴완료되었습니다.");
    	 session.invalidate();
    	 return "redirect:/";
     }else {
    	 return "redirect:/board/withdrawal";
    	 
     }
		
    }
 
}
