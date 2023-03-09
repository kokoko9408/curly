<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>


 <head>
 <meta charset="utf-8" />
 <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>
 <link rel="stylesheet" href="/resources/assets/css/member1.css"/> 
    
    
    <title>꼽쓰리 회원가입</title>

<script 
	src="https://code.jquery.com/jquery-3.4.1.js"
  	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  	crossorigin="anonymous"></script>		
			
				 
</head>

<body>
    <!-- Content -->

    <div class="container-xxl">
      <div class="authentication-wrapper authentication-basic container-p-y">
        <div class="authentication-inner">
          <!-- Register Card -->
          <div class="card">
            <div class="card-body">
              <!-- Logo -->
              <div class="app-brand justify-content-center">
						 
							<span class="app-brand-text demo text-body fw-bolder">&#127804;꼽스리&#127804;</span>
							
						</div>
						<!-- /Logo -->
						<div class = title>
						<h4 class="mb-2">꼽스리 회원가입 👋</h4>
						<p class="mb-4">대한민국 최초 곱슬머리를 위한 커뮤니티 '꼽쓰리' 입니다. 우리 함께 아름다운
							곱슬머리를 가꿔봐요!</p></div>

               <form id="join_form" class="mb-3" action="index.html" method="post">
               <div class= "join">
               <div class="id_wrap">
				<div class="id_name">아이디</div>
				
				<div class="id_input_box">
					<input class="id_input" name = "m_userid">
				</div>
				<span class = "id_input_re_1">사용 가능한 아이디입니다.</span>
				<span class = "id_input_re_2">아이디가 이미 존재합니다.</span>
				<span class = "final_id_ck">아이디를 입력해주세요.</span>
			</div>
			<div class="pw_wrap">
				<div class="pw_name">비밀번호</div>
				<div class="pw_input_box">
					<input class="pw_input" name = "m_password" type ="password">
				</div>
				<span class = "final_pw_ck">비밀번호를 입력해주세요.</span>
				<span class = "pwck_input_re_1">비밀번호가 일치합니다.</span>
				<span class = "pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
				
			</div>
			<div class="pwck_wrap">
				<div class="pwck_name">비밀번호 확인</div>
				<div class="pwck_input_box">
					<input class="pwck_input" type ="password">
				</div>
				<span class = "final_pwck_ck">비밀번호 확인을 입력해주세요.</span>
				
			</div>
			<div class="mail_wrap">
				<div class="mail_name">이메일</div> 
				<div class="mail_input_box">
					<input class="mail_input" name = "m_useremail">
				</div>
				<span class = "final_mail_ck">이메일을 입력해주세요.</span>
				<sapn class  ="mail_input_box_warn"></sapn>
					<div class="mail_check_input_box" id ="mail_check_input_box_false">
						<input class="mail_check_input" disabled="disabled">
					</div>
					<div class="mail_check_button">
					<button type="button" class="btn btn-primary btn-sm">인증번호전송</button>
					<!-- <button  type="button">인증번호 전송</button> -->
					 	
					</div>
					<div class="clearfix"></div>
					<span id = "mail_check_input_box_warn"></span>
				</div>
			
			<div class="address_wrap">
				<div class="address_name">주소</div>
				<div class="address_input_1_wrap">
					<div class="address_input_1_box">
						<input class="address_input_1" name = "m_zipcode" readonly="readonly">
					</div>
					<div class="address_button" onclick = "execution_daum_address()">
						<button type="button" class="btn btn-primary btn-sm">주소찾기</button>
						<!-- <span>주소 찾기</span> -->
					</div>
					<div class="clearfix"></div>
				</div>
				<div class ="address_input_2_wrap">
					<div class="address_input_2_box">
						<input class="address_input_2" name = "m_address" readonly="readonly">
					</div>
				</div>
				<div class ="address_input_3_wrap">
					<div class="address_input_3_box">
						<input class="address_input_3" name = "m_address1" readonly="readonly">
					</div>
				</div>
				<span class = "final_addr_ck">주소를 입력해주세요.</span>
			</div>
			<div class="join_button_wrap">
				<input type="button" class="join_button btn btn-info" value="가입하기">
			
				
			</div>
             </div>
              </form>
			</div>
               
               

              <p class="text-center">
                <span>이미 계정이 있나요?</span>
                <a
								href="/board/login"> 
                  <span>GO 로그인</span>
                </a>
              </p>
            </div>
          </div>
          
          <!-- Register Card -->
          
        </div>
      </div>
    

    <!-- / Content -->
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
    
    var code = ""; //이메일전송 인증번호 저장을 위한 코드
    
    /* 유효성 검사 통과유무 변수 */
  	var idCheck = false; //아이디
    var idckCheck = false; //아이디 중복 검사
    var pwChekck = false; //비번
    var pwckCheck = false; //비번 확인
    var pwckcorCheck = false; //비번 확인 일치 확인
    var nameCheck = false; //이름
    var mailCheck = false;// 이메일 인증번호 확인
    var addressCheck = false; //주소
    
   
    
    
    
    $(document).ready(function(){
    	//회원가입 버튼 작동하게
    	$(".join_button").click(function(){
    	 	
    		 /* 입력값 변수 */
           	var id = $('.id_input').val();                 // id 입력란
            var pw = $('.pw_input').val();                // 비밀번호 입력란
            var pwck = $('.pwck_input').val();            // 비밀번호 확인 입력란
            //var name = $('.user_input').val();            // 이름 입력란
            var mail = $('.mail_input').val();            // 이메일 입력란
            var addr = $('.address_input_3').val();        // 주소 입력란
    		
            
            /* 아이디 유효성검사 */
            //입력되지 않았을 때 span태그가 보이고 idCheck변수는 false
            //인력되었다면 span태그는 사라지고 idCheck는 true
           if(id == ""){
                $('.final_id_ck').css('display','block');
                idCheck = false;
            }else{
                $('.final_id_ck').css('display', 'none');
                idCheck = true;
            } 
            
            /* 비밀번호 유효성 검사 */
           if(pw == ""){
                $('.final_pw_ck').css('display','block');
                pwCheck = false;
            }else{
                $('.final_pw_ck').css('display', 'none');
                pwCheck = true;
            } 
            
            
            
            
            
            
            /* 비밀번호 확인 유효성 검사 */
            if(pwck == ""){
                $('.final_pwck_ck').css('display','block');
                pwckCheck = false;
            }else{
                $('.final_pwck_ck').css('display', 'none');
                pwckCheck = true;
            } 
            
            
            /* 이메일 유효성 검사 */
            if(mail == ""){
                $('.final_mail_ck').css('display','block');
                mailCheck = false;
            }else{
                $('.final_mail_ck').css('display', 'none');
                mailCheck = true;
            }
            /* 주소 유효성 검사 */
            if(addr == ""){
                $('.final_addr_ck').css('display','block');
                addressCheck = false;
            }else{
                $('.final_addr_ck').css('display', 'none');
                addressCheck = true;
            }
            
            /* 최종 유효성 검사 안하면 비밀번호 틀려도 회원가입 됨 */
            if(idCheck&&idckCheck&&pwCheck&&pwckCheck&&pwckcorCheck&&mailCheck&&mailnumCheck&&addressCheck ){
     
            	$("#join_form").attr("action","/board/member"); //회원가입 form전송하는 코드
        		$("#join_form").submit();
            	alert("회원가입 완료");
            	
            }else{ 
            	alert("다시 한 번 확인해주세요.");
            } 
            
            return false; //이걸 꼭 해야해?
        
    	});
    });
    
    //아이디 중복검사
    $('.id_input').on("propertychange change keyup paste input", function(){
    	
    	//console.log("keyup 테스트");
    	
    	var m_userid = $('.id_input').val();
    	var data = {m_userid : m_userid}
    	
    	$.ajax({
    		type : "post",
    		url : "/board/memberIdChk",
    		data : data,
    		success : function(result) {
    			//console.log("성공여부 : " +result);
    			if(result != 'fail'){
    				$('.id_input_re_1').css("display","inline-block");
    				$('.id_input_re_2').css("display","none");
    				idckCheck = true;
    			}else {
    				$('.id_input_re_2').css("display","inline-block");
    				$('.id_input_re_1').css("display","none");
    				idckCheck = false;
    			} 
    		}//success 종료 
    	});//ajax 종료 
    });//function 종료 
   
     //인증번호 이메일 전송
    $(".mail_check_button").click(function(){ //인증번호 받기 버튼
    	
    	var email = $(".mail_input").val(); // 입력한 이메일
    	var checkBox = $(".mail_check_input"); // 인증번호 입력란
    	var boxWrap = $(".mail_check_input_box"); // 인증번호 입력란 박스
    	var warnMsg = $(".mail_input_box_warn");    // 이메일 입력 경고글
    	
    	
    	 /* 이메일 형식 유효성 검사 */
        if(mailFormCheck(email)){
            warnMsg.html("이메일이 전송 되었습니다. 이메일을 확인해주세요.");
            warnMsg.css("display", "inline-block");
        } else {
            warnMsg.html("올바르지 못한 이메일 형식입니다.");
            warnMsg.css("display", "inline-block");
            return false;
        } 
    	
    	
    	   
    	$.ajax({
            
            type:"GET",
            url:"mailCheck?email=" + email,
            success:function(data){
                
                //console.log("data : " + data); 나오는지 확인완료!
            	checkBox.attr("disabled",false); // 인증번호 입력란이 입력 가능하도록 속성을 변경해주는 코드
    			boxWrap.attr("id", "mail_check_input_box_true");
    			//색상이 회색->흰색으로 변경해주는 코드
    			code = data;
            }
                    
        });
    	}); 
    
    //인증번호 비교
  $(".mail_check_input").blur(function(){
    	
    	var inputCode = $(".mail_check_input").val(); //입력코드
    	var checkResult = $("#mail_check_input_box_warn"); //비교결과
    	
    	  if(inputCode == code){                            // 일치할 경우
    	        checkResult.html("인증번호가 일치합니다.");
    	        checkResult.attr("class", "correct");
    	        mailnumCheck = true;     // 일치할 경우
    	    } else {                                            // 일치하지 않을 경우
    	        checkResult.html("인증번호를 다시 확인해주세요.");
    	        checkResult.attr("class", "incorrect");
    	        mailnumCheck = false;
    	    }     
    	
    }); 
    
    /* 다음주소연동 */
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
     
    
    /* 비밀번호 확인 일치 유효성 검사 */
     $('.pwck_input').on("propertychange change keyup paste input", function(){
    	
    	var pw = $('.pw_input').val();
        var pwck = $('.pwck_input').val();
        $('.final_pwck_ck').css('display', 'none');
        
        if(pw == pwck){
            $('.pwck_input_re_1').css('display','block');
            $('.pwck_input_re_2').css('display','none');
            pwckcorCheck = true;
        }else{
            $('.pwck_input_re_1').css('display','none');
            $('.pwck_input_re_2').css('display','block');
            pwckcorCheck = false;
        }   
            
        
    }); 
    
    /* 비밀번호 일치여부 확인 */
     $('.pwck_input').on("propertychange change keyup paste input", function(){
    	
    	 var pw = $('.pw_input').val();
         var pwck = $('.pwck_input').val();
    	 var num = pw.search(/[0-9]/g);
    	 var eng = pw.search(/[a-z]/ig);
    	 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

    	 if(pw.length < 8 || pw.length > 20){

    	  alert("8자리 ~ 20자리 이내로 입력해주세요.");
    	  return false;
    	 }else if(pw.search(/\s/) != -1){
    	  alert("비밀번호는 공백 없이 입력해주세요.");
    	  return false;
    	 }else if(num < 0 || eng < 0 || spe < 0 ){
    	  alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
    	  return false;
    	 }else {
    		console.log("통과"); 
    	    return true;
    	 }

    	
    	 
     });
    
    

    /* 입력 이메일 형식 유효성 검사 */
    function mailFormCheck(email){
       var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
       return form.test(email);
   }
    	  
  
    </script>

  </body>
</html>
