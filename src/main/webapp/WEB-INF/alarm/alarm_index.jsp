<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">

<title>스케쥴</title>
<link rel="stylesheet" href="/springProject/resources/assets/css/monthly.css">



<link href="/springProject/resources/assets/css/style-responsive.css" rel="stylesheet">
<link rel="stylesheet" href="/springProject/resources/assets/css/style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
<script type="text/javascript" src="/springProject/resources/assets/js/jquery.backstretch.min.js"></script>
<script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="/springProject/resources/assets/js/bootstrap-switch.js"></script>
<script type='text/javascript'>
    function alarmInsert(){
    	var yoil = "";
    	var alarm_date = "";
   		var alarm_time = "";
        $("input[name=yoilselect]:checked").each(function (index) {  
        	yoil += $(this).val() + ",";  
        });
        
        alarm_date = $("input[name=alarm_date]").val( )
        alarm_title = $("input[name=alarm_title]").val()
        alarm_clock = $("select[name=alarm_clok]").val()
        alarm_minute = $("select[name=alarm_minute]").val()
        alarm_time = alarm_clock.substring(0,2)+":"+alarm_minute.substring(0,2);
        
        $("#alarm_time").val(alarm_time);
        $("#yoil").val(yoil);
       
        $('#alarm_insert_form').submit();
     
        return false;
        
    }
    function alarmUpdate(alno){
    	var yoil = "";
    	var alarm_date = "";
   		var alarm_time = "";
        $("input[name=yoilselect]:checked").each(function (index) {  
        	yoil += $(this).val() + ",";  
        });
        alarm_clock = $("select[name=alarm_clok"+alno+"]").val()
        alarm_minute = $("select[name=alarm_minute"+alno+"]").val()
        alarm_time = alarm_clock.substring(0,2)+":"+alarm_minute.substring(0,2);
        
        $("#alarm_time"+alno).val(alarm_time);
        $("#yoil"+alno).val(yoil);
    	$('#alarm_insert_form'+alno).submit();
    }
