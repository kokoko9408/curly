<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>


<!-- Content -->

<div class="container-xxl flex-grow-1 container-p-y">
	<h4 class="fw-bold py-3 mb-4">
		<span class="text-muted fw-light">곱쓰리 /</span> 일상수다게시판
	</h4>

	<!-- Basic Bootstrap Table -->
	<div class="card">

		<div class="card-header">
			<h4>&#128203;꼽쓰리 일상수다게시판 &#128203;</h4>
		</div>




		<div class="btn-class" style="padding-right: 20px;">
			<c:if test="${member == null}"></c:if>

			<!-- 값이 있는 경우 -->
			<c:if test="${member != null}">
				<button id='regBtn' type="button" class="btn btn-info btn-s"
					style="float: right">등록하기</button>
			</c:if>

		</div>

		<div class="table-responsive text-nowrap">
			<table class="table">
				<thead>
					<tr>
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
							<td><i class="fab fa-react fa-lg text-info me-3"></i><strong><c:out
										value="${board.b_seq}" /></strong></td>
							<td><a class='move'
								href='<c:out
										value="${board.b_seq}"/>'> <c:out
										value="${board.b_title}" /> <b>[<c:out
											value="${board.b_replyCnt}" />]
								</b></a> <c:if test="${board.readCount > 10 }">
									<img src="../resources/assets/img/main/078.png" width="30"
										height="25">
								</c:if> 
								<c:forEach var="attach" items="${board.attachList}">
									<c:if test="${attach.fileName !=null }">&#128206;</c:if>
								</c:forEach></td>
							<td><c:out value="${board.b_content}" /></td>
							<td><c:out value="${board.b_writer}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.b_regdate}" /></td>
							<td><c:out value="${board.readCount}" /></td>

						</tr>
					</c:forEach>
				</tbody>
			</table><!-- table 태그의 끝  -->



			<!-- 검색 조건 시작 -->
			<div class='row'>
				<div class="col-lg-12">

					<form id='searchForm' action="/board/list" method='get'
						style="padding-left: 500px; padding-top: 20px;">
						<select name='type' style='height: 30px; width: 200px;'>
							<option value=""
								<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
							<option value="T"
								<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
							<option value="C"
								<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
							<option value="W"
								<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
							<option value="TC"
								<c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목
								or 내용</option>
							<option value="TW"
								<c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목
								or 작성자</option>
							<option value="TWC"
								<c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>제목
								or 내용 or 작성자</option>
						</select> <input type='text' name='keyword'
							value='<c:out value = "${pageMaker.cri.keyword}"/>' /> <input
							type='hidden' name='pageNum'
							value='<c:out value="${pageMaker.cri.pageNum}"/>' /> <input
							type='hidden' name='amount'
							value='<c:out value="${pageMaker.cri.amount}"/>' />


						<!-- BoardController의 list에서 Criteria cri의 변수가 받아줌. -->
						<button class='btn btn-info btn-xs"'>Search</button>
					</form>
				</div>
			</div>

			<!-- 검색 조건 끝 -->

			<!-- 페이지 처리 시작  -->
			<div class="row">
				<div class="col-sm-12 col-md-7" style="text-align: right">
					<div class="dataTables_paginate paging_simple_numbers"
						id="dataTable_paginate">
						<ul class="pagination">

							<c:if test="${pageMaker.prev}">
								<li class="paginate_button page-item previous"
									id="dataTable_previous"><a
									href="${pageMaker.startPage -1}" aria-controls="dataTable"
									data-dt-idx="0" tabindex="0" class="page-link">Previous</a></li>
							</c:if>

							<c:forEach var="num" begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}">
								<li
									class="paginate_button page-item ${pageMaker.cri.pageNum == num ? "active" : ""} ">
									<a href="${num}" aria-controls="dataTable" data-dt-idx="0"
									tabindex="0" class="page-link">${num}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next}">
								<li class="paginate_button page-item next" id="dataTable_next">
									<a href="${pageMaker.endPage +1 }" aria-controls="dataTable"
									data-dt-idx="0" tabindex="0" class="page-link">Next</a>
								</li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
			<!-- 페이지 처리 끝  -->


			<form id="actionForm" action="/board/list" method="get">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum} "> 
				<input type="hidden" name="amount" value="${pageMaker.cri.amount} "> 
				<input type="hidden" name="type" value='<c:out value="${pageMaker.cri.type}"/>'> 
				<input type="hidden" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"/>'>
			</form>

			<!-- Modal  추가 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">Modal title</h4>
						</div>
						<div class="modal-body">처리가 완료되었습니다.</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary">Save
								changes</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->

		</div>
	</div>
</div>

<script type="text/javascript">
	$(document)
			.ready(
					function() {

						var result = '<c:out value="${result}"/>';

						checkModal(result);

						history.replaceState({}, null, null);

						function checkModal(result) {

							if (result === '' || history.state) {
								return;
							}

							if (parseInt(result) > 0) {
								$(".modal-body").html(
										"게시글 " + parseInt(result)
												+ " 번이 등록되었습니다.");
							}

							$("#myModal").modal("show");
						}

						$("#regBtn").on("click", function() {

							self.location = "/board/register";

						});

						var actionForm = $("#actionForm");

						$(".paginate_button a").on(
								"click",
								function(e) {

									e.preventDefault();

									console.log('click');
									actionForm.attr("action", "/board/list");
									actionForm.find("input[name='pageNum']")
											.val($(this).attr("href"));
									actionForm.submit();
								});

						$(".move")
								.on(
										"click",
										function(e) {
											e.preventDefault();
											actionForm.find(
													"input[name='b_seq']")
													.remove();
											actionForm
													.append("<input type='hidden' name='b_seq' value='"
															+ $(this).attr(
																	"href")
															+ "'>");
											actionForm.attr("action",
													"/board/get");
											actionForm.submit();
										});
						/* 오류가 뜸 WARN : org.springframework.web.servlet.mvc.support.DefaultHandlerExceptionResolver 
						- Resolved [org.springframework.web.method.annotation.MethodArgumentTypeMismatchException: 
							Failed to convert value of type 'java.lang.String' to required type 'int'; nested exception is java.lang.NumberFormatException: For input string: "/board/get?b_seq=306"]
						 */

						var searchForm = $("#searchForm");
						//검색 버튼을 클릭하면 검색은 1페이지를 하도록 수정하고 화면에 검색 조건과 키워드가 보이게 처리하는 작업을 우선으로 진행
						$("#searchForm button").on(
								"click",
								function(e) {

									if (!searchForm.find("option:selected")
											.val()) {
										alert("검색종류를 선택하세요");
										return false;
									}

									if (!searchForm.find(
											"input[name='keyword']").val()) {
										alert("키워드를 입력하세요");
										return false;
									}

									searchForm.find("input[name='pageNum']")
											.val("1");
									e.preventDefault();

									searchForm.submit();

								});

					});
</script>

<%@include file="../includes/footer.jsp"%>