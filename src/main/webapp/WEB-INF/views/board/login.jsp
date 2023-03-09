<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>




<!DOCTYPE html>

<!-- =========================================================
* Sneat - Bootstrap 5 HTML Admin Template - Pro | v1.0.0
==============================================================

* Product Page: https://themeselection.com/products/sneat-bootstrap-html-admin-template/
* Created by: ThemeSelection
* License: You must have a valid license purchased in order to legally use the theme for your project.
* Copyright ThemeSelection (https://themeselection.com)

=========================================================
 -->
<!-- beautify ignore:start -->
<html lang="en" class="light-style customizer-hide" dir="ltr"
	data-theme="theme-default" data-assets-path="../assets/"
	data-template="vertical-menu-template-free">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

<title>곱스리 로그인</title>

<meta name="description" content="" />



<body>
	<!-- Content -->

	<div class="container-xxl">
		<div class="authentication-wrapper authentication-basic container-p-y">
			<div class="authentication-inner">
				<!-- Register -->
				<div class="card">
					<div class="card-body">
						<!-- Logo -->
						<div class="app-brand justify-content-center">
						 
							<span class="app-brand-text demo text-body fw-bolder">&#127804;꼽스리&#127804;</span>
							
						</div>
						<!-- /Logo -->
						<h4 class="mb-2">꼽스리 로그인 👋</h4>
						<p class="mb-4">대한민국 최초 곱슬머리를 위한 커뮤니티 '꼽쓰리' 입니다. 우리 함께 아름다운
							곱슬머리를 가꿔봐요!</p>

						<!-- <form id="formAuthentication" class="mb-3" action="index.html" method="POST"> -->
						<form id="login_form" class="mb-3" method="post">

							<div class="mb-3">
								<div class="form-group has-feedback">
									<label class="control-label" for="m_userid">아이디</label> <input
										class="form-control" type="text" id="m_userid" name="m_userid"
										placeholder="Enter your email or username" autofocus />
								</div>

							</div>
							<div class="mb-3 form-password-toggle">
								<div class="form-group has-feedback">
									<label class="control-label" for="m_password">패스워드</label> <input
										class="form-control" type="password" id="m_password"
										name="m_password"
										placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;" />
									<c:if test="${result == 0 }">
										<div class="login_warn" style="color: red;">사용자 ID 또는
											비밀번호를 잘못 입력하셨습니다.</div>
									</c:if>
								</div>


							</div>


							<div class="login_button_wrap" style="padding-top: 40px;">
								<input type="button" class="login_button btn btn-primary" value="로그인">
							</div>


						</form>
						<p class="text-center">
							<a href="/board/member"> <span>회원가입 하시겠습니까?</span>
							</a>
						</p>

					</div>
				</div>
				<!-- /Register -->
			</div>
		</div>
	</div>

	<!-- / Content -->



	
	<script>
		/* 로그인 버튼 클릭 메서드 */
		$(".login_button").click(function() {

			//alert("로그인버튼 됩니까?");

			/* 로그인 메서드 서버 요청 */
			$("#login_form").attr("action", "/board/login.do");
			$("#login_form").submit();

		});
	</script>
	
</body>
</html>

<%@include file="../includes/footer.jsp"%>