/* <c:forEach var="alarm" items="${alarmlist}">
	<c:if test='${alarm.alarm_no == alarm_no}'>
		alert(yoil23)
		var yoil23 = "${alarm.yoil}".split(",")
		alert(yoil23)
	</c:if>
</c:forEach> */
</script>
<script type="text/javascript">

	
</script>
</head>
<body onload="getTime()">
	<h1>하하하하하하하하하하하하하하핳하하</h1>
	<div class="no-mg-no-pd">
			<div id="showtime" ></div>
	  			<div class="col-lg-4 col-lg-offset-4">
	  				<div class="lock-screen">
		  				<h2><a data-toggle="modal" href="#make_schedule"><i class="fa fa-clock-o"></i></a></h2>
		  				<p style="color: #ffce43;font-weight: 900;">알람등록</p>
		  				
				          <!-- Modal -->
						<div class="modal fade" id="make_schedule" role="dialog">
							<div class="modal-dialog">
								<!-- Modal content-->
								<form action="/springProject/alarm/insert.do" id="alarm_insert_form"
									name="alarm_insert_form" method="post">
									<div class="modal-content" style="width: 520px; height: 400px; ">
										<div class="modal-header" style="width: 520px; height: 50px; background-color: #6cb33e;">
											<h3 style="text-align: center; margin-top: -10px;color:black; ">알람 등록하기</h3>
										</div>
										<br />
										<div class="col-lg-12 col-md-12 col-sm-12 centered">
											<div class="col-lg-12 col-md-12 col-sm-12 mb">
												<input type="text" id="orgcode"	name="alarm_title" placeholder="알람명" class="form-control" required >
											</div>
											<div class="col-lg-6 col-md-6 col-sm-6" >
												<select class="form-control" name="alarm_clok">
													<c:forEach var="i" begin="1" end="23" step="1">
														<c:choose>
														<c:when test="${i<10}">
												  		<option >0${i}시</option>
												  		</c:when>
												  		<c:otherwise>
												  		<option>${i}시</option>
												  		</c:otherwise>
												  		</c:choose>
													</c:forEach>
												</select>
											</div>
											<div class="col-lg-6 col-md-6 col-sm-6 mb">
												<select class="form-control" name="alarm_minute">
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
										<input type="hidden" id="alarm_time" name="alarm_time">
										<input type="hidden" id="yoil" name="yoil">
										<input type="hidden" id="id" name="id" value="${user.id }">
										<div class="col-lg-12 col-md-12 col-sm-12 centered">
											<label style="color: black; font-weight: 900">요일 선택</label>
										</div>
										<div class="col-lg-12 col-md-12 col-sm-12 mb">
											<div style="z-index: 2; width: 65px" class="switch switch-square" data-on-label="월" 
										  data-off-label="월">
									        	<input style="z-index: 1" type="checkbox" name="yoilselect" value="월" />
									        </div>
									        <div style="z-index: 2;width: 65px" class="switch switch-square" data-on-label="화" 
										  data-off-label="화">
									        	<input style="z-index: 1" type="checkbox" name="yoilselect" value="화"/>
									        </div>
									        <div style="z-index: 2;width: 65px" class="switch switch-square" data-on-label="수" 
										  data-off-label="수">
									        	<input style="z-index: 1" type="checkbox" name="yoilselect" value="수"/>
									        </div>
									        <div style="z-index: 2;width: 65px" class="switch switch-square" data-on-label="목" 
										  data-off-label="목">
									        	<input style="z-index: 1" type="checkbox" name="yoilselect" value="목"/>
									        </div>
									        <div style="z-index: 2;width: 65px" class="switch switch-square" data-on-label="금" 
										  data-off-label="금">
									        	<input style="z-index: 1" type="checkbox" name="yoilselect" value="금"/>
									        </div>
									        <div style="z-index: 2;width: 65px" class="switch switch-square" data-on-label="토" 
										  data-off-label="토">
									        	<input style="z-index: 1" type="checkbox" name="yoilselect" value="토"/>
									        </div>
									        <div style="z-index: 2;width: 65px" class="switch switch-square" data-on-label="일" data-off-label="일">
									        	<input style="z-index: 1" type="checkbox" name="yoilselect" value="일"/>
									        </div>
										</div>
										<div class="col-lg-12 col-md-12 col-sm-12 mt">
											<button type="button"
												class="btn btn-default" data-dismiss="modal" id=""
												onclick="alarmInsert()">등록</button>
											<button  type="button"
												class="btn btn-default" data-dismiss="modal">취소</button>
										</div>
									</div>
								</form>
							</div>
						</div>
				          <!-- modal -->
		  				
		  				
	  				</div>
	  			</div>	
	
	
	
	
	
	
		<div class="col-lg-12 col-md-12 col-sm-12">

		
		</div>
		<c:set var="count" value="2"/>
		<c:forEach var="alarm" items="${alarmlist}">
			
		<div class="col-lg-4 col-md-4 col-sm-4 mb" style="margin-top: 20px;">
			<div class="content-panel pn">
				<div id="profile-01" style="text-align: center; color: white; padding: 0px; font-weight: 900;">
					<h3><label style="padding-right: 10px;">알람명:</label>${alarm.alarm_title}</h3>
					<h5><label style="padding-right: 10px;">설정시간:</label>${alarm.alarm_time}</h5>
					<h6><label style="padding-right: 10px;">설정요일:</label>${alarm.yoil}</h6>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6 profile-ed centered">
					<a data-toggle="modal" href="#update_schedule${alarm.alarm_no}" onclick="alarmslice(${alarm.alarm_no})"><p><i class=" fa fa-edit"></i>알람 수정</p></a>
				</div>
				          <!-- Modal -->
						<div class="modal fade" id="update_schedule${alarm.alarm_no}" role="dialog" style="text-align: center;">
							<div class="modal-dialog">
								<!-- Modal content-->
								<form action="/springProject/alarm/update.do?alarm_no=${alarm.alarm_no}" id="alarm_insert_form${alarm.alarm_no}"
									name="alarm_insert_form${alarm.alarm_no}" method="post">
									<div class="modal-content" style="width: 520px; height: 400px; ">
										<div class="modal-header" style="width: 520px; height: 50px; background-color: #428bca;">
											<h3 style="text-align: center; margin-top: -10px;color:white;">알람 수정</h3>
										</div>
										<br />
										<div class="col-lg-12 col-md-12 col-sm-12 centered">
											<div class="col-lg-12 col-md-12 col-sm-12 mb">
											<input type="text" id="orgcode"
												name="alarm_title" placeholder="알람명" class="form-control" value="${alarm.alarm_title}"
												required >
											</div>
											
<!-- 시간뽑아내는 곳 -->	
											<c:set var="clock_array" value="${fn:split(alarm.alarm_time,':')}"/>
