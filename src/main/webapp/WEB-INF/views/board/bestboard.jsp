<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<script>
	//게시판 목록 페이지로 이동하게 하는 함수
	function list(page) {
		console.log("페이지를 이동합니다.");
		location.href = "list.do?curPage=" + page;
	};
</script>





<center>
	<h2>베스트 게시물 게시판</h2>
	<table border="1" width="800px" align="top">
		<center>
			<tr>

				<th>번호</th>
				<th>제목</th>
				<th>내용</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>


				<!-- forEach var = "개별데이터" items = "집합데이터" -->
				<c:forEach items="${map.list}" var="board">
				<%-- <c:forEach var="row" items="${map.list}"> --%>
					<!-- 컨트롤러에서 map안에 list를 넣었기 때문에 이렇게 받는다. -->
					<tr>
						
						<td>${board.b_seq}</td>
						<!-- 글번호 -->
						<!-- 클릭하면 컨트롤러의 view.do로 이동하고, 게시물번호, 페이지 번호, 검색옵션, 키워드를 같이 넘긴다 -->
						<%-- <td><a href="best_board_view.do?member_bno=${row.member_bno}">${row.title}</a>
							<c:if test="${row.rcnt > 0}">
								<span style="color: red;">( ${row.rcnt} )</span>
							</c:if></td> --%>
						<td>${board.b_title}</td>
						<td>${board.b_content}</td>
						<!-- 작성자의 이름 -->
						<td>${board.b_writer}</td>
						<!-- 글의내용 -->
						<%-- <td>${row.reg_date}</td>
						<!-- 날짜의 출력형식을 변경함 -->
						<td>${row.viewcnt}</td>
						<!-- 조회수 -->
						<td>${row.recommend}</td>
						<!-- 추천수 -->

 --%>

					</tr>
				</c:forEach>
	</table>





</center>
<br>

</body>
</html>
