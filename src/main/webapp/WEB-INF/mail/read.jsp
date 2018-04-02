<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/springProject/resources/assets/css/style.css">
</head>
<body>
	<div class="row mt">
		<div class="col-lg-12">
			<div class="form-panel">
				<h3 class="mb mb" style="text-align: center; margin-bottom: 100px;">
					<i class="fa fa-envelope-o"></i> 메일 읽기
				</h3>
				<form class="form-horizontal style-form" method="get">
					<div class="form-group">
						<label class="col-sm-2 col-sm-2 control-label" style="font-size: 11pt; color: black; text-align: center;">제목</label>
						<div class="col-sm-9" >
							<span class="help-block">${mail.title}</span>
						</div>
						<div class="col-sm-1">

						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 col-sm-2 control-label" style="font-size: 11pt; color: black; text-align: center;">보낸사람</label>
						<div class="col-sm-9" style="border-bottom: 1px solid;">
							<span class="help-block">${mail.id}</span>
						</div>
						<div class="col-sm-1">

						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 col-sm-2 control-label" style="font-size: 11pt; color: black; text-align: center;">받는사람</label>
						<div class="col-sm-9" style="border-bottom: 1px solid;">
							<span class="help-block"> ${mail.rev}</span>
						</div>
						<div class="col-sm-1">

						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 col-sm-2 control-label" style="font-size: 11pt; color: black; text-align: center;">내용</label>
						<div class="col-sm-9" >
							<span class="help-block"> ${mail.text}</span>
						</div>
						<div class="col-sm-1">

						</div>
					</div>
				</form>
			</div>
		</div>
		<!-- col-lg-12-->
	</div>
	<!-- /row -->

</body>
</html>