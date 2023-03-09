<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>

<div class="container-xxl flex-grow-1 container-p-y">
	<h4 class="fw-bold py-3 mb-4">
		<span class="text-muted fw-light">상세페이지/</span> 일상수다게시판
	</h4>

	<!-- 수정 -->
	<div class="row">
		<div class="col-xl">
			<div class="card mb-4">
				<div class="card-header d-flex justify-content-between align-items-center">
					<h5 class="mb-0">일상수다게시판</h5>
				</div>
				<div class="card-body">

					<div class="form-group">
						<label>번호</label><input name="b_seq" class="form-control"
							value='<c:out value="${board.b_seq}"/>' readonly="readonly">
					</div>

					<div class="form-group">
						<label>제목</label><input name="b_title" class="form-control"
							value='<c:out value="${board.b_title}"/>' readonly="readonly">
					</div>

					<div class="form-group">
						<label>내용</label>
						<textarea rows="3" cols="" name="b_content" class="form-control"
							readonly="readonly">
               				<c:out value="${board.b_content}" />
            			</textarea>
					</div>
					<%-- <div class="form-group">
						<label>첨부파일 이미지</label>
						<input type = "file" id= "fileItem" name = 'uploadFile' style="height : 30px;">
						<input name="uploadResult" class="form-control"
							value='<c:out value="${board.b_writer}"/>' readonly="readonly">
						<div id = "uploadResult">
						
						</div>
					</div> --%>


					<div class="form_section">
						<div class="form_section_title">
							<label>image</label>
						</div>
						<div class="form_section_content">

							<!-- <div id="uploadResult">
																		
									</div> -->
						</div>
					</div>



					<div class="form-group">
						<label>작성자</label><input name="b_writer" class="form-control"
							value='<c:out value="${board.b_writer}"/>' readonly="readonly">
					</div>

					<div class='bigPictureWrapper'>
						<div class='bigPicture'></div>

					</div>

					<div style="text-align: center; margin-top: 80px;">
						<button data-oper='modify' class="btn btn-info">Modify</button>
						<button data-oper='list' class="btn btn-info">List</button>
					</div>

					<form id='operForm' action="/board/modify" method="get">

						<input type='hidden' id='b_seq' name='b_seq'
							value='<c:out value="${board.b_seq}"/>'> <input
							type='hidden' name='pageNum'
							value='<c:out value="${cri.pageNum}"/>'> <input
							type='hidden' name='amount'
							value='<c:out value="${cri.amount}"/>'> <input
							type='hidden' name='keyword'
							value='<c:out value="${cri.keyword}"/>'> <input
							type='hidden' name='type' value='<c:out value="${cri.type}"/>'>

					</form>

				</div>
			</div>
		</div>
	</div>
</div>




<style>
.uploadResult {
	width: 100%;
	background-color: gray;
}

.uploadResult ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}

.uploadResult ul li {
	list-style: none;
	padding: 10px;
	align-content: center;
	text-align: center;
}

.uploadResult ul li img {
	width: 100px;
}

.uploadResult ul li span {
	color: white;
}

.bigPictureWrapper {
	position: absolute;
	display: none;
	justify-content: center;
	align-items: center;
	top: 0%;
	width: 100%;
	height: 100%;
	background-color: gray;
	z-index: 100;
	background: rgba(255, 255, 255, 0.5);
}

.bigPicture {
background
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
}

.bigPicture img {
	width: 1200px;
}
</style>

<div class='bigPictureWrapper'>
	<div class='bigPicture'></div>
</div>



<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">

			<div class="panel-heading">Files</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
			
				<div id="uploadResult" class = 'uploadResult'>
					<ul>
					</ul>
				</div>
				<!-- <div class='uploadResult'> 
          >
        </div> -->
			</div>
			<!--  end panel-body -->
		</div>
		<!--  end panel-body -->
	</div>
	<!-- end panel -->
</div>
<!-- /.row -->


<!-- p414 댓글처리 -->
<div class="row">
	<div class="col-lg-12" style="padding-left: 30px;">
		<div class="panel panel-default">
			<!-- <div class="panel-heading">
            <i class = "fa fa-comments fa-fw"></i> Reply</div> -->

			<div class="panel-heading" style="padding-bottom: 20px;">
				<i class="fa fa-comments fa-fw"></i> Reply
				<button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>New
					Reply</button>
			</div>


		</div>

		<!-- /.panel-heading -->
		<div class="panel-body">

			<ul class="chat">
				<!-- start reply -->
				<li class="left clearfix" data-rno='12'>
					<div>
						<div class="header">
							<strong class="primary-font">신봉재</strong> <small
								class="pull-right text-muted">2020-01-01 13:31</small>
						</div>
						<p>배고파</p>
					</div>
			</ul>
			<!-- ./ end ul -->
		</div>
		<!-- /.panel .chat-panel -->
		<!-- p439 추가 -->
		<div class="panel-footer"></div>

	</div>
