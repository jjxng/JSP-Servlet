<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
<%@ include file="include/header.jsp" %>
<div class="container">
	<div class="row">
	<div class="col-md-12">
		<form method="post" action="writeAction.jsp">
			<table class="table table-striped">
			<br />
				<thead>
					<tr>
						<th colspan="2" style="background-color: #acd5b8; text-align: center;">게시판 글쓰기 양식</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="background-color: #d2e7d6;">
						<input type="text" class="form-control" placeholder=" 글 제목" name="title" maxlength="200"></td>
					</tr>
					<tr>
						<td style="background-color: #d2e7d6;">
						<textarea class="form-control" placeholder=" 글 내용" name="content" maxlength="2048" rows="15" style="height: 350px"></textarea></td>
					</tr>
				</tbody>
			</table>
			<div class="d-flex justify-content-end mt-5 mb-5">
				<input type="submit" class="btn btn-secondary pull-right" value="글쓰기">
			</div>
		</form>
	</div>
	</div>
</div>
<%@ include file="include/footer.jsp" %>
</body>
</html>