<%-- 											<c:forEach var="tms" items="${clock_array}" varStatus="state">
												<c:if test="${state.index=='0'}">
													<label>${tms}</label>
												</c:if>
												<c:if test="${state.index=='1'}">
													<label>${tms}</label>
												</c:if>
											</c:forEach> --%>

											<div class="col-lg-6 col-md-6 col-sm-6" >
												<select class="form-control" name="alarm_clok${alarm.alarm_no}" id="clo${alarm.alarm_no}" >
													<c:forEach var="i" begin="1" end="23" step="1">
														<c:choose>
														<c:when test="${i<10 }">
												  		<option value="0${i}시" 
												  		<c:forEach var="tms" items="${clock_array}" varStatus="state">
															<c:if test="${state.index=='0'}">
																<c:if test="${'0'+i==tms}">selected="selected"</c:if> 
															</c:if>
														</c:forEach>	  		
												  		>0${i}시</option>
												  		</c:when>
												  		<c:otherwise>
												  		<option value="${i}시"
												  		<c:forEach var="tms" items="${clock_array}" varStatus="state">
															<c:if test="${state.index=='0'}">
																<c:if test="${i==tms}">selected="selected"</c:if> 
															</c:if>
														</c:forEach>
												  		>${i}시</option>
												  		</c:otherwise>
												  		</c:choose>
													</c:forEach>
												</select>
											</div>
											<div class="col-lg-6 col-md-6 col-sm-6 mb">
												<select class="form-control" name="alarm_minute${alarm.alarm_no}" id="minu${alarm.alarm_no}">
													<c:forEach var="j" begin="0" end="59" step="5">
														<c:choose>
														<c:when test="${j<10 }">
												  		<option
												  		<c:forEach var="tms" items="${clock_array}" varStatus="state">
															<c:if test="${state.index=='1'}">
																<c:if test="${'0'+j==tms}">selected="selected"</c:if> 
															</c:if>
														</c:forEach>
												  		>0${j}분</option>
												  		</c:when>
												  		<c:otherwise>
												  		<option
												  		<c:forEach var="tms" items="${clock_array}" varStatus="state">
															<c:if test="${state.index=='1'}">
																<c:if test="${j==tms}">selected="selected"</c:if> 
															</c:if>
														</c:forEach>
												  		>${j}분</option>
												  		</c:otherwise>
												  		</c:choose>
													</c:forEach>
												</select>
											</div>
										</div>
										<input type="hidden" id="alarm_time${alarm.alarm_no}" name="alarm_time">
										<input type="hidden" id="yoil${alarm.alarm_no}" name="yoil">
										<input type="hidden" id="id${alarm.alarm_no}" name="id" value="${user.id}">
										<div class="col-lg-12 col-md-12 col-sm-12 centered">
											<label style="color: black; font-weight: 900">요일 선택</label>
										</div>
							<!-- 요일 뽑아내는곳 -->
										<div class="col-lg-12 col-md-12 col-sm-12 mb">
											<div style="z-index: 2; width: 65px" class="switch switch-square"  data-on-label="월" 
										  data-off-label="월">
									        	<input style="z-index: 1" type="checkbox" name="yoil" id="mon${alarm.alarm_no}" value="월"
												<c:set var="yoilck_array" value="${fn:split(alarm.yoil,',')}"/>
												<c:forEach var="yoils" items="${yoilck_array}">
													<c:if test="${yoils  eq '월'}">
													checked="checked"
													</c:if>
												</c:forEach>
									        	 />
									        </div>
									        <div style="z-index: 2;width: 65px" class="switch switch-square" data-on-label="화" 
										  data-off-label="화">
									        	<input style="z-index: 1" type="checkbox" name="yoil" id="tue${alarm.alarm_no}" value="화"
									        	<c:set var="yoilck_array" value="${fn:split(alarm.yoil,',')}"/>
												<c:forEach var="yoils" items="${yoilck_array}">
													<c:if test="${yoils  eq '화'}">
													checked="checked"
													</c:if>
												</c:forEach>
									        	/>
									        </div>
									        <div style="z-index: 2;width: 65px" class="switch switch-square" data-on-label="수" 
										  data-off-label="수">
									        	<input style="z-index: 1" type="checkbox" name="yoil" id="wen${alarm.alarm_no}" value="수"
									        	<c:set var="yoilck_array" value="${fn:split(alarm.yoil,',')}"/>
												<c:forEach var="yoils" items="${yoilck_array}">
													<c:if test="${yoils  eq '수'}">
													checked="checked"
													</c:if>
												</c:forEach>
									        	
									        	/>
									        </div>
									        <div style="z-index: 2;width: 65px" class="switch switch-square" data-on-label="목" 
										  data-off-label="목">
									        	<input style="z-index: 1" type="checkbox" name="yoil" id="thu${alarm.alarm_no}" value="목"
									        	<c:set var="yoilck_array" value="${fn:split(alarm.yoil,',')}"/>
												<c:forEach var="yoils" items="${yoilck_array}">
													<c:if test="${yoils  eq '목'}">
													checked="checked"
													</c:if>
												</c:forEach>
									        	/>
									        </div>
									        <div style="z-index: 2;width: 65px" class="switch switch-square" data-on-label="금" 
										  data-off-label="금">
									        	<input style="z-index: 1" type="checkbox" name="yoil" id="fri${alarm.alarm_no}" value="금"
									        	<c:set var="yoilck_array" value="${fn:split(alarm.yoil,',')}"/>
												<c:forEach var="yoils" items="${yoilck_array}">
													<c:if test="${yoils  eq '금'}">
													checked="checked"
													</c:if>
												</c:forEach>
									        	/>
									        </div>
									        <div style="z-index: 2;width: 65px" class="switch switch-square" data-on-label="토" 
										  data-off-label="토">
									        	<input style="z-index: 1" type="checkbox" name="yoil" id="sat${alarm.alarm_no}" value="토"
									        	<c:set var="yoilck_array" value="${fn:split(alarm.yoil,',')}"/>
												<c:forEach var="yoils" items="${yoilck_array}">
													<c:if test="${yoils  eq '토'}">
													checked="checked"
													</c:if>
												</c:forEach>
									        	/>
									        </div>
									        <div style="z-index: 2;width: 65px" class="switch switch-square" data-on-label="일" 
										  data-off-label="일">
									        	<input style="z-index: 1" type="checkbox" name="yoil" id="sun${alarm.alarm_no}" value="일"
									        	<c:set var="yoilck_array" value="${fn:split(alarm.yoil,',')}"/>
												<c:forEach var="yoils" items="${yoilck_array}">
													<c:if test="${yoils  eq '일'}">
													checked="checked"
													</c:if>
												</c:forEach>
									        	/>
									        </div>
										</div>

										<div class="col-lg-12 col-md-12 col-sm-12 mt">
											<button type="button"
												class="btn btn-default" data-dismiss="modal" id=""
												onclick="alarmUpdate(${alarm.alarm_no})">수정</button>
											<button  type="button"
												class="btn btn-default" data-dismiss="modal">취소</button>
										</div>
									</div>
								</form>
							</div>
						</div>
				          <!-- modal -->


				<div  class="col-lg-6 col-md-6 col-sm-6 profile-01 centered">
					<p><i class="fa fa-trash-o "></i>알람 삭제</p>
				</div>
				<div class="centered">

				</div>
			</div>
		</div>

		</c:forEach>
		
