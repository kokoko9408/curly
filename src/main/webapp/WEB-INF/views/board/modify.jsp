<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>


<style type="text/css">
#
img {
	max-width: 100%;
	height: auto;
	display: block;
	padding: 5px;
	margin-top: 10px;
	margin: auto;
}

#result_card {
	position: relative;
}

.imgDeleteBtn {
	position: absolute;
	top: 0;
	right: 5%;
	background-color: #ef7d7d;
	color: wheat;
	font-weight: 900;
	width: 30px;
	height: 30px;
	border-radius: 50%;
	line-height: 26px;
	text-align: center;
	border: none;
	display: block;
	cursor: pointer;
}
</style>


<div class="container-xxl flex-grow-1 container-p-y">
	<h4 class="fw-bold py-3 mb-4">
		<span class="text-muted fw-light">수정/</span> 일상수다게시판
	</h4>

	<!-- 등록 -->
	<div class="row">
		<div class="col-xl">
			<div class="card mb-4">
				<div
					class="card-header d-flex justify-content-between align-items-center">
					<h5 class="mb-0">일상수다게시판</h5>
					<!-- <small class="text-muted float-end">Default label</small> -->
				</div>



				<div class="card-body">
					<form role="form" action="/board/modify" method="post">
						<div class="mb-3">
							<label>번호</label><input name="b_seq" class="form-control"
								value='<c:out value="${board.b_seq}"/>' readonly="readonly">
						</div>

						<div class="mb-3">
							<label>제목</label><input name="b_title" class="form-control"
								value='<c:out value="${board.b_title}"/>'>
						</div>

						<div class="mb-3">
							<label class="form-label" for="basic-default-company">내용</label>
							<textarea rows="3" cols="" name="b_content" class="form-control">
               				<c:out value="${board.b_content}" />
           					</textarea>
						</div>
						<div class="form_section">
							<div class="form_section_title">
								<label>image</label>
							</div>
							<div class="form_section_content">
								<input type="file" id="fileItem" name='uploadFile' multiple
									style="height: 30px;">
								<div id="uploadResult"></div>
							</div>
						</div>
						<div class="mb-3">
							<label>작성자</label><input name="b_writer" class="form-control"
								value='<c:out value="${board.b_writer}"/>' readonly="readonly">
						</div>
						<div style="text-align: center;">
							<button type="submit" data-oper='modify' class="btn btn-danger">Modify</button>
							<button type="submit" data-oper='remove' class="btn btn-danger">Remove</button>
							<button type="submit" data-oper='list' class="btn btn-info">List</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>



<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form");

		$("button").on("click", function(e) {
			e.preventDefault();

			var operation = $(this).data("oper"); //data-oper(modify,remove,list 중에서)

			console.log(operation);

			if (operation === 'remove') {
				formObj.attr("action", "/board/remove");
			} else if (operation === 'list') {

				formObj.attr("action", "/board/list").attr("method", "get");

				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone();
				var keywordTag = $("input[name='keyword']").clone();
				var typeTag = $("input[name='type']").clone();

				formObj.empty();

				formObj.append(pageNumTag);
				formObj.append(amountTag);
				formObj.append(keywordTag);
				formObj.append(typeTag);

			}

			formObj.submit();
		});
	
		/* 
		/* 기존 이미지 출력 */
		let b_seq = '<c:out value="${board.b_seq}"/>';
		let uploadResult = $("#uploadResult");
		
		$.getJSON("/board/getAttachList", {b_seq : b_seq}, function(arr){
			
			console.log(arr);
			
			if(arr.length === 0){
				
				
				let str = "";
				str += "<div id='result_card'>";
				//str += "<img src='/resources/img/goodsNoImage.png'>";
				str += "</div>";
				
				uploadResult.html(str);				
				return;
			}
			
			let str = "";
			let obj = arr[0];
			
			let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
			str += "<div id='result_card'";
			str += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'";
			str += ">";
			str += "<img src='/display?fileName=" + fileCallPath +"'>";
			str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
			str += "<input type='hidden' name='attachList[0].fileName' value='"+ obj.fileName +"'>";
			str += "<input type='hidden' name='attachList[0].uuid' value='"+ obj.uuid +"'>";
			str += "<input type='hidden' name='attachList[0].uploadPath' value='"+ obj.uploadPath +"'>";				
			str += "</div>";
			
			uploadResult.html(str);			
			
		});// GetJSON
	});
	
	/* 이미지 삭제 버튼 동작 */
	$("#uploadResult").on("click", ".imgDeleteBtn", function(e){
		
		deleteFile();
		
	});
	
	/* 파일 삭제 메서드 */
	function deleteFile(){
		
		let targetFile = $(".imgDeleteBtn").data("file");
		
		let targetDiv = $("#result_card");
		
		$.ajax({
			url: '/deleteFile',
			data : {fileName : targetFile},
			dataType : 'text',
			type : 'POST',
			success : function(result){
				console.log(result);
				
				targetDiv.remove();
				$("input[type='file']").val("");
				
			},
			error : function(result){
				console.log(result);
				
				alert("파일을 삭제하지 못하였습니다.")
			}
		});
	}
	
	/* 이미지 업로드 */
	$("input[type='file']").on("change", function(e){
		
		/* 이미지 존재시 삭제 */
		if($(".imgDeleteBtn").length > 0){
			deleteFile();
		}
				
		let formData = new FormData();
		let fileInput = $('input[name="uploadFile"]');
		let fileList = fileInput[0].files;
		let fileObj = fileList[0];
		
		if(!fileCheck(fileObj.name, fileObj.size)){
			return false;
		}
		
		formData.append("uploadFile", fileObj);
		
		$.ajax({
			url: '/board/registerAction',
	    	processData : false,
	    	contentType : false,
	    	data : formData,
	    	type : 'POST',
	    	dataType : 'json',
	    	success : function(result){
	    		console.log(result);
	    		showUploadImage(result);
	    	},
	    	error : function(result){
	    		alert("이미지 파일이 아닙니다.");
	    	}
		});		

		
	});
		
	/* var, method related with attachFile */
	let regex = new RegExp("(.*?)\.(jpg|png)$");
	let maxSize = 1048576; //1MB	
	
	function fileCheck(fileName, fileSize){

		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
			  
		if(!regex.test(fileName)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		
		return true;		
		
	}
	
	/* 이미지 출력 */
	function showUploadImage(uploadResultArr){
		
		/* 전달받은 데이터 검증 */
		if(!uploadResultArr || uploadResultArr.length == 0){return}
		
		let uploadResult = $("#uploadResult");
		
		let obj = uploadResultArr[0];
		
		let str = "";
		
		let fileCallPath = encodeURIComponent(obj.uploadPath.replace(/\\/g, '/') + "/s_" + obj.uuid + "_" + obj.fileName);
		//replace 적용 하지 않아도 가능
		//let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
		
		str += "<div id='result_card'>";
		str += "<img src='/display?fileName=" + fileCallPath +"'>";
		str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
		str += "<input type='hidden' name='attachList[0].fileName' value='"+ obj.fileName +"'>";
		str += "<input type='hidden' name='attachList[0].uuid' value='"+ obj.uuid +"'>";
		str += "<input type='hidden' name='attachList[0].uploadPath' value='"+ obj.uploadPath +"'>";		
		str += "</div>";		
		
   		uploadResult.append(str);     
        
	} 
</script>
<%@include file="../includes/footer.jsp"%>
