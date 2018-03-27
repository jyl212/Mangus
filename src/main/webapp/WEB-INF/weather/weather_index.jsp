<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE>
<html>
<head>
<link href="/springProject/resources/assets/css/style-responsive.css" rel="stylesheet">
<link rel="stylesheet" href="/springProject/resources/assets/css/style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
<script type="text/javascript" src="/springProject/resources/assets/js/jquery.backstretch.min.js"></script>
<script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="/springProject/resources/assets/js/bootstrap-switch.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
	.fw11{
		font-weight:900;
	}
	#parent{
		position:relative;
	}
	#child{
		position:absolute;
		top:0;
		margin-top:3%;
		margin-left:12%;
		left:0;
		color:white;
		font-weight:900;
		width: 80%;
	}
	#child2{
		position:absolute;
		top:21%;
		left:15%;
		color:white;
		font-weight:900;
		width:80%;
	}
	#child3{
		position:absolute;
		top:38%;
		left:15%;
		color:white;
		font-weight:900;
		width:80%;
	}
	h1{
		font-weight:900;
		font-size:50px;
	}
	h4{
		font-weight:900px;
	}
	h5{
		font-size:15px;
		font-weight:900px;
	}
</style>

</head>
<body>
	<div class="section">
		<div class="container">
			<div class="row fw11" style="margin: 30px;">
				<div class="col-md-12" id="parent">
					<img src="/springProject/resources/weather/dlwndud.png" style="width:100%;height:50%;opacity:0.0;"/>
					<div class="row fw11" id="child">
						<div class="col-md-4 fw11">
							<img src="/springProject/resources/weather/${today.img}"
								style="width: 150px; height: 150px;">
						</div>
						<div class="col-md-8 fw11">
							<div class="row" style="text-align:center;">
								<div class="col-md-6"><h1>${today.sky.name}</h1></div>
								<div class="col-md-6"><h1>${fn:split(today.temperature.tc,'.')[0]}º</h1></div>
							</div>
							<div class="row fw11" style="text-align:center;">
								<div class="col-md-6 fw11" ><h3>
									${fn:split(today.temperature.tmax,'.')[0]}º/${fn:split(today.temperature.tmin,'.')[0]}º</h3></div>
								<div class="col-md-6 fw11"><img src="/springProject/resources/weather/wind_speed.png" style="width:30px;height:30px;float:left;margin-top:18px;">
								<h3 style="float:left;">${today.wind.wspd}m/s</h3></div>
							</div>
							</div>
						</div>
					</div>
					<div class="row fw11" id="child3">
						<div class="col-md-4 fw11">
							<img src="/springProject/resources/weather/${today.img}"
								style="width: 100px; height: 100px; left: 220px;">
							<h4>오늘</h4>
							<h4>${today.sky.name}</h4>
							<h4>${fn:split(today.temperature.tmax,'.')[0]}º/${fn:split(today.temperature.tmin,'.')[0]}º</h4>
							<h4><img src="/springProject/resources/weather/wind_speed.png" style="width:30px;height:30px;float:left;">${today.wind.wspd}m/s</h4>
						</div>
						<div class="col-md-4 fw11">
							<img src="/springProject/resources/weather/${info.imglist[7]}"
								style="width: 100px; height: 100px; left: 220px;">
							<h4>내일</h4>
							<h4>${info.namelist[7]}</h4>
							<h4>${fn:split(info.daysmaxtemp[0],'.')[0]}º/${fn:split(info.daysmintemp[0],'.')[0]}º</h4>
							<h4><img src="/springProject/resources/wenather/wind_speed.png" style="width:30px;height:30px;float:left;">${info.wspdlist[7]}m/s</h4>
						</div>
						<div class="col-md-4 fw11">
							<img src="/springProject/resources/weather/${info.imglist[15]}"
								style="width: 100px; height: 100px; left: 220px;">
							<h4>모레</h4>
							<h4>${info.namelist[15]}</h4>
							<h4>${fn:split(info.daysmaxtemp[1],'.')[0]}º/${fn:split(info.daysmintemp[1],'.')[0]}º</h4>
							<h4><img src="/springProject/resources/weather/wind_speed.png" style="width:30px;height:30px;float:left;">${info.wspdlist[15]}m/s</h4>
						</div>
					</div>
					<div class="row fw11"></div>
				</div>
			</div>
			<div class="row fw11" style="margin-top:30px;" id="child2">
				<div class="col-md-2 fw11">
					<h4>3시간 후</h4>
					<img src="/springProject/resources/weather/${info.imglist[0]}"
						style="width: 50px; height: 50px; left: 30px;">
					<h5>${info.namelist[0]}</h5>
					<h5>${fn:split(info.templist[0],'.')[0]}º / ${info.wspdlist[0]}m/s</h5>
				</div>
				<div class="col-md-2 fw11">
					<h4>6시간 후</h4>
					<img src="/springProject/resources/weather/${info.imglist[1]}"
						style="width: 50px; height: 50px; left: 30px;">
					<h5>${info.namelist[1]}</h5>
					<h5>${fn:split(info.templist[1],'.')[0]}º / ${info.wspdlist[1]}m/s</h5>
				</div>
				<div class="col-md-2 fw11">
					<h4>9시간 후</h4>
					<img src="/springProject/resources/weather/${info.imglist[2]}"
						style="width: 50px; height: 50px; left: 30px;">
					<h5>${info.namelist[2]}</h5>
					<h5>${fn:split(info.templist[2],'.')[0]}º / ${info.wspdlist[2]}m/s</h5>
				</div>
				<div class="col-md-2 fw11">
					<h4>12시간 후</h4>
					<img src="/springProject/resources/weather/${info.imglist[3]}"
						style="width: 50px; height: 50px; left: 30px;">
					<h5>${info.namelist[3]}</h5>
					<h5>${fn:split(info.templist[3],'.')[0]}º / ${info.wspdlist[3]}m/s</h5>
				</div>
				<div class="col-md-2 fw11">
					<h4>15시간 후</h4>
					<img src="/springProject/resources/weather/${info.imglist[4]}"
						style="width: 50px; height: 50px; left: 30px;">
					<h5>${info.namelist[4]}</h5>
					<h5>${fn:split(info.templist[4],'.')[0]}º / ${info.wspdlist[4]}m/s</h5>
				</div>
				<div class="col-md-2 fw11">
					<h4>18시간 후</h4>
					<img src="/springProject/resources/weather/${info.imglist[5]}"
						style="width: 50px; height: 50px; left: 30px;">
					<h5>${info.namelist[5]}</h5>
					<h5>${fn:split(info.templist[5],'.')[0]}º / ${info.wspdlist[5]}m/s</h5>
				</div>
			</div>
			<div class="row fw11" style="margin: 30px;">
				<div class="col-md-3 fw11">
					<img src="/springProject/resources/weather/thermometer.PNG"
						style="width: 200px; height: 200px; left: 220px;">
					<div class="row">
						<h3>체감온도</h3>
						<h4>${wct}</h4>
					</div>
				</div>
				<div class="col-md-3 fw11">
					<img src="/springProject/resources/weather/uv.PNG"
						style="width: 200px; height: 200px; left: 220px;">
					<div class="row">
						<h3>자외선 지수</h3>
						<h4>${uv}</h4>
					</div>
				</div>
				<div class="col-md-3 fw11">
					<img src="/springProject/resources/weather/laundry.PNG"
						style="width: 200px; height: 200px; left: 220px;">
					<div class="row">
						<h3>세탁 지수</h3>
						<h4>${lun}</h4>
					</div>
				</div>
				<div class="col-md-3 fw11">
					<c:choose>
						<c:when test="${th<68}">
							<c:set var="src" value="low.PNG"></c:set>
							<c:set var="comment" value="낮음"></c:set>
						</c:when>
						<c:when test="${th<75}">
							<c:set var="src" value="middle.PNG"></c:set>
							<c:set var="comment" value="보통"></c:set>
						</c:when>
						<c:when test="${th<80}">
							<c:set var="src" value="littlehigh.PNG"></c:set>
							<c:set var="comment" value="높음"></c:set>
						</c:when>
						<c:otherwise>
							<c:set var="src" value="high.PNG"></c:set>
							<c:set var="comment" value="매우높음"></c:set>
						</c:otherwise>
					</c:choose>
					<img src="/springProject/resources/weather/${src}"
						style="width: 200px; height: 200px; left: 220px;">
					<div class="row fw11">
						<h3>불쾌지수</h3>
						<h4>${comment}</h4>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

	<script>
        $.backstretch("/springProject/resources/weather/dlwndud.png", {speed: 500});
    </script>
</html>