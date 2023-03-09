<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>
<link rel="stylesheet" href="../resources/assets/css/admin/Enroll.css">


  
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
  table {
    width: 100%;
    border: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border: 1px solid #444444;
  }
</style>

</head>
<body>
<!-- top_subject_area -->
            <div class="admin_top_wrap">
                <span>관리자 페이지</span>
                
            </div>
            <!-- contents-area -->
            <div class="admin_wrap">
                <!-- 네비영역 -->
                <div class="admin_navi_wrap">
                  <ul>
                      <li >
                          <a class="admin_list_01" href="/admin/goodsEnroll">000000</a>
                      </li>
                      <!-- <li>
                          <a class="admin_list_02" href="/admin/goodsManage">상품 관리</a>
                      </li> -->
                      <lI>
                          <a class="admin_list_03" href="/admin/authorEnroll">회원관리</a>                            
                      </lI>
                      <!-- <lI>
                          <a class="admin_list_04" href="/admin/authorManage">작가 관리</a>                            
                      </lI>
                      <lI>
                          <a class="admin_list_05">회원 관리</a>                            
                      </lI> -->                                                                                             
                  </ul>
                </div>
                <div class="admin_content_wrap">
                    <div class="admin_content_subject"><span>회원 관리</span></div>
                </div>
                
                 
    <table>
      <thead>
        <tr>
          <th>번호</th><th>아이디</th><th>비밀번호</th><th>이메일</th><th>우편번호</th><th>주소1</th>
          <th>주소2</th><th>등록일</th><th>관리자 유/무</th>
        </tr>
      </thead>
      <c:forEach items ="${list}" var = "member">
      <tbody>
        <tr>
          <td><c:out value = "${member.m_seq}"/>번호</td><td><c:out value = "${member.m_userid}"/>아이디</td><td>비밀번호</td><td>이메일</td><td>우편번호</td><td>주소1</td>
          <td>주소2</td><td>등록일</td><td>관리자</td>
        </tr>
      </tbody>
      </c:forEach>
    </table>
                
                
                
                <div class="clearfix"></div>
            </div>
</body>
</html>

<%@include file="../includes/footer.jsp"%>