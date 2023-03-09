<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<style type="text/css">
# img {
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
		<span class="text-muted fw-light">등록/</span> 일상수다게시판
	</h4>

	<!-- 등록 -->
	<div class="row">
		<div class="col-xl">
			<div class="card mb-4">
				<div class="card-header d-flex justify-content-between align-items-center">
					<h5 class="mb-0">일상수다게시판</h5>
				</div>
				<div class="card-body">
					<form role="form" action="/board/register" method="post">
						<div class="mb-3">
							<label class="form-label" for="basic-default-fullname">제목</label>
							<input class="form-control" name='b_title'>
						</div>
						<div class="mb-3">
							<label class="form-label" for="basic-default-company">내용</label>
							<textarea class="form-control" rows="3" name='b_content'></textarea>
						</div>
						<div class="mb-3">
							<div><label class="form-label" for="basic-default-company">image</label></div>
							<input type="file" id="fileItem" name='uploadFile' multiple
								style="height: 30px;">
								<div id = "uploadResult">
							
						</div>
						</div>


						<div class="mb-3">
							<label class="form-label" for="basic-default-fullname">작성자</label>
							<input class="form-control" name='b_writer'
								value="${member.m_userid}">
						</div>

						<%-- <div class ="form-group">
                        <label style="color:black;">작성자</label> <input name="writer" class="form-control" 
                        value="${member.memberId}">
                        </div> --%>

						<div style="text-align: center; margin-top: 80px;">
							<button type="submit" class="btn btn-primary">Send</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">
	/* 이미지 업로드 */
	$("input[type='file']").on("change", function(e) {
		//alert("동작");
		
		/* 이미지 존재시 삭제 */
		if($(".imgDeleteBtn").length > 0){
			deleteFile();
		}
		

		let formData = new FormData();
		let fileInput = $('input[name="uploadFile"]');
		let fileList = fileInput[0].files;
		let fileObj = fileList[0]; //어떠한 객체인지 확인

		console.log("첨부파일List : " + fileList);
		console.log("fileObj : " + fileObj);
		console.log("fileName : " + fileObj.name);
		console.log("fileSize : " + fileObj.size);
		console.log("fileType(MimeType) : " + fileObj.type);

		/* 이미지 파일 아닌 다른 파일 전송하는 것 체크하기 위해 주석처리 시키기 */
		 if(!fileCheck(fileObj.name, fileObj.size)){
			return false;
		}

		//alert("합격");
		/* formData.append("uploadFile", fileObj); */

		for (let i = 0; i < fileList.length; i++) {
			formData.append("uploadFile", fileList[i]);
		}
		//uploadFile이라는 key이름과 url 매핑 메서드의 매개변수명이 같아야

		//ajax이용해 서버로 전송하는 코드 작성
		/* ajax코드에서는 processData와 contenttype의 속성 값을 'false'로 해줘야한 첨부파일이
		서버로 전송됨. */
		$.ajax({
			url : '/board/registerAction',
			processData : false,
			contentType : false,
			data : formData,
			type : 'POST',
			dataType : 'json',
			success : function(result) {
				console.log(result);
				showUploadImage(result);
			},
			error : function(result) {
				alert("이미지파일이아니므니다")
			}
		});

	});

	/* var, method related with attachFile */
	/* 변수로 지정한 두 가지 조건을 만족하지 못하면 경고문구와 함께 false반환, 두 가지 만족 시 true 반환 */

	let regex = new RegExp("(.*?)\.(jpg|png)$");
	let maxSize = 1048576; //1MB	

	function fileCheck(fileName, fileSize) {

		if (fileSize >= maxSize) {
			alert("파일 사이즈 초과");
			return false;
		}

		if (!regex.test(fileName)) {
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}

		return true;

	}

	/* 이미지 출력 */
	function showUploadImage(uploadResultArr) {

		/* 전달받은 데이터 검증 */
		if (!uploadResultArr || uploadResultArr.length == 0) {
			return
		}

		let uploadResult = $("#uploadResult");
		let obj = uploadResultArr[0];
		let str = "";

		let fileCallPath = obj.uploadPath.replace(/\\/g, '/') + "/s_" + obj.uuid + "_" + obj.fileName;

		str += "<div id='result_card'>";
		str += "<img src='/display?fileName=" + fileCallPath + "'>";
		str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
		str += "<input type='hidden' name='attachList[0].fileName' value='"+ obj.fileName +"'>";
		str += "<input type='hidden' name='attachList[0].uuid' value='"+ obj.uuid +"'>";
		str += "<input type='hidden' name='attachList[0].uploadPath' value='"+ obj.uploadPath +"'>";		
		str += "</div>";
		
		uploadResult.append(str);     

	}
	
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
	
</script>



</body>
</html>
