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
<link rel="stylesheet" href="/springProject/resources/assets/css/main.css" />
		<!-- Scripts -->
			<script src="/springProject/resources/assets/js/jquery.min.js"></script>
			<script src="/springProject/resources/assets/js/jquery.scrolly.min.js"></script>
			<script src="/springProject/resources/assets/js/jquery.dropotron.min.js"></script>
			<script src="/springProject/resources/assets/js/jquery.scrollex.min.js"></script>
			<script src="/springProject/resources/assets/js/skel.min.js"></script>
			<script src="/springProject/resources/assets/js/util.js"></script>
			<script src="/springProject/resources/assets/js/main.js"></script>
<body>
	<section id="two" class="spotlight style2 right" style="margin-bottom:100px; width:100%">
		<span class="image fit main"><img src="/springProject/resources/assets/pic03.jpg" alt="" /></span>
		<div class="content">
			<header>
				<h1>음악 리스트</h1>
			</header>
			<p>Feugiat accumsan lorem eu ac lorem amet ac arcu phasellus tortor enim mi mi nisi praesent adipiscing. Integer mi sed nascetur cep aliquet augue varius tempus lobortis porttitor lorem et accumsan consequat adipiscing lorem.</p>
			<ul class="actions">
				<li><a href="#" class="button">Learn More</a></li>
			</ul>
		</div>
		<a href="#three" class="goto-next scrolly">Next</a>
	</section>
		<form method="POST" enctype="multipart/form-data"
		     action="/springProject/music/insert.do">
				<input type="file" class="form-control input-lg" multiple="multiple" name="files" id="files" placeholder="파일선택"/>

			<input type="submit" id="mp3" value="MP3 리스트 추가"/>
		</form>
		
		<script type="text/javascript">
 		$(document).ready(function(){
			$("#mp3").on({
				'click':function(){
					alert($("#files").val().indexOf(".mp3"));
					if($("#files").val().indexOf('.mp3')==-1){
						alert("mp3 파일이 아닙니다.")
						return false;
					}
				}
			}); 
		});
		</script>

</body>
</html>