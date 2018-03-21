<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">

    <title>스케쥴</title>
	<style type="text/css">
		.monthly {
			box-shadow: 0 13px 40px rgba(0, 0, 0, 0.5);
			font-size: 0.8em;
		}

		input[type="text"] {
			padding: 15px;
			border-radius: 2px;
			font-size: 16px;
			outline: none;
			border: 2px solid rgba(255, 255, 255, 0.5);
			background: rgba(63, 78, 100, 0.27);
			color: #fff;
			width: 250px;
			box-sizing: border-box;
			font-family: "Trebuchet MS", Helvetica, sans-serif;
		}
		input[type="text"]:hover {
			border: 2px solid rgba(255, 255, 255, 0.7);
		}
		input[type="text"]:focus {
			border: 2px solid rgba(255, 255, 255, 1);
			background:#eee;
			color:#222;
		}

		.button {
			display: inline-block;
			padding: 15px 25px;
			margin: 25px 0 75px 0;
			border-radius: 3px;
			color: #fff;
			background: #000;
			letter-spacing: .4em;
			text-decoration: none;
			font-size: 13px;
		}
		.button:hover {
			background: #3b587a;
		}
		.desc {
			max-width: 250px;
			text-align: left;
			font-size:14px;
			padding-top:30px;
			line-height: 1.4em;
		}
		.resize {
			background: #222;
			display: inline-block;
			padding: 6px 15px;
			border-radius: 22px;
			font-size: 13px;
		}
		@media (max-height: 700px) {
			.sticky {
				position: relative;
			}
		}
		@media (max-width: 600px) {
			.resize {
				display: none;
			}
		}
	</style>
	<link rel="stylesheet" href="/springProject/resources/assets/css/monthly.css">
	<script type="text/javascript">
	function insertPath() {

		location.href = "/springProject/schedule/insert.do";
	}
	</script>
</head>
<body>
<div class="page">
	<c:forEach var="schedule" items="${schedulelist}">
		${schedule.schedule_no}
		${schedule.schedule_title}
		${schedule.schedule_location}
		${schedule.schedule_memo}
		${schedule.alarm_flag}
		${schedule.id}
	</c:forEach>
		<h2 style="text-align: center;">나의 스케줄 확인</h2>
		<div style="text-align: center;">
			<div style="width:100%; max-width:600px; display:inline-block; text-align: center;">
				<div class="monthly" id="mycalendar"></div>
			</div>
		</div>
		<br><br>
		<div style="text-align: center;">
			<button class="btn btn-default" onclick="javascript:insertPath()">일정 등록</button>
			
		</div>
		
<!-- 		
		<h2 style="text-align: center;">날짜 선택기</h2>
		<div style="text-align: center;">
			<div style="display:inline-block; width:110px;">
				<input type="text" id="mytarget" value="Select Date">
				<div class="monthly" id="mycalendar2"></div>
			</div>
		</div> -->
</div>
<!-- JS ======================================================= -->
<script type="text/javascript" src="/springProject/resources/assets/js/jquery.js"></script>
<script type="text/javascript" src="/springProject/resources/assets/js/monthly.js"></script>
<script type="text/javascript">
	$(window).load( function() {
		$('#mycalendar').monthly({
			mode: 'event',
			jsonUrl: '/springProject/resources/json/events.json',
			dataType: 'json',
			//xmlUrl: '/springProject/resources/xml/events.xml'
		});

		$('#mycalendar2').monthly({
			mode: 'picker',
			target: '#mytarget',
			setWidth: '250px',
			startHidden: true,
			showTrigger: '#mytarget',
			stylePast: true,
			disablePast: true
		});

	switch(window.location.protocol) {
	case 'http:':
	case 'https:':
	// running on a server, should be good.
	break;
	case 'file:':
	alert('Just a heads-up, events will not work when run locally.');
	}

	});
</script>
</body>
</html>