<%-- 		증가하는 부분
		<c:set var="count" value="${count+1 }"/>
		<script type="text/javascript">
			alert(${count});
		</script> 
		
		--%>
		
<!-- 		<div class="col-lg-4 col-md-4 col-sm-4 mb" style="margin-top: 20px;">
			<div class="content-panel pn">
				<div id="profile-01">
					<h3>알람 제목</h3>
					<h6>시간</h6>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6 profile-ed centered">
					<p><i class=" fa fa-edit"></i>알람 수정</p>
				</div>
				<div  class="col-lg-6 col-md-6 col-sm-6 profile-01 centered">
					<p><i class="fa fa-trash-o "></i>알람 삭제</p>
				</div>
				<div class="centered">
				</div>
			</div>
		</div> -->
		
		
	</div>
	<!-- JS ======================================================= -->


	
	<script>
        $.backstretch("/springProject/resources/assets/images/weather.jpg", {speed: 500});
    </script>

    <script>
        function getTime()
        {
            var today=new Date();
            var h=today.getHours();
            var m=today.getMinutes();
            var s=today.getSeconds();
            // add a zero in front of numbers<10
            m=checkTime(m);
            s=checkTime(s);
            document.getElementById('showtime').innerHTML=h+":"+m+":"+s;
            t=setTimeout(function(){getTime()},500);
        }

        function checkTime(i)
        {
            if (i<10)
            {
                i="0" + i;
            }
            return i;
        }
        
    </script>
</body>
</html>