<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="/springProject/resources/assets/css/style.css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#checkid").on("click", function() {
			alert("test");
			$.ajax({
				async : true,
				url : "/springProject/member/idcheck.do",
				type : "get",
				dataType : "text",
				data : {
					"id" : $("#id").val()},
				success : success_run
			});
		});
	});
	function daumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				var fullAddr = '';
				var extraAddr = '';

				if (data.userSelectedType === 'R') {
					fullAddr = data.jibunAddress;

				} else {
					fullAddr = data.jibunAddress;
				}
				document.getElementById('postcode').value = data.zonecode;
				document.getElementById('address').value = fullAddr;

				document.getElementById('address2').focus();
			}
		}).open();
	}
	function success_run(data) {
		alert("test");
		if(data==0){
			$("#mem_id_text").text("이미 사용중인 id 입니다.");
		}else{
			$("#mem_id_text").text("사용 가능한 id 입니다.");
		}
	}
	function passcheck() {
		var pass=$("#password").val();
		var pass2=$("#pass_ok").val();
		if(pass!=pass2){
			$("#pass_text").text("비밀번호가 일치하지 않습니다.");
		}else{
			$("#pass_text").text("");
		}
	}
	function register() {
		if($("#mem_id_text").text()=="이미 사용중인 id 입니다."|$("#mem_id_text").text()==""){
			alert("id 중복확인을 해주세요.");
		}else if($("#pass_ok_text").text()=="비밀번호가 일치하지 않습니다."){
			alert("비밀번호를 확인 해주세요.");
		}else if($("#name").val()==null){
			alert("이름을 입력해주세요.");
		}else if($("#phone").val()==null){
			alert("전화번호를 입력해주세요.");
		}else if($("#postcode").val()==null|$("#address").val()==null|$("#address2").val()==null){
			alert("주소를 입력해주세요.");
		}else if($("#birth").val().length!=6){
			alert("생년월일을 6자로 입력해 주세요 ex)950212");
		}else if($("#mail").val()==null){
			alert("이메일을 입력해 주세요.")
		}else if($("input[name=gender]").val()==null){
			alert("성별을 선택해주세요.");
		}else{
			 var address=$("#address").val()+" "+$("#address2").val();
			 $("#address").val(address);
			 $("#myform").submit();
			 
		     return false;
		}
	}
