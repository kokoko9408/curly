<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!-- beautify ignore:start -->
<html lang="en" class="light-style layout-menu-fixed" dir="ltr"
	data-theme="theme-default" data-assets-path="/resources/assets/"
	data-template="vertical-menu-template-free">
<head>

<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

<title>곱슬머리를 사랑하는 '꼽쓰리'</title>

<meta name="description" content="" />

<!-- Favicon -->
<link rel="icon" type="image/x-icon"
	href="/resources/assets/img/favicon/favicon.ico" />

<!-- Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
	rel="stylesheet" />

<!-- Icons. Uncomment required icon fonts -->
<link rel="stylesheet"
	href="/resources/assets/vendor/fonts/boxicons.css" />

<!-- Core CSS -->
<link rel="stylesheet" href="/resources/assets/vendor/css/core.css"
	class="template-customizer-core-css" />
<link rel="stylesheet"
	href="/resources/assets/vendor/css/theme-default.css"
	class="template-customizer-theme-css" />
<link rel="stylesheet" href="/resources/assets/css/demo.css" />

<!-- Vendors CSS -->
<link rel="stylesheet"
	href="/resources/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

<!-- Page CSS -->

<!-- Helpers -->
<script src="/resources/assets/vendor/js/helpers.js"></script>

<!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
<!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
<script src="/resources/assets/js/config.js"></script>
</head>


<body>

	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">


		<!-- Layout container 전체적인 틀 -->
		<div class="layout-page">
			<!-- Navbar -->

			<nav
				class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
				id="layout-navbar">

					
				<div class="navbar-nav-right d-flex align-items-center"
					id="navbar-collapse">
					<!-- 맨위 검색창 시작 -->
					<div class="navbar-nav align-items-center">
						<div class="nav-item d-flex align-items-center">
							<a href="/"><img src="/resources/assets/img/main/20.PNG" width = "210px" height="50px"alt="Image">
                           </a>

						</div>
					</div>
					<!-- 맨위 검색창 끝 -->
					<ul class="navbar-nav flex-row align-items-center ms-auto">

						<!-- Place this tag where you want the button to render. -->
						<!-- <li class="nav-item lh-1 me-3"><a class="github-button"
								href="https://github.com/themeselection/sneat-html-admin-template-free"
								data-icon="octicon-star" data-size="large"
								data-show-count="true"
								aria-label="Star themeselection/sneat-html-admin-template-free on GitHub">Star</a>
							</li> -->
						<!-- User 사람 이미지 -->
						<li class="nav-item navbar-dropdown dropdown-user dropdown">
							<a class="nav-link dropdown-toggle hide-arrow"
							href="javascript:void(0);" data-bs-toggle="dropdown">
							<c:if test="${member.m_adminCK == 0}">
								<div class="avatar avatar-online">
									<img src="/resources/assets/img/main/90.jpg" alt
										class="w-px-40 h-auto rounded-circle" />
								</div>
								</c:if>
								<c:if test="${member.m_adminCK == 1 }">
								<div class="avatar avatar-online">
									<img src="/resources/assets/img/avatars/1.png" alt
										class="w-px-40 h-auto rounded-circle" />
								</div>
								</c:if>
						</a>
							<ul class="dropdown-menu dropdown-menu-end">
								<li><a class="dropdown-item" href="#">
										<div class="d-flex">
											<!-- <div class="flex-shrink-0 me-3">
												<div class="avatar avatar-online"></div>
											</div> -->
						<c:if test="${member.m_adminCK == 0}">
						<div class="flex-grow-1">
												<span class="fw-semibold d-block">${member.m_userid}</span> <small
													class="text-muted">Member</small>



											</div>
											</c:if>
						 <c:if test="${member.m_adminCK == 1 }">
											<div class="flex-grow-1">
												<span class="fw-semibold d-block">${member.m_userid}</span> <small
													class="text-muted">Admin</small>



											</div>
								</c:if>
										</div>
								</a></li>

								<li>
									<div class="dropdown-divider"></div>
								</li>
								<c:if test="${member == null}">
									<li><a class="dropdown-item" href="/board/member"> <i
											class="bx bx-power-off me-2"></i> <!-- 접속버튼  --> <span
											class="align-middle">회원가입</span>
									</a></li>
									<!-- a href="#" onClick="location.href='http://localhost:8088/board/login';" -->
									<li><a class="dropdown-item" href="/board/login"> <i
											class="bx bx-power-off me-2"></i> <!-- 접속버튼  --> <span
											class="align-middle">로그인</span> <i class="fa fa-address-book"></i>
									</a></li>
								</c:if>
								<c:if test="${member != null }">
									<!-- 로그인 o -->
									<c:if test="${member.m_adminCK == 1 }">
										<li><a class="dropdown-item" href=/board/main> <i
												class="bx bx-power-off me-2"></i> <!-- 접속버튼  --> <span
												class="align-middle"> 관리자페이지</span>
										</a></li>
									</c:if>
									<li><a class="dropdown-item" href="auth-login-basic.html">
											<i class="bx bx-power-off me-2"></i> <!-- 접속버튼  --> <span
											class="align-middle">회원 : ${member.m_userid}</span>
									</a></li>
									
									<li><a class="dropdown-item" href="/board/logout.do">
											<i class="bx bx-power-off me-2"></i> <!-- 접속버튼  --> <span
											class="align-middle">로그아웃</span>
									</a></li>
								</c:if>



							</ul>
						</li>
						<!--/ User -->
					</ul>
				</div>
			</nav>

		</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>