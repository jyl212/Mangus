<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My PA</title>
</head>
<body>

<div>
  <div class="container text-center">
    <h1>Mangus</h1>
  </div>
</div>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">Logo</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="/springProject/index.do">Home</a></li>
        <li><a href="/springProject/alarm/index.do">알람</a></li>
        <li><a href="/springProject/weather/index.do">날씨</a></li>
        <li><a href="/springProject/sms/index.do?id=${user.id}">문자전송</a></li>
        <li><a href="/springProject/schedule/index.do">일정</a></li>
        <li><a href="/springProject/music/index.do?id=${user.id}">음악</a></li>
        <li><a href="/springProject/traffic/index.do">교통</a></li>
        <li><a href="/springProject/search/index.do?gender=${user.gender}&birth=${user.birth}">검색</a></li>
        <li><a href="/springProject/result.do">test</a></li>
        <li class=" dropdown">
            <a href="#" class="dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">메일<span class="caret"></span></a>
            <ul class="dropdown-menu">
             <li><a href="/springProject/mail/index.do">메일쓰기</a></li>
             <li><a href="/springProject/mail/mailList.do">보낸 메일함</a></li>
            </ul>
        </li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <se:authorize access="isAnonymous()">
       		<li><a href="/springProject/member/signup.do"><span class="glyphicon glyphicon-user"></span>Sign Up</a></li>
       		<li><a href="/springProject/member/login"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
       	</se:authorize>
       	<se:authorize access="isAuthenticated()">
       		<li><a href="/springProject/member/logout.do"><span class="glyphicon glyphicon-log-out"></span>Logout</a></li>
     	</se:authorize>
      </ul>
    </div>
  </div>
</nav>
</body>
</html>