</script>
</head>
<body>
	<div class="col-md-12 col-sm-12 col-xs-12 centered mt">
		<h1 class="mb">회원가입</h1>
	<form action="/springProject/member/register.do" name="myform" id="myform"
		method="post">
		
		<div class="col-md-2 col-sm-2 col-xs-2 oneline-conftrol"></div>
		<div class="col-md-8 col-sm-8 col-xs-8 form-group" id="idbox">
			<div class="col-md-6 col-sm-6 col-xs-6 centered">
				<input type="text" class="form-control" id="id" name="id"
					placeholder="아이디">
			</div>
			<div class="col-md-6 col-sm-6 col-xs-6" style="text-align: left;">
				<button type="button" class="btn btn-info" id="checkid">중복확인</button>
			</div>
			<label id="mem_id_text"></label>
		</div>
		<div class="col-md-2 col-sm-2 col-xs-2 oneline-conftrol"> </div>
		
		
		<div class="col-md-2 col-sm-2 col-xs-2 oneline-conftrol"></div>
		<div class="col-md-8 col-sm-8 col-xs-8 form-group" id="passbox">
			<div class="col-md-6 col-sm-6 col-xs-6 centered">
				<input type="password" class="form-control" id="password" name="password"
					placeholder="비밀번호" >
			</div>
			<div class="col-md-6 col-sm-6 col-xs-6 centered"></div>
		</div>
		<div class="col-md-2 col-sm-2 col-xs-2 oneline-conftrol"></div>
		
		
		<div class="col-md-2 col-sm-2 col-xs-2 oneline-conftrol"></div>
		<div class="col-md-8 col-sm-8 col-xs-8 form-group" id="passcheckbox">
			<div class="col-md-6 col-sm-6 col-xs-6 centered">
			<input type="password" class="form-control" id="pass_ok"
				name="pass_ok" placeholder="비밀번호 확인"  onkeyup="passcheck()">
			</div>
			<div class="col-md-6 col-sm-6 col-xs-6 centered">
			</div>
		</div>
		<div class="col-md-2 col-sm-2 col-xs-2 oneline-conftrol"></div>
		
		<div class="col-md-2 col-sm-2 col-xs-2 oneline-conftrol"></div>
		<div class="col-md-8 col-sm-8 col-xs-8 form-group" id="namebox">
			<div class="col-md-6 col-sm-6 col-xs-6 centered">
			<input type="text" class="form-control" id="name" name="name"
				placeholder="이름">
			</div>
			<div class="col-md-6 col-sm-6 col-xs-6 centered">
			</div>
		</div>
		<div class="col-md-2 col-sm-2 col-xs-2 oneline-conftrol"></div>
		
		<div class="col-md-2 col-sm-2 col-xs-2 oneline-conftrol"></div>
		<div class="col-md-8 col-sm-8 col-xs-8 form-group" id="phonebox">
			<div class="col-md-6 col-sm-6 col-xs-6 centered">
			<input type="text" class="form-control" name="phone" id="phone"
				placeholder="전화번호" />
			</div>
			<div class="col-md-6 col-sm-6 col-xs-6" style="text-align: left;">
			-를 빼고 입력해 주세요.
			</div>
		</div>
		<div class="col-md-2 col-sm-2 col-xs-2 oneline-conftrol"></div>
		
		<div class="col-md-2 col-sm-2 col-xs-2 oneline-conftrol"></div>
		<div class="col-md-8 col-sm-8 col-xs-8 form-group" id="addrbox">
			<div class="col-md-6 col-sm-6 col-xs-6" >
				<input type="text" class="form-control" name="postcode" id="postcode"
				placeholder="우편번호" >
			</div>
			<div class="col-md-6 col-sm-6 col-xs-6" style="text-align: left;">
			<button type="button" class="btn btn-info" onclick="daumPostcode()"
				id="findaddr" >우편번호 찾기</button>
			</div>
		</div>
		<div class="col-md-2 col-sm-2 col-xs-2 oneline-conftrol"></div>
		
		<div class="col-md-2 col-sm-2 col-xs-2 oneline-conftrol"></div>
		<div class="col-md-8 col-sm-8 col-xs-8 form-group" id="addrbox2">
			<div class="col-md-6 col-sm-6 col-xs-6">
			<input type="text" class="form-control" name="address" id="address"
				placeholder="주소" > 
			</div>
			<div class="col-md-6 col-sm-6 col-xs-6">
			<input type="text" class="form-control" name="address2" id="address2"
				placeholder="상세주소">
			</div>
		</div>
		<div class="col-md-2 col-sm-2 col-xs-2 oneline-conftrol"></div>
		
		<div class="col-md-2 col-sm-2 col-xs-2 oneline-conftrol"></div>
		<div class="col-md-8 col-sm-8 col-xs-8 form-group" id="birthbox">
			<div class="col-md-6 col-sm-6 col-xs-6">
			<input type="text" class="form-control" id="birth" name="birth"
				placeholder="생년월일"
				/>
			</div>
			<div class="col-md-6 col-sm-6 col-xs-6">
			</div>
		</div>
		<div class="col-md-2 col-sm-2 col-xs-2 oneline-conftrol"></div>
		
		<div class="col-md-2 col-sm-2 col-xs-2 oneline-conftrol"></div>
		<div class="col-md-8 col-sm-8 col-xs-8 form-group" id="emailbox">
			<div class="col-md-6 col-sm-6 col-xs-6">
			<input type="text" class="form-control" id="mail" name="mail"
				placeholder="e-mail"
				 /> 
			</div>
			<div class="col-md-6 col-sm-6 col-xs-6">
			</div>
		</div>
		<div class="col-md-2 col-sm-2 col-xs-2 oneline-conftrol"></div>
		
		<div class="col-md-2 col-sm-2 col-xs-2 oneline-conftrol"></div>
		<div class="col-md-8 col-sm-8 col-xs-8 form-group" id="genderbox">
			<div class="col-md-6 col-sm-6 col-xs-6">
			<input type='radio' name='gender' value='M' />남자 
			<input type='radio'	name='gender' value='F' />여자
			</div>
			<div class="col-md-6 col-sm-6 col-xs-6">
			</div>
		</div>
		<div class="col-md-2 col-sm-2 col-xs-2 oneline-conftrol"></div>
		
		<div class="col-md-2 col-sm-2 col-xs-2 oneline-conftrol"></div>
		<div class="col-md-8 col-sm-8 col-xs-8 centered">
			<div class="col-md-6 col-sm-6 col-xs-6" style="text-align: right;">
			<button type="button" class="btn btn-info" id="join"
				onclick="register()">가입</button>
			</div>
			<div class="col-md-6 col-sm-6 col-xs-6" style="text-align: left;">
			<button type="button" class="btn btn-info" id="cancle">취소</button>
			</div>
		</div>
	</form>
	</div>
</body>
</html>