</div>

<!-- p420 댓글 추가는 모달창을 이용해서 진행 -->
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label>Reply</label> <input class="form-control" name='reply'
						value='New Reply!!!!'>
				</div>
				<div class="form-group">
					<label>Replyer</label> <input class="form-control" name='replyer'
						value='replyer'>
				</div>
				<div class="form-group">
					<label>Reply Date</label> <input class="form-control"
						name='replyDate' value=''>
				</div>

			</div>
			<div class="modal-footer">
				<button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
				<button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
				<button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
				<button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<script type="text/javascript" src="..\resources\javascript\reply.js"></script>

<script type="text/javascript">
	$(document)
			.ready(
					function() {

						/*  (function() { */
						let b_seq = '<c:out value="${board.b_seq}"/>';
						let uploadReslut = $("#uploadResult");

						$
								.getJSON(
										"/board/getAttachList",
										{
											b_seq : b_seq
										},
										function(arr) {

											if (arr.length === 0) {

												let str = "";
												str += "<div id='result_card'>";
												//str += "<img src='/resources/assets/img/main/11.PNG'>";
												str += "</div>";

												uploadReslut.html(str);

												return;
											}

											console.log(arr);

											let str = "";
											let obj = arr[0];

											let fileCallPath = encodeURIComponent(obj.uploadPath
													+ "/s_"
													+ obj.uuid
													+ "_"
													+ obj.fileName);
											str += "<div id='result_card'";
			str += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'";
			str += ">";
											str += "<img src='/display?fileName="
													+ fileCallPath + "'>";
											str += "</div>";

											uploadReslut.html(str);

										});

						/* });();
						}); */
						/* })(); */

						//p415
						var bnoValue = '<c:out value="${board.b_seq}"/>';
						var replyUL = $(".chat");

						showList(1);

						/* p438 댓글의 페이지 추가로 인한 수정. */
						function showList(page) {

							console.log("show list " + page);

							replyService
									.getList(
											{
												b_seq : bnoValue,
												page : page || 1
											},
											function(replyCnt, list) {

												console.log(list);

												if (page == -1) {
													pageNum = Math
															.ceil(replyCnt / 10.0);
													showList(pageNum);
													return;
												}

												var str = "";

												if (list == null
														|| list.length == 0) {
													replyUL.html("");

													return;
												}
												for (var i = 0, len = list.length || 0; i < len; i++) {
													str += "<li class='left clearfix' data-r_seq='"+list[i].r_seq+"'>";
													str += "  <div><div class='header'><strong class='primary-font'>["
															+ list[i].r_seq
															+ "] "
															+ list[i].r_replyer
															+ "</strong>";
													str += "    <small class='pull-right text-muted'>"
															+ replyService
																	.displayTime(list[i].r_replyDate)
															+ "</small></div>";
													str += "    <p>"
															+ list[i].r_reply
															+ "</p></div></li>";
												}

												replyUL.html(str);

												showReplyPage(replyCnt);

											}); //end function
						}//end showList

						//p440
						var pageNum = 1;
						var replyPageFooter = $(".panel-footer");

						function showReplyPage(replyCnt) {

							var endNum = Math.ceil(pageNum / 10.0) * 10;
							var startNum = endNum - 9;

							var prev = startNum != 1;
							var next = false;

							if (endNum * 10 >= replyCnt) {
								endNum = Math.ceil(replyCnt / 10.0);
							}

							if (endNum * 10 < replyCnt) {
								next = true;
							}

							var str = "<ul class='pagination pull-right'>";

							if (prev) {
								str += "<li class='page-item'><a class='page-link' href='"
										+ (startNum - 1)
										+ "'>Previous</a></li>";
							}

							for (var i = startNum; i <= endNum; i++) {

								var active = pageNum == i ? "active" : "";

								str += "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"
										+ i + "</a></li>";
							}

							if (next) {
								str += "<li class='page-item'><a class='page-link' href='"
										+ (endNum + 1) + "'>Next</a></li>";
							}

							str += "</ul></div>";

							console.log(str);

							replyPageFooter.html(str);
						}

						replyPageFooter.on("click", "li a", function(e) {
							e.preventDefault();
							console.log("page click");

							var targetPageNum = $(this).attr("href");

							console.log("targetPageNum: " + targetPageNum);

							pageNum = targetPageNum;

							showList(pageNum);
						});

						/* 이미지 정보 호출 */
						/* /* let bookId = '<c:out value="${board.b_seq}"/>';
						let uploadReslut = $("#uploadResult");			
						
						$.getJSON("/getAttachList", {b_seq : b_seq}, function(arr){	
							
							console.log(arr);
						});
						});
						})();
						
						}); 
							
							/* if(arr.length === 0){
								
								let str = "";
								str += "<div id='result_card'>";
								str += "<img src='/resources/aseets/img/main/11.PNG'>";
								str += "</div>";
								
								uploadReslut.html(str);	
								
								return;
							}
							
							
							let str = "";
							let obj = arr[0];	
							
							let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
							str += "<div id='result_card'";
								str += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'";
								str += ">";
							str += "<img src='/display?fileName=" + fileCallPath +"'>";
							str += "<input type='hidden' name='attachList[0].fileName' value='"+ obj.fileName +"'>";
							str += "<input type='hidden' name='attachList[0].uuid' value='"+ obj.uuid +"'>";
							str += "<input type='hidden' name='attachList[0].uploadPath' value='"+ obj.uploadPath +"'>";				
							str += "</div>";
							
							uploadReslut.html(str);				
							
						});	  */

						var modal = $(".modal");
						var modalInputReply = modal.find("input[name='reply']");
						var modalInputReplyer = modal
								.find("input[name='replyer']");
						var modalInputReplyDate = modal
								.find("input[name='replyDate']");

						var modalModBtn = $("#modalModBtn");
						var modalRemoveBtn = $("#modalRemoveBtn");
						var modalRegisterBtn = $("#modalRegisterBtn");

						$("#addReplyBtn").on("click", function(e) {

							modal.find("input").val("");
							modalInputReplyDate.closest("div").hide(); //.closest 가장 가까운 상위 요소를 선택
							modal.find("button[id !='modalCloseBtn']").hide(); //close버튼 빼고 다 가려라

							//댓글등록시 작성자 보이게
							var memberReply = "${member.m_userid}";
							modalInputReplyer.val(memberReply);

							modalRegisterBtn.show(); //Register 버튼 보여라

							$(".modal").modal("show");

						});

						//댓글 등록
						modalRegisterBtn.on("click", function(e) {

							var reply = {
								r_reply : modalInputReply.val(),
								r_replyer : modalInputReplyer.val(),
								b_seq : bnoValue
							};

							replyService.add(reply, function(result) {

								alert(result);

								modal.find("input").val("");
								modal.modal("hide");

								//showList(1); //추가된 댓글과 새로운 댓글이 가져오기.
								showList(-1);

							});

						});

						$(".chat")
								.on(
										"click",
										"li",
										function(e) {

											var r_seq = $(this).data("r_seq");
											console.log("하이 :" + r_seq);

											replyService
													.get(
															r_seq,
															function(reply) {

																console
																		.log("메롱  ");
																console
																		.log("메롱 : "
																				+ reply.r_reply);

																modalInputReply
																		.val(reply.r_reply);
																modalInputReplyer
																		.val(reply.r_replyer);
																modalInputReplyDate
																		.val(
																				replyService
																						.displayTime(reply.r_replyDate))
																		.attr(
																				"readonly",
																				"readonly");
																modal
																		.data(
																				"r_seq",
																				reply.r_seq);

																modal
																		.find(
																				"button[id !='modalCloseBtn']")
																		.hide();
																modalModBtn
																		.show();
																modalRemoveBtn
																		.show();

																$(".modal")
																		.modal(
																				"show");

															});
										});

						//p427 댓글 수정
						modalModBtn.on("click", function(e) {

							var r_reply = {
								r_seq : modal.data("r_seq"),
								r_reply : modalInputReply.val()
							};

							replyService.update(r_reply, function(result) {

								alert(result);
								modal.modal("hide");
								showList(1);

							});

						});

						//p427 댓글 삭제
						modalRemoveBtn.on("click", function(e) {

							var r_seq = modal.data("r_seq");

							replyService.remove(r_seq, function(result) {
								alert(result);
								modal.modal("hide");
								showList(pageNum);

							});

						}); //end modalRemoveBtn
					});
