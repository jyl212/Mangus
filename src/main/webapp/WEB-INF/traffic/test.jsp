<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Road API</title>
</head>
<body>
	<div id="map_div"></div>
	<div id="divResult" style="height:200px; padding-left:20px; overflow:auto;"></div>
	
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script src="https://api2.sktelecom.com/tmap/js?version=1&format=javascript&appKey=c0e8a299-fba0-46d7-b3a9-f4cd7eabe75a"></script>
	<script>	
// map 생성
// Tmap.map을 이용하여, 지도가 들어갈 div, 넓이, 높이를 설정합니다.
map = new Tmap.Map({
	div : 'map_div',// map을 표시해줄 div
	width : "100%", // map의 width 설정
	height : "400px",// map의 height 설정
});
map.setCenter(new Tmap.LonLat("126.986072", "37.570028").transform("EPSG:4326", "EPSG:3857"), 15);//설정한 좌표를 "EPSG:3857"로 좌표변환한 좌표값으로 중심점으로 설정합니다.

var prtcl;
$.ajax({
	type:"GET",
	url:"https://api2.sktelecom.com/tmap/traffic?version=1&format=xml",//교통 정보 api 요청 url입니다.
	async:false,
	data: {
			  "centerLat": "37.522183",//반경 검색에서 사용하는 중심 좌표의 위도 좌표입니다.
			  "centerLon": "126.971798",//반경 검색에서 사용하는 중심 좌표의 경도 좌표입니다.
			  "reqCoordType": "WGS84GEO",//요청 좌표계 유형을 지정합니다.
			  "resCoordType": "EPSG3857",//받고자 하는 응답 좌표계 유형을 지정합니다.
			  "trafficType": "AROUND",//교통 정보 타입을 지정합니다.
			  "radius": "5",//주변 교통 정보 반경을 지정합니다.
			  "zoomLevel": "15",//교통 정보를 표현할 맵의 레벨을 지정합니다.
			  "sort": "index",//지리정보 개체의 정렬 순서를 지정합니다.
			  "appKey": "c0e8a299-fba0-46d7-b3a9-f4cd7eabe75a"//실행을 위한 키 입니다. 발급받으신 AppKey를 입력하세요.
	},
	//데이터 로드가 성공적으로 완료되었을 때 발생하는 함수입니다.
	success:function(response){
		prtcl = response;
		
		prtcl=new Tmap.Format.KML({extractStyles:true, extractAttributes:true}).read(prtcl);//데이터(prtcl)를 읽고, 벡터 도형(feature) 목록을 리턴합니다.
		var routeLayer = new Tmap.Layer.Vector("route");//도형을 등록 할 레이어를 생성합니다.
		routeLayer.addFeatures(prtcl);//레이어에 도형을 등록합니다.
        map.addLayer(routeLayer);//맵에 레이어 추가합니다.

		map.zoomToExtent(routeLayer.getDataExtent());//map의 zoom을 routeLayer의 영역에 맞게 변경합니다.
	},
	//요청 실패시 콘솔창에서 에러 내용을 확인할 수 있습니다.
	error:function(request,status,error){
		console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	}
});

</script>

</body>
</html>
		
	