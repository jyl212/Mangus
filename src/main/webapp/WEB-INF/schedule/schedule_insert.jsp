<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<title>스케쥴</title>
<link rel="stylesheet" href="/springProject/resources/assets/css/style.css">
<script type="text/javascript" src="/springProject/resources/assets/js/jquery.js"></script>
<script type="text/javascript" src="/springProject/resources/assets/js/monthly.js"></script>
<script type="text/javascript" src="/springProject/resources/assets/js/bootstrap-switch.js"></script>
<link rel="stylesheet" href="/springProject/resources/assets/css/monthly.css">
<script type="text/javascript">
	$(window).load( function() {

		$('#mycalendar').monthly({
			mode: 'event',
			jsonUrl: '/springProject/resources/json/events.json',
			dataType: 'json'
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
		
		$("#hide").click(function(){
	        $("p").hide();
	    });
	    $("#show").click(function(){
	        $("p").show();
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
<script type="text/javascript">
	function scheduleInsert(){

		$('#schedule_insert_form').submit();
	}

</script>
</head>
<body>
<div class="col-md-12 col-sm-12 col-xs-12" >
<form action="/springProject/schedule/insert.do" id="schedule_insert_form"
									name="schedule_insert_form" method="post">
	<h2 style="text-align: center; height: 50px; margin-bottom: 20px">스케줄 등록</h2>
	<div class="col-md-1 col-sm-1 col-xs-1 oneline-conftrol"></div>
	<div class="col-md-2 col-sm-2 col-xs-2 oneline-conftrol online-lab">

			<label class="online-lab">일정명</label>

	</div>
    <div class="col-md-8 col-sm-8 col-xs-8 oneline-conftrol">

    		<input type="text" class="form-control" name="schedule_title">

    </div>
	<div class="col-md-1 col-sm-1 col-xs-1 oneline-conftrol" ></div>
	<!--  -->
	<div class="col-md-1 col-sm-1 col-xs-1 oneline-conftrol"></div>
	<div class="col-md-2 col-sm-2 col-xs-2 oneline-conftrol online-lab">

			<label class="online-lab">위치</label>

	</div>
    <div class="col-md-8 col-sm-8 col-xs-8 oneline-conftrol">

    		<input type="text" class="form-control" name="schedule_location">

    </div>
	<div class="col-md-1 col-sm-1 col-xs-1 oneline-conftrol" ></div>
	<!--  -->
	<div class="col-md-1 col-sm-1 col-xs-1 oneline-conftrol"></div>
	<div class="col-md-2 col-sm-2 col-xs-2 oneline-conftrol online-lab">

			<label class="online-lab">일시</label>
			
	</div>
    <div class="col-md-8 col-sm-8 col-xs-8 oneline-conftrol">
    	<div class="form-inline" role="form">
			<input type="text" class="form-control"  style="width: 160px;" id="mytarget" value="Select Date">
			
			<input type="hidden" id="schedule_date" name="schedule_date">
			
			<div class="monthly" id="mycalendar2" style="z-index: 2"></div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<select class="form-control" name="schedule_start_clok">
					<c:forEach var="i" begin="1" end="24" step="1">
						<c:choose>
						<c:when test="${i<10 }">
						<option>0${i}</option>
						</c:when>
						<c:otherwise>
						<option>${i}</option>
						</c:otherwise>
						</c:choose>
					</c:forEach>			
			</select>
			시
			<select class="form-control" name="schedule_start_minute">
						 <c:forEach var="j" begin="0" end="59" step="5">
							<c:choose>
							<c:when test="${j<10 }">
							<option>0${j}</option>
							</c:when>
							<c:otherwise>
							<option>${j}</option>
							</c:otherwise>
							</c:choose>
						 </c:forEach>				
			</select>
			분
			&nbsp;&nbsp;&mdash;&nbsp;&nbsp;&nbsp;
			<select class="form-control" name="schedule_end_clok">
					<c:forEach var="i" begin="1" end="24" step="1">
						<c:choose>
						<c:when test="${i<10 }">
						<option>0${i}</option>
						</c:when>
						<c:otherwise>
						<option>${i}</option>
						</c:otherwise>
						</c:choose>
					</c:forEach>			
			</select>
			시
			<select class="form-control" name="schedule_end_minute">
						 <c:forEach var="j" begin="0" end="59" step="5">
							<c:choose>
							<c:when test="${j<10 }">
							<option>0${j}</option>
							</c:when>
							<c:otherwise>
							<option>${j}</option>
							</c:otherwise>
							</c:choose>
						 </c:forEach>				
			</select>
			분
			
		</div>
    </div>
	<div class="col-md-1 col-sm-1 col-xs-1 oneline-conftrol" ></div>
	<!--  -->
    <div class="col-md-1 col-sm-1 col-xs-1 oneline-conftrol"></div>
	<div class="col-md-2 col-sm-2 col-xs-2 oneline-conftrol online-lab">

			<label class="online-lab">일정메모</label>

	</div>
    <div class="col-md-8 col-sm-8 col-xs-8 oneline-conftrol">

    		<textarea style="width: 100%; border: 1; overflow: visible; text-overflow: ellipsis;"
								rows=2 name="schedule_memo"></textarea>

    </div>
	<div class="col-md-1 col-sm-1 col-xs-1 oneline-conftrol" ></div>
    <!-- 한줄설정 -->
	<div class="col-md-1 col-sm-1 col-xs-1 oneline-conftrol"></div>
	<div class="col-md-2 col-sm-2 col-xs-2 oneline-conftrol">

			<label class="control-label online-lab">알람설정 여부</label>

	</div>
	<div class="col-md-8 col-sm-8 col-xs-8 oneline-conftrol" style="padding-top: 5px; padding-right: 100px">
		<div style="z-index: 2" class="switch switch-square" data-on-label="on" 
										  data-off-label="off">
        	<input style="z-index: 1" type="checkbox" name="alarmType"/>
        	<input type="hidden" id="alarm_flag" name="alarm_flag">
        	<input type="hidden" id="id" name="id" value="kind">
        	
        </div>
	</div>
	<div class="col-md-1 col-sm-1 col-xs-1 oneline-conftrol"></div>
	<!--end -->
	<div class="col-md-12 col-sm-12 col-xs-12" style="padding: 20px;">
	
		<div class="col-md-4 col-sm-4 col-xs-4 text-center"></div>
		<div class="col-md-2 col-sm-2 col-xs-2 text-center">
			<button class="btn btn-success"	style="width: 100px; " onclick="scheduleInsert()">작성완료</button>
		</div>
		<div class="col-md-2 col-sm-2 col-xs-2 text-center">
			<button type="reset" class="btn btn-default"
								style="width: 100px;">취소</button>
		</div>
		<div class="col-md-4 col-sm-4 col-xs-4 text-center"></div>
	</div>
</form>


</div>
</body>
</html>