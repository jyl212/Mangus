<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table class="table">
		<thead>
			<tr>
				<th></th>
				<th>수신자</th>
				<th>메일제목</th>
				<th>보낸 날짜</th>
				<th>수신확인</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="mail" items="${list}">
				<tr>
					<td>
					<c:choose>
						<c:when test="${mail.read eq 'N'}">
							<img src="/springProject/resources/mail/close.PNG" style="width:20px;height:20px;"/>
						</c:when>
						<c:otherwise>
							<img src="/springProject/resources/mail/open.PNG" style="width:20px;height:20px;"/>
						</c:otherwise>
					</c:choose>
					</td>
					<td>${mail.rev}</td>
					<td>${mail.title}</td>
					<td>${mail.send_date}</td>
					<td>${mail.read_date}</td>
					<td><a href="/springProject/mail/delete.do?seq=${mail.mail_seq}">삭제</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>