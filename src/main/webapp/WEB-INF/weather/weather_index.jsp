<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">



</head>
<body>
	<div class="section">
		<div class="container">
			<div class="row" style="margin: 30px;">
				<div class="col-md-12">
					<img src="/springProject/resources/weather/background.jpg" style="width:100%;height:30%;opacity:0.7; position:relative;z-index:1;"/>
					<div class="row">
						<div class="col-md-6">
							<img src="/springProject/resources/weather/${today.img}"
								style="width: 200px; height: 200px; left: 70px;top:-100px;left:0px; position:absolute;z-index:2">
						</div>
						<div class="col-md-6" style="padding: 60px;">
							<h3>${today.sky.name}</h3>
							<h4>현재 기온 : ${today.temperature.tc}</h4>
							<h4>최저/최고 기온 :
								${today.temperature.tmax}/${today.temperature.tmin}</h4>
							<h4>풍속 : ${today.wind.wspd}m/s</h4>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<img src="/springProject/resources/weather/${today.img}"
								style="width: 200px; height: 200px; left: 220px;">
							<h3>오늘</h3>
							<h4>${today.sky.name}</h4>
							<h4>최고/최저 기온 :
								${today.temperature.tmax}/${today.temperature.tmin}</h4>
							<h4>풍속 : ${today.wind.wspd}m/s</h4>
						</div>
						<div class="col-md-4">
							<img src="/springProject/resources/weather/${info.imglist[7]}"
								style="width: 200px; height: 200px; left: 220px;">
							<h3>내일</h3>
							<h4>${info.namelist[7]}</h4>
							<h4>최고/최저 기온 : ${info.daysmaxtemp[0]}/${info.daysmintemp[0]}</h4>
							<h4>풍속 : ${info.wspdlist[7]}m/s</h4>
						</div>
						<div class="col-md-4">
							<img src="/springProject/resources/weather/${info.imglist[15]}"
								style="width: 200px; height: 200px; left: 220px;">
							<h3>모레</h3>
							<h4>${info.namelist[15]}</h4>
							<h4>최고/최저 기온 : ${info.daysmaxtemp[1]}/${info.daysmintemp[1]}</h4>
							<h4>풍속 : ${info.wspdlist[15]}m/s</h4>
						</div>
					</div>
					<div class="row"></div>
				</div>
			</div>
			<div class="row" style="margin: 30px;">
				<div class="col-md-2">
					<h4>3시간 후</h4>
					<img src="/springProject/resources/weather/${info.imglist[0]}"
						style="width: 50px; height: 50px; left: 30px;">
					<h4>${info.namelist[0]}</h4>
					<h4>${info.templist[0]}</h4>
					<h4>${info.wspdlist[0]}m/s</h4>
				</div>
				<div class="col-md-2">
					<h4>6시간 후</h4>
					<img src="/springProject/resources/weather/${info.imglist[1]}"
						style="width: 50px; height: 50px; left: 30px;">
					<h4>${info.namelist[1]}</h4>
					<h4>${info.templist[1]}</h4>
					<h4>${info.wspdlist[1]}m/s</h4>
				</div>
				<div class="col-md-2">
					<h4>9시간 후</h4>
					<img src="/springProject/resources/weather/${info.imglist[2]}"
						style="width: 50px; height: 50px; left: 30px;">
					<h4>${info.namelist[2]}</h4>
					<h4>${info.templist[2]}</h4>
					<h4>${info.wspdlist[2]}m/s</h4>
				</div>
				<div class="col-md-2">
					<h4>12시간 후</h4>
					<img src="/springProject/resources/weather/${info.imglist[3]}"
						style="width: 50px; height: 50px; left: 30px;">
					<h4>${info.namelist[3]}</h4>
					<h4>${info.templist[3]}</h4>
					<h4>${info.wspdlist[3]}m/s</h4>
				</div>
				<div class="col-md-2">
					<h4>15시간 후</h4>
					<img src="/springProject/resources/weather/${info.imglist[4]}"
						style="width: 50px; height: 50px; left: 30px;">
					<h4>${info.namelist[4]}</h4>
					<h4>${info.templist[4]}</h4>
					<h4>${info.wspdlist[4]}m/s</h4>
				</div>
				<div class="col-md-2">
					<h4>18시간 후</h4>
					<img src="/springProject/resources/weather/${info.imglist[5]}"
						style="width: 50px; height: 50px; left: 30px;">
					<h4>${info.namelist[5]}</h4>
					<h4>${info.templist[5]}</h4>
					<h4>${info.wspdlist[5]}m/s</h4>
				</div>
			</div>
			<div class="row" style="margin: 30px;">
				<div class="col-md-3">
					<img src="/springProject/resources/weather/thermometer.PNG"
						style="width: 200px; height: 200px; left: 220px;">
					<div class="row">
						<h3>체감온도</h3>
						<h4>${wct}</h4>
					</div>
				</div>
				<div class="col-md-3">
					<img src="/springProject/resources/weather/uv.PNG"
						style="width: 200px; height: 200px; left: 220px;">
					<div class="row">
						<h3>자외선 지수</h3>
						<h4>${uv}</h4>
					</div>
				</div>
				<div class="col-md-3">
					<img src="/springProject/resources/weather/laundry.PNG"
						style="width: 200px; height: 200px; left: 220px;">
					<div class="row">
						<h3>세탁 지수</h3>
						<h4>${lun}</h4>
					</div>
				</div>
				<div class="col-md-3">
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
					<div class="row">
						<h3>불쾌지수</h3>
						<h4>${comment}</h4>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>