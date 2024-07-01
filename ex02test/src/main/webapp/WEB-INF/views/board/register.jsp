<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>

<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">register</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">전설이 걸은 길, 그 길을 표현한 게시판</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<form action="/board/register" method="post">
						<div class="form-group">
							<label>Title</label> <input class="form-control" name="title" required="required">
						</div>
						<div class="form-group">
							<label>Content</label>
							<textarea class="form-control" rows="3" name="content" required="required"></textarea>
						</div>
						<div class="form-group">
							<label>Writer</label> <input class="form-control"
								 name="writer" required="required">
						</div>


						<button type="button" class="btn btn-success"><a href="/board/list">List</button>
						<button type="submit" class="btn btn-primary">Submit</button>
						<button type="reset" class="btn btn-warning">reset</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../includes/footer.jsp"%>