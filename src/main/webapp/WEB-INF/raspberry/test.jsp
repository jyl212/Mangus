<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#ajaxbtn").on("click", function() {
			$.ajax({
				async : true,
				url : "/springProject/rasp.do",
				type : "get",
				dataType : "text",
				success : success_run
			});
		});
	});
	function success_run(data) {
		alert(data);
		$("#result").text(data);
	}
</script>
</head>
<body>
	<div>
		<input type="button" id="ajaxbtn" value="test"/>
		<p id="result"></p>
	</div>
</body>
</html>