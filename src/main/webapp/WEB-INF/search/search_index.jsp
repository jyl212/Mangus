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

</head>
<script type="text/javascript">
	function Popup(url){
		newWin = window.open(url,"news");
		newWin.focus();
	}
</script>

<body>
	<div class="section">
		<div class="container">
			<div class="row" style="margin:30px;">
				<div class="col-md-12">
						<div class="row">
		<div class="span5">
		<h2> 실시간 검색어</h2>
            <table class="table table-striped table-condensed">
                  <thead>
                  <tr>
                      <th>순위</th>
                      <th>검색어</th>
                      <th>뉴스</th>                                          
                  </tr>
              </thead>   
              <tbody>
              	<c:forEach var="data" items="${searchlist}"  varStatus="status">
					<tr>
					   <c:choose>
					       <c:when test="${status.count == 1}">
					          	<td><span class="label label-success">${status.count}</span></td>
					       </c:when>
					       <c:when test="${status.count == 2}">
								<td><span class="label label-success">${status.count}</span></td>
					       </c:when>
					       <c:when test="${status.count == 3}">
					            <td><span class="label label-success">${status.count}</span></td>
					       </c:when>
					       <c:otherwise>
					           <td><span class="label label-warning">${status.count}</span></td>
					       </c:otherwise>
					   </c:choose>
						<td>${data.keyword}</td>
						<td><a href="javascript:Popup('${data.newslink}')">${data.newstitle}</a></td>
						
					</tr>
				</c:forEach>          
              </tbody>
            </table>
            </div>
	</div>
					<div class="row">
					<h2>추천 검색어</h2>
						<div class="col-md-4">
							<h3>패션의류</h3>
							<table>
								<tr>
										<td>순위</td>
										<td>검색어</td>
								</tr>
								<c:forEach var="comment" begin="1" end="10" step="1" items="${commentList}">
									<td>${comment}</td>
									<td></td>
								</c:forEach>
							</table>
						</div>
						<div class="col-md-4">
							<h3>디지털/가전</h3>
							<table>
								<tr>
										<td>순위</td>
										<td>검색어</td>
								</tr>
								<c:forEach var="comment" begin="1" end="10" step="1" items="${commentList}">
									<td>${comment}</td>
									<td></td>
								</c:forEach>
							</table>
						</div>
						<div class="col-md-4">
							<h3>스포츠/레저</h3>
							<table>
								<tr>
										<td>순위</td>
										<td>검색어</td>
								</tr>
								<c:forEach var="comment" begin="1" end="10" step="1" items="${commentList}">
									<td>${comment}</td>
									<td></td>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>