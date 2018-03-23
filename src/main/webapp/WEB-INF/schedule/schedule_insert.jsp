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
			jsonUrl: '/springProject/resources/json/events1.json',
			dataType: 'json'
		//	xmlUrl: '/springProject/resources/xml/events.xml'
		});

		$('#mycalendar2').monthly({
			mode: 'picker',
			target: '#mytarget',
			setWidth: '230px',
			startHidden: true,
			showTrigger: '#mytarget',
			stylePast: true,
			disablePast: true
		});
		$('#mycalendar1').monthly({
			mode: 'picker',
			target: '#mytarget1',
			setWidth: '230px',
			startHidden: true,
			showTrigger: '#mytarget1',
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
		start_clok = $("select[name=schedule_start_clok]").val()
		start_minute = $("select[name=schedule_start_minute]").val()
		end_clok = $("select[name=schedule_end_clok]").val()
		end_minute = $("select[name=schedule_end_minute]").val()
		datepull = $("input[name=cal1]").val( );
		datespl = datepull.split(' ');
		yun = datespl[0].replace(/[^0-9]/g,"");
		mon = datespl[1].replace(/[^0-9]/g,"");
		il = datespl[2].replace(/[^0-9]/g,"");
		start_time = start_clok.substring(0,2)+":"+start_minute.substring(0,2)
		end_time = end_clok.substring(0,2)+":"+end_minute.substring(0,2)
		start_date = yun+"-"+mon+"-"+il;
		datepul2 = $("input[name=cal2]").val( );
		datesp2 = datepul2.split(' ');
		yun = datesp2[0].replace(/[^0-9]/g,"");
		mon = datesp2[1].replace(/[^0-9]/g,"");
		il = datesp2[2].replace(/[^0-9]/g,"");
		end_date = yun+"-"+mon+"-"+il;
		$("#starttime").val(start_time)
		$("#endtime").val(end_time)
		$("#startdate").val(start_date)
		$("#enddate").val(end_date)
		alarmty = $("input[name=alarmType]:checked").val()
		if(alarmty!="Y"){
			alarmty = "N";
		}
		$("#alarm_flag").val(alarmty)
		$('#schedule_insert_form').submit();
	}
	function colorselect(color){
		$("#color").val(color)

	}
	function setPath(url) {
		location.href = "/springProject/schedule/index.do";
	}

</script>
<style>
 .colorselect1:hover,
 .colorselect1:focus,
 .colorselect1:active,
 .colorselect1.active {
  color: black;
  border: 5px solid;
 }
</style>

</head>
<body>
<div class="col-md-12 col-sm-12 col-xs-12" >
<form action="/springProject/schedule/insert.do" id="schedule_insert_form"
									name="schedule_insert_form" method="post" accept-charset="utf-8">
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
    <div class="col-md-8 col-sm-8 col-xs-8">
    	<div class="col-md-12 col-sm-12 col-xs-12 no-mg-no-pd" style=" text-align: center; color: black;">
    		<div class="col-md-4 col-sm-4 col-xs-4 no-mg-no-pd" style="text-align: center; color: black;">
    			<label style="padding-top: 8px" >시작일시</label>
    		</div>
    		<div class="col-md-4 col-sm-4 col-xs-4" style="">
			<input type="text" class="form-control"  id="mytarget" value="Select Date" name="cal1">
			<div class="monthly" id="mycalendar2" style="z-index: 2"></div>
			</div>
			<div class="col-md-2 col-sm-2 col-xs-2 no-mg-no-pd" style="">
			<select class="form-control" name="schedule_start_clok">
					<c:forEach var="i" begin="1" end="24" step="1">
						<c:choose>
						<c:when test="${i<10 }">
						<option>0${i}시</option>
						</c:when>
						<c:otherwise>
						<option>${i}시</option>
						</c:otherwise>
						</c:choose>
					</c:forEach>			
			</select>
			</div>
			<div class="col-md-2 col-sm-2 col-xs-2 no-mg-no-pd" style="">
			<select class="form-control" name="schedule_start_minute">
						 <c:forEach var="j" begin="0" end="59" step="5">
							<c:choose>
							<c:when test="${j<10 }">
							<option>0${j}분</option>
							</c:when>
							<c:otherwise>
							<option>${j}분</option>
							</c:otherwise>
							</c:choose>
						 </c:forEach>				
			</select>
<!-- 			분&mdash; -->
			</div>
			<div class="col-md-4 col-sm-4 col-xs-4 no-mg-no-pd" style=" text-align: center; color: black;">
    			<label style="padding-top: 8px">종료일시</label>
    		</div>
			<div class="col-md-4 col-sm-4 col-xs-4 " >
			<input type="text" class="form-control"  id="mytarget1" value="Select Date" name="cal2">
			<div class="monthly1" id="mycalendar1" style="z-index: 2"></div>
			</div>
			<div class="col-md-2 col-sm-2 col-xs-2 no-mg-no-pd">
			<select class="form-control" name="schedule_end_clok">
					<c:forEach var="i" begin="1" end="23" step="1">
						<c:choose>
						<c:when test="${i<10 }">
						<option>0${i}시</option>
						</c:when>
						<c:otherwise>
						<option>${i}시</option>
						</c:otherwise>
						</c:choose>
					</c:forEach>			
			</select>
			
			</div>
			<div class="col-md-2 col-sm-2 col-xs-2 no-mg-no-pd">
			<select class="form-control" name="schedule_end_minute">
						 <c:forEach var="j" begin="0" end="59" step="5">
							<c:choose>
							<c:when test="${j<10 }">
							<option>0${j}분</option>
							</c:when>
							<c:otherwise>
							<option>${j}분</option>
							</c:otherwise>
							</c:choose>
						 </c:forEach>				
			</select>
			
			</div>
			
		</div>
    </div>
	<div class="col-md-1 col-sm-1 col-xs-1 oneline-conftrol" ></div>
	<!--  -->
    <div class="col-md-1 col-sm-1 col-xs-1 mb mt" style="height: 70px"></div>
	<div class="col-md-2 col-sm-2 col-xs-2 mb mt" style="height: 70px;text-align: center;"> 

			<label class="online-lab">일정메모</label>

	</div>
    <div class="col-md-8 col-sm-8 col-xs-8 mb mt" style="height: 70px">

    		<textarea style="width: 100%; border: 1; overflow: visible; text-overflow: ellipsis;"
								rows=4 name="schedule_memo"></textarea>

    </div>
	<div class="col-md-1 col-sm-1 col-xs-1 mb mt" style="height: 70px" ></div>
    <!-- 한줄설정 -->
	<div class="col-md-1 col-sm-1 col-xs-1 oneline-conftrol" style="height: 70px"></div>
	<div class="col-md-2 col-sm-2 col-xs-2 oneline-conftrol" style="height: 70px">

			<label class="control-label online-lab">알람설정 여부</label>

	</div>
	<div class="col-md-8 col-sm-8 col-xs-8 oneline-conftrol" style="text-align: left;">
		<div style="z-index: 2" class="switch switch-square" data-on-label="on" 
										  data-off-label="off">
        	<input style="z-index: 1" type="checkbox" name="alarmType" value="Y"/>
        	<input type="hidden" id="alarm_flag" name="alarm_flag">
        	<input type="hidden" id="id" name="id" value="kind">
        	<input type="hidden" id="startdate" name="startdate">
			<input type="hidden" id="starttime" name="starttime">
			<input type="hidden" id="enddate" name="enddate">
			<input type="hidden" id="endtime" name="endtime">
			<input type="hidden" id="alarm_flag" name="alarm_flag">
			<input type="hidden" id="color" name="color">
        </div>
	</div>
	<div class="col-md-1 col-sm-1 col-xs-1 oneline-conftrol"></div>
	<!--end -->
	<div class="col-md-12 col-sm-12 col-xs-12 mb btn-group btn-group-justified" style="padding: 25px; margin-left: 40px ; text-align: center; font-size: 13pt; padding-top: 0px;">
		<span  class="label label-default btn-group" onclick="colorselect('#777777')"> <input type="button" class="label-default colorselect1 form-control"  value="색상 선택"></span>
		<span  class="label label-primary btn-group" onclick="colorselect('#337cbb')"><input type="button" class="label-primary colorselect1 form-control"  value="색상 선택"></span>
		<span  class="label label-success btn-group" onclick="colorselect('#5cb85c')"><input type="button" class="label-success colorselect1 form-control"  value="색상 선택"></span>
		<span  class="label label-info btn-group" onclick="colorselect('#5bc0de')"><input type="button" class="label-info colorselect1 form-control"  value="색상 선택"></span>
		<span  class="label label-warning btn-group" onclick="colorselect('#f0ad4e')"><input type="button" class="label-warning colorselect1 form-control"  value="색상 선택"></span>
		<span  class="label label-danger btn-group" onclick="colorselect('#d9534f')"><input type="button" class="label-danger colorselect1 form-control"  value="색상 선택"></span>
	</div>
	<div class="col-md-12 col-sm-12 col-xs-12" style="padding: 20px;">
	
		<div class="col-md-4 col-sm-4 col-xs-4 text-center"></div>
		<div class="col-md-2 col-sm-2 col-xs-2 text-center">
			<input type="button" class="btn btn-success"	style="width: 100px; " onclick="scheduleInsert()" value="작성완료">
		</div>
		<div class="col-md-2 col-sm-2 col-xs-2 text-center">
			<button type="reset" class="btn btn-default"
								style="width: 100px;" onclick="setPath()" >취소</button>
		</div>
		<div class="col-md-4 col-sm-4 col-xs-4 text-center"></div>
	</div>
</form>


</div>
</body>
</html>