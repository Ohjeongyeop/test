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
						<textarea class="form-control" rows="5" cols="50" readonly="readonly"
							name="content">
							<c:out value="${dto.content }" />
						</textarea>
					</div>
					
					<div class="form-group">
						<label>Writer</label> <input class="form-control"
							readonly="readonly" name="Writer"
							value='<c:out value="${dto.Writer }"/>'>
					</div>
					
					<table width="100%"
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
						<tbody>
							<c:forEach var="dto" items="${list }">
								<tr>
									<td><c:out value="${dto.bno }" /></td>
									<td><a href="/board.get?bno=<c:out value='${dto.bno }'/>">
											<c:out value="${dto.title }" />
									</a></td>
									<td><c:out value="${dto.content }" /></td>
									<td><c:out value="${dto.writer }" /></td>
									<td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss"
											value="${dto.regdate }" /></td>
								</tr>
							</c:forEach>
						</tbody>
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