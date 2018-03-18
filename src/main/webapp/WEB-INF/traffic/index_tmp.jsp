<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>
    	<div style="height:400px; overflow-y:scroll; " id="searchResult" name="searchResult">검색결과</div>

<script>
// map 생성
// Tmap.map을 이용하여, 지도가 들어갈 div, 넓이, 높이를 설정합니다.
map = new Tmap.Map({
				div : 'searchResult',// map을 표시해줄 div
				width : "100%",// map의 width 설정
				height : "400px",// map의 height 설정
			});
			map.setCenter(new Tmap.LonLat("126.986072", "37.570028").transform("EPSG:4326", "EPSG:3857"), 15);// 설정한 좌표를 "EPSG:3857"로 좌표변환한 좌표값으로 중심점을 설정합니다.
	
$.ajax({
	method:"GET",
	url:"https://api2.sktelecom.com/tmap/pois?version=1&format=xml&callback=result",// POI 통합검색 api 요청 url입니다.
	async:false,
	data:{
		"searchKeyword" : "서울시",//검색 키워드
		"areaLLCode" : "11",//지역 대분류 코드
		"areaLMCode" : "140",//지역 중분류 코드
		"resCoordType" : "EPSG3857",//응답 좌표계 유형
		//검색타입
		//all:통합 검색
		//name:명칭 검색
		//telno:전화번호 검색
		"searchType" : "name",
		//거리순,정확도순 검색
		//A:정확도순
		//R:거리순
		"searchtypCd" : "A",
		"radius" : 0,//검색반경
		"reqCoordType" : "WGS84GEO",//요청 좌표계 유형
		"centerLon" : "126.986072",
		"centerLat" : "37.570028",
		"multiPoint" : "N",
		"appKey" : "c0e8a299-fba0-46d7-b3a9-f4cd7eabe75a",// 실행을 위한 키입니다. 발급받으신 AppKey를 입력하세요.
		"count" : 10//페이지당 출력되는 개수를 지정
	},
	//데이터 로드가 성공적으로 완료되었을 때 발생하는 함수입니다.
	success:function(response){
		prtcl = response;
		
		// 3. POI 마커 표시
		var markerLayer = new Tmap.Layer.Markers();//마커 레이어 생성
		map.addLayer(markerLayer);//map에 마커 레이어 추가
		var size = new Tmap.Size(24, 38);//아이콘 크기 설정
		var offset = new Tmap.Pixel(-(size.w / 2), -(size.h));//아이콘 중심점 설정
		var maker;
		var popup;
		var prtclString = new XMLSerializer().serializeToString(prtcl);//xml to String	
		xmlDoc = $.parseXML( prtclString ),
		$xml = $( xmlDoc ),
		$intRate = $xml.find("poi");
		var innerHtml ="";
		$intRate.each(function(index, element) {
		   	var name = element.getElementsByTagName("name")[0].childNodes[0].nodeValue;
		   	var id = element.getElementsByTagName("id")[0].childNodes[0].nodeValue;
		   	var content ="<div style=' position: relative; border-bottom: 1px solid #dcdcdc; line-height: 18px; padding: 0 35px 2px 0;'>"+
						    "<div style='font-size: 12px; line-height: 15px;'>"+
						        "<span style='display: inline-block; width: 14px; height: 14px; background-image: url(/resources/images/common/icon_blet.png); vertical-align: middle; margin-right: 5px;'></span>"+name+
						    "</div>"+
						 "</div>";
		   	innerHtml+="<div><img src='http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_"+index+".png' style='vertical-align:middle'/><span>"+name+"</span></div>";
			var lon = element.getElementsByTagName("noorLon")[0].childNodes[0].nodeValue;
			var lat = element.getElementsByTagName("noorLat")[0].childNodes[0].nodeValue;
			
			var icon = new Tmap.Icon('http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_'+index+'.png',size, offset);//마커 아이콘 설정
			var lonlat = new Tmap.LonLat(lon, lat);//좌표설정 
			marker = new Tmap.Marker(lonlat, icon);//마커생성
			markerLayer.addMarker(marker);//마커레이어에 마커 추가
			
			popup = new Tmap.Popup("p1", lonlat, new Tmap.Size(120, 50), content, false);//마우스 오버 팝업
			popup.autoSize = true;//Contents 내용에 맞게 Popup창의 크기를 재조정할지 여부를 결정
			map.addPopup(popup);//map에 popup추가
			popup.hide();//마커에 마우스가 오버되기 전까진 popup을 숨김
			//마커 이벤트등록
		    marker.events.register("mouseover", popup, onOverMarker);
		    //마커에 마우스가 오버되었을 때 발생하는 이벤트 함수입니다.
		    function onOverMarker(evt) {
		      this.show(); //마커에 마우스가 오버되었을 때 팝업이 보입니다. 
		    }
		    //마커 이벤트 등록
		    marker.events.register("mouseout", popup, onOutMarker);
		    //마커에 마우스가 아웃되었을 때 발생하는 함수입니다.
		    function onOutMarker(evt) {
		      this.hide(); //마커에 마우스가 없을땐 팝업이 숨겨집니다.
		    }
	   });
	$("#searchResult").html(innerHtml);
		map.zoomToExtent(markerLayer.getDataExtent());//마커레이어의 영역에 맞게 map을 zoom합니다.
	},
	//요청 실패시 콘솔창에서 에러 내용을 확인할 수 있습니다.
	error:function(request,status,error){
		console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	}
});
</script>

</body>
</html>