</script>

<script type="text/javascript">
	$(document).ready(function() {

		var operForm = $("#operForm");

		$("button[data-oper='modify']").on("click", function(e) {
			operForm.attr("action", "/board/modify").submit();
		});

		$("button[data-oper='list']").on("click", function(e) {

			operForm.find("#b_seq").remove();
			operForm.attr("action", "/board/list")
			operForm.submit();
		});
	});
</script>

<script type="text/javascript">
	$(document).ready(function() {

		console.log(replyService);

	});
</script>
<script type="text/javascript">
	$(document).ready(function (e){
		
		$(document).on("click","div",function(e){
			var path = $(this).attr('src')
			showImage(path);
		});//end click event
		
		function showImage(fileCallPath){
		    
		    $(".bigPictureWrapper").on("display","flex").show();
		    
		    $(".bigPicture")
		    .html("<img src='"+fileCallPath+"' >")
		    .animate({width:'100%', height: '100%'}, 1000);
		    
		  }//end fileCallPath
		  
		$(".bigPictureWrapper").on("click", function(e){
		    $(".bigPicture").animate({width:'0%', height: '0%'}, 1000);
		    setTimeout(function(){
		      $('.bigPictureWrapper').hide();
		    }, 1000);
		  });//end bigWrapperClick event
	});
</script>



<%@include file="../includes/footer.jsp"%>