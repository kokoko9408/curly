<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>



<div class="card" style = "margin-top: 20px;">
	<form role="form" method="post" autocomplete="off"
		style="margin: auto;">
		<h4 class="mb-2" style="padding-top: 20px;"> &#128103;꼽쓰리 회원탈퇴&#128103; </h4>
		 


		<div class="login_wrap">
			<div class="id_wrap">
				<div class="form-group has-feedback">
					<label class="control-label" for="m_userid">아이디</label> <input
						class="form-control" type="text" id="m_userid" name="m_userid"
						value="${member.m_userid}" readonly="readonly" />
				</div>
				<%-- <div class="id_input_box">

					<input class="id_input" name="m_userid" value="${member.m_userid}" />
				</div> --%>
			</div>
			<div class="pw_wrap">
				<div class="form-group has-feedback">
					<label class="control-label" for="m_password">패스워드</label> <input
						class="form-control" type="password" id="m_password"
						name="m_password" />
					<c:if test="${msg == false }">
						<p style="color: red;">입력한 비밀번호가 잘못 되었습니다.</p>
					</c:if>
				</div>


			</div>




			<div class="login_button_wrap"
				style="padding-top: 40px; padding-bottom: 10px;">
				<button class="btn btn-success" type="submit">회원탈퇴</button>
			</div>

		</div>
	</form>
</div>


