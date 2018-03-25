<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<h3>${mail.title}</h3>
		<p>보낸사람: ${mail.id}</p>
		<p>받는사람: ${mail.rev}</p>
		<div style="border:solid 1px;">
			<p>${mail.text}</p>
		</div>
	</div>
</body>
</html>