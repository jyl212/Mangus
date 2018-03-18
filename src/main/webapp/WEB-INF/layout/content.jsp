<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>My PA</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<h1>날씨</h1>
					<img src="/springProject/resources/weather/${today.img}" style="width:300px;height:300px;left:70px;">
					<h4>${today.sky.name}</h4>
					<h4>현재 기온 : ${today.temperature.tc}</h4>
					<h4>최고/최저 기온 : ${today.temperature.tmax}/${today.temperature.tmin}</h4>
					<h4>풍속 : ${today.wind.wspd}m/s</h4>
					<div class="row"></div>
				</div>
				<div class="col-md-6">
					<h1>교통</h1>
					<img
						src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png"
						class="img-responsive">
					<p></p>
					<p>
						Lorem ipsum dolor sit amet, consectetur adipisici elit, <br>sed
						eiusmod tempor incidunt ut labore et dolore magna aliqua. <br>Ut
						enim ad minim veniam, quis nostrud
					</p>
					<p></p>
				</div>
			</div>
		</div>
	</div>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<h1>일정</h1>
					<img
						src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png"
						class="img-responsive">
					<p></p>
					<p>
						Lorem ipsum dolor sit amet, consectetur adipisici elit, <br>sed
						eiusmod tempor incidunt ut labore et dolore magna aliqua. <br>Ut
						enim ad minim veniam, quis nostrud
					</p>
					<p></p>
				</div>
				<div class="col-md-6">
					<h1>오늘의 음악</h1>
					<img
						src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png"
						class="img-responsive">
					<p></p>
					<p>
						Lorem ipsum dolor sit amet, consectetur adipisici elit, <br>sed
						eiusmod tempor incidunt ut labore et dolore magna aliqua. <br>Ut
						enim ad minim veniam, quis nostrud
					</p>
					<p></p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>