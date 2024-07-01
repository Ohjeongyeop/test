<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 상대 경로를 유일하게 쓰는 곳 -->
<%@include file="../includes/header.jsp"%>

<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Tables</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					DataTables Advanced Tables
					<button id="regBtn" type="button" class="btn btn-primary">Register</button>
				</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<div class="form-group">
						<label>BNO</label> <input class="form-control" readonly="readonly"
							name="bno" value='<c:out value="${dto.bno }"/>'>
					</div>
					<div class="form-group">
						<label>Title</label> <input class="form-control"
							readonly="readonly" name="title"
							value='<c:out value="${dto.title }"/>'>
					</div>

					<div class="form-group">
						<label>Content</label>
						<textarea class="form-control" rows="5" cols="50"
							readonly="readonly" name="content">
							<c:out value="${dto.content }" />
						</textarea>
					</div>

					<div class="form-group">
						<label>Writer</label> <input class="form-control"
							readonly="readonly" name="Writer"
							value='<c:out value="${dto.Writer }"/>'>
					</div>

					<table id="boardTable" width="100%"
						class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>BNO</th>
								<th>TITLE</th>
								<th>CONTENT</th>
								<th>WRITER</th>
								<th>REGDATE</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
					<!-- /.table-responsive -->
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-12 -->
	</div>

</div>
<!-- /#page-wrapper -->

<!-- 사용자에 보여줄 안내 문구 창 -->
<div id="myModal" class="modal" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Modal title</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<p>Modal body text goes here.</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">
	$(document).ready(
			function() {
				loadTable();

				let result = '<c:out value="${result }"/>';
				console.log("result" + result);

				checkModal(result);

				// 웹브라우저의 주소 세션 정보 초기화
				history.replaceState({}, null, null);

				function checkModal(result) {
					if (result === '' || history.state) {
						console.log("result가 없음");
						return;
					}
					if (result === "success") {
						// 수정 또는 삭제된 행이 존재함.
						$(".modal-body").html("정상적으로 처리되었습니다.");
					} else if (parseInt(result) > 0) {
						// 글등록 시 bno가 잘 받아진 경우
						$(".modal-body").html(
								parseInt(result) + "번 글이 등록되었습니다.");
					}

					$("#myModal").modal("show");
				}

				$("#regBtn").click(function() {
					// self: 현재 window 창, location: URL 변경 -> 페이지 이동
					self.location = "/board/register";
				});

				function loadTable() {
					$.ajax({
						url : "/board/getlist",
						type : "POST",
						dataType : "json",
						success : function(data) {
							// data의 타입 Array
							var boardTbody = $("#boardTable tbody"); // 테이블 본문(tbody) 요소 저장
							boardTbody.empty(); // 테이블 본문을 비워서 기존 데이터 삭제

							// 서버에서 전달받은 Array를 반복적으로 화면에 출력
							$.each(data, function(index, board) {

								var row = $("<tr>"); // 새로운 테이블의 행 요소(tr태그) 생성
								row.append($("<td>").text(board.bno)); // tr에 게시글 번호가 담긴 td 추가

								// 게시글 제목을 누르면 상세보기로 이동해야하므로 링크(a태그)요소를 만들어서 url 등록
								var titleLink = $("<a>").attr("href",
										"/board/get?bno=" + board.bno).text(
										board.title);
								var titleTd = $("<td>").append(titleLink); // a태그를 td태그에 추가
								row.append(titleTd); // tr에 제목이 담긴 td 추가

								row.append($("<td>").text(board.content)); // tr에 내용이 담긴 td 추가
								row.append($("<td>").text(board.writer)); // tr에 작성자가 담긴 td 추가

								var parseDate = new Date(board.regdate); // DB에 저장된 등록 날짜를 Date객체로 변환
								// numeric: 2024-7, 2-digit: 24-07
								var options = {
									year : "numeric",
									month : "2-digit",
									day : "2-digit",
									hour : "2-digit",
									minute : "2-digit"
								};
								var formattedDate = parseDate.toLocaleString(
										 options); // 날짜 형식을 한국 시간 형식과 지정 옵션으로 변환

								row.append($("<td>").text(formattedDate)); // tr에 등록 날짜가 담긴 td 추가

								boardTbody.append(row); // 생성한 tr 요소를 테이블 본문에 추가
							});
						},
						error : function(e) {
							console.log("실패");
							console.log(e);
						}
					});
				}
			});
</script>

<%@include file="../includes/footer.jsp"%>
