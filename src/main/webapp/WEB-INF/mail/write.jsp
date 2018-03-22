<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Mail</title>
</head>
<body>
	<form class="form-horizontal" method="post" action="/springProject/mail/send.do">
		<div class="form-group">
			<div class="col-md-2 text-right">
				<label for="id" class="control-label">작성자</label>
			</div>
			<div class="col-md-8">
				<input type="text" readonly="readonly" class="form-control input-lg" name="sender" id="sender" value="${user.mail}"/>
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-2 text-right">
				<label for="id" class="control-label">받는 사람</label>
			</div>
			<div class="col-md-8">
				<c:choose>
				<c:when test="${rev eq null }">
					<input type="text" class="form-control input-lg" name="receiver" id="receiver">
				</c:when>
				<c:otherwise>
					<input type="text" class="form-control input-lg" name="receiver" id="receiver" value="${rev}">
				</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-2 text-right">
				<label for="title" class="control-label">제목</label>
			</div>
			<div class="col-md-8">
				<input type="text" class="form-control input-lg" name="title"
					id="title" placeholder="제목">
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-2 text-right">
				<label for="text" class="control-label">내용</label>
			</div>
			<div class="col-md-8">
				<textarea class="form-control" rows="20" name="text" id="text"></textarea>
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-10 text-center">
				<input type="submit" class="btn btn-lg btn-primary" value="보내기">

				<button type="button" class="btn btn-danger btn-lg"
					onclick="javascript:cancelCheck()">
					<i class="fa fa-fw fa-close"></i> 취소
				</button>
			</div>
		</div>
		<input type="hidden" value="${user.password}" id="userpassword" name="userpassword"/>
		<input type="hidden" value="${user.id}" id="userid" name="userid"/>
	</form>
</body>
</html>