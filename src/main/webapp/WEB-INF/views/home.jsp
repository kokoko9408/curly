<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  

<!DOCTYPE html>
<html lang="en">
<head>
  <title>곱슬머리를 사랑하는 '곱쓰리'</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    .navbar-nav {
    float: left;
    margin: 0;
}
    
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }
    
  .carousel-inner img {
      width: 100%; /* Set width to 100% */
      margin: auto;
      min-height:200px;
  }
  
  .inline-block {
  background-color: orange;
  display: inline-block;
  width: 100px;
  height: 100px;
  margin: 10px;
  padding: 10px;
}
.login_success_area>a{
    font-size: 15px;
    font-weight: 900;
    display: inline-block;
    margin-top: 5px;
    background: #e1e5e8;
    width: 82px;
    height: 22px;
    line-height: 22px;
    border-radius: 25px;
    color: #606267;    
}
a{
    text-decoration: none;
}
 
.top_gnb_area{
position : relative;
width : 100%;
height : 40px;
background-color : red;

}

.top_gnb_area .list{
    position: absolute;
    top: 0px;
    right: 0;
    
}
 
.top_gnb_area .list li{
    list-style: none;    
    float : left;
    padding: 13px 15px 0 10px;
    font-weight: 900;
    cursor: pointer;
}

  /* Hide the carousel text when the screen is less than 600 pixels wide */
  @media (max-width: 600px) {
    .carousel-caption {
      display: none; 
    }
  }
  </style>
</head>
<body>

<nav class="navbar navbar-inverse">

  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="/">곱쓰리</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
       <li class="active"><a href="#" onClick="location.href='http://localhost:8088/board/list';">자유게시판</a></li>
       </ul> 
        <ul class="nav navbar-nav navbar-right">
        <c:if test = "${member == null }"> <!-- 로그인x -->
        <li><a href="#" onClick="location.href='http://localhost:8088/board/member';">
        <span class="glyphicon glyphicon-log-in"></span> 회원가입 </a></li>
        <li><a href="#" onClick="location.href='http://localhost:8088/board/login';">
        <span class="glyphicon glyphicon-log-in"></span> 로그인 </a></li>
        </c:if>
        
       <c:if test = "${member != null }"> <!-- 로그인 o -->
       <c:if test="${member.m_adminCK == 1 }">
                        <li><a href="/admin/main">관리자 페이지</a></li>
       </c:if>             
        <li><a href="#" >
        <span class="glyphicon glyphicon-log-in"></span> 회원 : ${member.m_userid}</a></li>
        <li><a href="#" onClick="location.href='http://localhost:8088/board/memberUpdateView';">
        <span class="glyphicon glyphicon-log-in"></span> 회원정보수정 </a></li>
        <li><a href="/board/logout.do">
        <span class="glyphicon glyphicon-log-in"></span> 로그아웃 </a></li>
        </c:if>
        

      </ul>
      </div>
    </div>
  
</nav>


  
<div class="container text-center">    
  
   <div class="row" style= "margin-top: 50px"> 
  <img src="../resources/assets/img/main/555.jpg" width = "1170px" height="300px"  >
  </div>
  <div class="row">
   <div class="row" style = "margin-top : 30px; margin-bottom: 50px;"> 
   <h3>&#128103;꼽스리 공식 홍보영상&#128103;</h3><br>
   <iframe width="920" height="531" src="https://www.youtube.com/embed/ed28kdooELc" 
   title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
    </div>
 	</div>
  
    
    
   
      
    
      <div class="well">
       <h1><꼽쓰리 멤버 활동수칙></h1>
       
       <H3>1.회원가입을 해주세요</H3>
       <button type="button" class='btn btn-info' 
       onClick="location.href='http://localhost:8088/board/member'">회원가입</button>
  		<br></br>
  		
  		
  		
  		
       <H3>2.자유게시판을 이용해주세요</H3>
    	<button type="button" class='btn btn-info' 
       onClick="location.href='http://localhost:8088/board/list'">자유게시판</button>
       <br></br>
       <H3>3.회원간의 매너를 지켜주세요 </H3>
       <br></br>
       <br></br>
      
       
        <h1>&#128293; 최근 게시물 &#128293;</h1>
       
       <table class="table">
				<thead>
					<tr >
						<th>번호</th>
						<th>제목</th>
						<th>내용</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody class="table-border-bottom-0">
					<c:forEach items="${list}" var="board">
						<tr>
							<td><i class="fab fa-react fa-lg text-info me-3"></i> <strong><c:out
										value="${board.b_seq}" /></strong></td>
							<td><a class='move' 
								href='/board/get?b_seq=<c:out
										value="${board.b_seq}"/>'> 
										<c:out
										value="${board.b_title}" />
										<b>[<c:out value = "${board.b_replyCnt}"/>]</b>
							</a>
							<c:if test="${board.readCount > 10 }">
                   <img src="../resources/assets/img/main/078.png" width="30" height="25">
                     </c:if>
                      <c:forEach var="attach" items="${board.attachList}">
                         <c:if test="${attach.fileName !=null }">&#128206;
                  </c:if></c:forEach>
							</td>
							<td><c:out value="${board.b_content}" /></td>
							<td><c:out value="${board.b_writer}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.b_regdate}"/></td>
							<td><c:out
										value="${board.readCount}" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
       <br></br>
       <br></br>
       <h3><i class="fa fa-address-book"></i>&#127881;OPEN 2023.01.28&#127881;</h3>
      </div>
      
      <div class="well">
       
       
      </div>
      
    </div>
 
<br>


<script type="text/javascript">
	$(document).ready(function(){
		$("#logoutBtn").on("click", function(){
			location.href="member/logout";
		})
		$("#registerBtn").on("click", function(){
			location.href="board/register";
		})
		
		
		
		$("#memberUpdateBtn").on("click", function(){
			location.href="board/memberUpdateView";
		})
		
	})
</script>

<script type="text/javascript">

$(document).ready(function() {
   
   var msg = "${msg}";
   
   if(msg != ""){
      alert(msg);   
   }
   
});
</script>

<footer class="container-fluid text-center">
 <div
		class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
		<div class="mb-2 mb-md-0">
			© 
			<script>
				document.write(new Date().getFullYear());
			</script>
			, made with ❤️ by 뚜공
		</div>
	</div>
</footer>

</body>
</html>