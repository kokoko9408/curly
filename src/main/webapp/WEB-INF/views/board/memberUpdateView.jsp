<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../includes/header.jsp"%>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>회원가입</title>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		// 취소
		$(".cancel").on("click", function() {

			location.href = "/";

		})
		$(".delete").on("click",function() {
			location.href = "/board/withdrawal";
		})

		$("#submit").on("click", function() {
			
			if ($("#m_password").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#m_password").focus();
				return false;
			}
			
			if ($("#m_useremail").val() == "") {
				alert("이메일을 입력해주세요.");
				$("m_useremail").focus();
				return false;
			}
			if ($("#m_zipcode").val() == "") {
				alert("우편번호를 입력해주세요.");
				$("m_zipcode").focus();
				return false;
			}
			if ($("#m_address").val() == "") {
				alert("주소를 입력해주세요.");
				$("m_address").focus();
				return false;
			}
			if ($("#m_address1").val() == "") {
				alert("상세주소를 입력해주세요.");
				$("m_address1").focus();
				return false;
			}

		});

	})
</script>



<body>



	<section id="container" style ="width  : 500px;margin: auto;">
	
	<h4 class="mb-2">꼽쓰리 회원정보 🚀</h4>
              <p class="mb-4">회원 정보를 수정하시겠습니까?</p>
		<form action="/board/memberUpdate" method="post"  >
		
		
			<div class="form-group has-feedback">
				<label class="control-label" for="m_userid">아이디</label> <input
					class="form-control" type="text" id=" " name="m_userid"
					value="${member.m_userid}" readonly="readonly" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="m_password">패스워드</label> <input
					class="form-control" type="password" id="m_password"
					name="m_password" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="m_useremail">이메일</label> <input
					class="form-control" type="text" id="m_useremail"
					name="m_useremail" value="${member.m_useremail}"/>
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="m_zipcode">우편번호</label> <input
					class="form-control" type="text" id="m_zipcode"
					name="m_zipcode" value="${member.m_zipcode}" />
					<div class="btn btn-success" onclick="execution_daum_address()">
						<span>주소 찾기</span>
					</div>
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="m_address">주소</label> <input
					class="form-control" type="text" id="m_address"
					name="m_address" value="${member.m_address}" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="m_address1">상세주소</label> <input
					class="form-control" type="text" id="m_address1"
					name="m_address1" value="${member.m_address1}"/>
			</div>
			<span class="final_addr_ck">주소를 입력해주세요.</span>
			


			<div class="form-group has-feedback">
				<button class="btn btn-success" type="submit" id="submit">회원정보수정</button>
				<button class="cancel btn btn-danger" type="button">취소</button>
				<button class="delete btn btn-success" type = "button">회원탈퇴</button>
			</div>
		</form>
	</section>

</body>

</html>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
function execution_daum_address() {
	
	 new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            
	        	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
               var addr = ''; // 주소 변수
               var extraAddr = ''; // 참고항목 변수

               //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
               if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                   addr = data.roadAddress;
               } else { // 사용자가 지번 주소를 선택했을 경우(J)
                   addr = data.jibunAddress;
               }

               // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
               if(data.userSelectedType === 'R'){
                   // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                   // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                   if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                       extraAddr += data.bname;
                   }
                   // 건물명이 있고, 공동주택일 경우 추가한다.
                   if(data.buildingName !== '' && data.apartment === 'Y'){
                       extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                   }
                   // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                   if(extraAddr !== ''){
                       extraAddr = ' (' + extraAddr + ')';
                   }
                   //주소변수 문자열과 참고항목 문자열 합치기
                   addr += extraAddr;
               
               } else {
                  addr += ' ';
               }

               // 우편번호와 주소 정보를 해당 필드에 넣는다.
                $(".address_input_1").val(data.zonecode);
               
                $(".address_input_2").val(addr);
               //커서를 상세주소 필드로 이동한다.
               
               // 상세주소 입력란 disabled 속성 변경 및 커서를 상세주소 필드로 이동한다.
                $(".address_input_3").attr("readonly",false);
                $(".address_input_3").focus();
	             
	 
	        }
	    }).open();    
	
}  
</script>