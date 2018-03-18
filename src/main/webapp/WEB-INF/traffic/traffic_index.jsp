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

<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	var startcount=0;
	var endcount=0;
	var startMarker;
	var endMarker;
	var startarr=new Array();
	var endarr=new Array();
	var headers = {}; 
	headers["appKey"]="c0e8a299-fba0-46d7-b3a9-f4cd7eabe75a";//실행을 위한 키 입니다. 발급받으신 AppKey를 입력하세요.
	$(document).ready(function() {
		$("#startbtn").on("click",function(){
			$.ajax({
				async : true,
				url : "/springProject/traffic/get.do",
				type : "get",
				dataType : "text",
				data : {
					"address" : $("#start").val()},
				success : start_success_run
			});
		});
		$("#endbtn").on("click",function(){
			$.ajax({
				async : true,
				url : "/springProject/traffic/get.do",
				type : "get",
				dataType : "text",
				data : {
					"address" : $("#end").val()},
				success : end_success_run
			});
		});
		$("#searchbtn").on("click",function(){
			$.ajax({
				method:"POST",
				headers : headers,
				url:"https://api2.sktelecom.com/tmap/routes?version=1&format=xml",//자동차 경로안내 api 요청 url입니다.
				async:false,
				data:{
					//출발지 위경도 좌표입니다.
					startX :$("#startlng").val(),
					startY :$("#startlat").val(),
					//목적지 위경도 좌표입니다.
					endX : $("#endlng").val(),
					endY : $("#endlat").val(),
					//출발지, 경유지, 목적지 좌표계 유형을 지정합니다.
					reqCoordType : "WGS84GEO",
					resCoordType : "EPSG3857",
					//각도입니다.
					angle : "172",
					//경로 탐색 옵션 입니다.
					searchOption : 0
				},
				//데이터 로드가 성공적으로 완료되었을 때 발생하는 함수입니다.
				success:function(response){
					prtcl = response;
					
					// 결과 출력
					var innerHtml ="";
					var prtclString = new XMLSerializer().serializeToString(prtcl);//xml to String	
				    xmlDoc = $.parseXML( prtclString ),
				    $xml = $( xmlDoc ),
			    	$intRate = $xml.find("Document");
			    	
			    	var tDistance = "총 거리 : "+($intRate[0].getElementsByTagName("tmap:totalDistance")[0].childNodes[0].nodeValue/1000).toFixed(1)+"km,";
			    	var tTime = " 총 시간 : "+($intRate[0].getElementsByTagName("tmap:totalTime")[0].childNodes[0].nodeValue/60).toFixed(0)+"분,";	
			    	var tFare = " 총 요금 : "+$intRate[0].getElementsByTagName("tmap:totalFare")[0].childNodes[0].nodeValue+"원,";	
			    	var taxiFare = " 예상 택시 요금 : "+$intRate[0].getElementsByTagName("tmap:taxiFare")[0].childNodes[0].nodeValue+"원";	
	
			    	$("#result").text(tDistance+tTime+tFare+taxiFare);
			    	var tData = new Tmap.TData();
			    	var s_lonLat = new Tmap.LonLat(startarr[0],startarr[2]);  
					var e_lonLat = new Tmap.LonLat(endarr[0],endarr[2]);
					var optionObj = {
				             reqCoordType:"WGS84GEO",
				             resCoordType:"EPSG3857"
				    }
			    	tData.getRoutePlan(s_lonLat, e_lonLat, optionObj);
			    	tData.events.register("onComplete", tData, onComplete);
				},
				error:function(request,status,error){
					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		});
	});
	function onComplete(){
	      console.log(this.responseXML); //xml로 데이터를 받은 정보들을 콘솔창에서 확인할 수 있습니다.
	      var kmlForm = new Tmap.Format.KML({extractStyles:true}).read(this.responseXML);
	      var vectorLayer = new Tmap.Layer.Vector("vectorLayerID");
	      vectorLayer.addFeatures(kmlForm);
	      map.addLayer(vectorLayer);
	      map.zoomToExtent(vectorLayer.getDataExtent());
	   }
	function start_success_run(data) {
		if(startcount!=0){
			markerLayer. removeMarker(startMarker);
			for(i=0;i<3;i++){
				startarr.pop();
			}
		}
		var imgsrc='http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_s.png';
		var lng=data.split('"lng":"')[1];
		lng=lng.split('"')[0];
		startarr.push(lng);
		var name=data.split('"name":"')[1];
		name=name.split('"')[0];
		startarr.push(name);
		var lat=data.split('"lat":"')[1];
		lat=lat.split('"')[0];
		startarr.push(lat);
		$("#startaddr").text("출발지 주소  : "+startarr[1]);
		$("#startlat").val(startarr[2]);
		$("#startlng").val(startarr[0]);
		startcount+=1;
	}
	function end_success_run(data) {
		if(endcount!=0){
			markerLayer. removeMarker(endMarker);
			for(i=0;i<3;i++){
				endarr.pop();
			}
		}
		var imgsrc='http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_e.png';
		var lng=data.split('"lng":"')[1];
		lng=lng.split('"')[0];
		endarr.push(lng);
		var name=data.split('"name":"')[1];
		name=name.split('"')[0];
		endarr.push(name);
		var lat=data.split('"lat":"')[1];
		lat=lat.split('"')[0];
		endarr.push(lat);
		$("#endaddr").text("도착지 주소  : "+endarr[1]);
		$("#endlat").val(endarr[2]);
		$("#endlng").val(endarr[0]);
		endcount+=1;
	}
</script>
<link rel="stylesheet" href="/springProject/resources/assets/css/style.css">
<style type="text/css">
div{

}
</style>

</head>

<body>
	<div class="col-lg-12 col-md-12 col-sm-12 centered">
		<div class="col-lg-5 col-md-5 col-sm-5 mt">
			<div class="col-lg-3 col-md-3 col-sm-3" style="text-align: right; 	padding-top: 7px; 	color: black;" >
				<label >출발지:</label> 
			</div>
			<div class="col-lg-5 col-md-5 col-sm-5">
				<input class="form-control" type="text" id="start" name="start" />
			</div>
			<div class="col-lg-4 col-md-4 col-sm-4" style="text-align: left;">
				<button type="button" class="btn btn-info" id="startbtn">검색</button>
			</div>
			<input type="hidden" id="startlat" name="startlat" /> <input type="hidden" id="startlng" name="startlng" />
		</div>
		
		<div class="col-lg-1 col-md-1 col-sm-1 mt">
		</div>
		
		<div class="col-lg-5 col-md-5 col-sm-5 mt">
			<div class="col-lg-3 col-md-3 col-sm-3" style="text-align: right; 	padding-top: 7px; 	color: black;">
				<label >도착지: </label> 
			</div>
			<div class="col-lg-5 col-md-5 col-sm-5">
				<input class="form-control" type="text" id="end" name="end"  />
			</div>
			<div class="col-lg-4 col-md-4 col-sm-4" style="text-align: left;" >
				<button type="button" class="btn btn-info" id="endbtn">검색</button>
			</div>
			<input type="hidden" id="endlat" name="endlat" /> 
			<input type="hidden" id="endlng" name="endlng" />
		</div>
		<div class="col-lg-1 col-md-1 col-sm-1 mt">
		</div>
	</div>
	<div class="col-lg-12 col-md-12 col-sm-12 centered mt mb">
		<p class="col-lg-5 col-md-5 col-sm-5" id="startaddr" style="color: black; font-weight: 900; border-bottom: 1px solid; height: 40px"></p>
		<p class="col-lg-6 col-md-6 col-sm-6" id="endaddr" style="color: black; font-weight: 900;border-bottom: 1px solid; height: 40px"></p>
		<p class="col-lg-1 col-md-1 col-sm-1" style="height:40px "><button type="button" class="btn btn-danger" id="searchbtn">결과조회</button></p>
	</div>
	<div class="col-lg-12 col-md-12 col-sm-12 centered mt mb" style="color: black; font-weight: 900; font-size: 15px;">
		<p id="result"></p>
	</div>
	
	
	<div id="map_div" name="map_div" style="clear: both;"></div>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script
		src="https://api2.sktelecom.com/tmap/js?version=1&format=javascript&appKey=c0e8a299-fba0-46d7-b3a9-f4cd7eabe75a"></script>
	<script>
		function initTmap() {
			 map = new Tmap.Map({div:'map_div',
								width:'100%',
								height:'400px'
								}); 
			map.setCenter(new Tmap.LonLat(126.985065, 37.566269).transform("EPSG:4326", "EPSG:3857"),16);
			markerLayer = new Tmap.Layer.Markers();
			map.addLayer(markerLayer);
			var size = new Tmap.Size(24,38);
		};
		initTmap();
	</script>
</body>
</html>