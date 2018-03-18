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

<link href="/springProject/resources/sms/sms.css" rel="stylesheet" id="bootstrap-css">
<script src="//rawgithub.com/stidges/jquery-searchable/master/dist/jquery.searchable-1.0.0.min.js"></script>
</head>

<script type="text/javascript">
$(function () {
    /* BOOTSNIPP FULLSCREEN FIX */
    if (window.location == window.parent.location) {
        $('#back-to-bootsnipp').removeClass('hide');
    }
    
    
    $('[data-toggle="tooltip"]').tooltip();
    
    $('#fullscreen').on('click', function(event) {
        event.preventDefault();
        window.parent.location = "http://bootsnipp.com/iframe/4l0k2";
    });
    $('a[href="#cant-do-all-the-work-for-you"]').on('click', function(event) {
        event.preventDefault();
        $('#cant-do-all-the-work-for-you').modal('show');
    })
    
    $('[data-command="toggle-search"]').on('click', function(event) {
        event.preventDefault();
        $(this).toggleClass('hide-search');
        
        if ($(this).hasClass('hide-search')) {        
            $('.c-search').closest('.row').slideUp(100);
        }else{   
            $('.c-search').closest('.row').slideDown(100);
        }
    })
    
    $('#contact-list').searchable({
        searchField: '#contact-list-search',
        selector: 'li',
        childSelector: '.col-xs-12',
        show: function( elem ) {
            elem.slideDown(100);
        },
        hide: function( elem ) {
            elem.slideUp( 100 );
        }
    })
});

$(document).on('click', '.panel-heading span.clickable', function(e){
    var $this = $(this);
	if(!$this.hasClass('panel-collapsed')) {
		$this.parents('.panel').find('.panel-body').slideUp();
		$this.addClass('panel-collapsed');
		$this.find('i').removeClass('glyphicon-chevron-up').addClass('glyphicon-chevron-down');
	} else {
		$this.parents('.panel').find('.panel-body').slideDown();
		$this.removeClass('panel-collapsed');
		$this.find('i').removeClass('glyphicon-chevron-down').addClass('glyphicon-chevron-up');
	}
});

$(document).ready(function(){
	$(".name").on({
		'click':function(){
			$("#rphone").val($(this).attr("id"))
		}
	});
});

</script>
<body>

<div class="row" style="margin-top:20px">
  <div class="col-md-8">
    <div class="col-md-12">
    	<div class="col-md-6">
	     	<div class="panel panel-info">
				<div class="panel-heading">
					<h3 class="panel-title">그룹</h3>
					<span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span>
				</div>
				<div class="panel-body">
					<div class="col-md-12">
					<form method="post" action="/springProject/sms/ginsert.do">
						<input type="text" class="form-control" name="title" id="title" placeholder="그룹명" value="">
						<input type="hidden" class="form-control" name="id" id="id" value="${user.id}">
						<input type="submit" class="btn btn-outlined btn-block btn-primary" value="그룹 등록">
					</form>
					</div>
					<div class="col-md-12">
						<table class="table table-bordered">
							<tr>
								<td>그룹명</td><td>삭제</td>
							</tr>
								<c:forEach var="data" items="${glist}"  varStatus="status">
									<tr>
										<td>${data.title}</td>
										<td><a href="/springProject/sms/gDelete.do?title_code=${data.title_code}&id=${user.id}"><img src="/springProject/resources/sms/xxx.PNG" width="10px" height="10px" border="0"></a></td>
									</tr>
								</c:forEach>
						</table>
					</div>
				</div>
			</div>
	    </div>
	    <div class="col-md-6">
			<div class="panel panel-success">
				<div class="panel-heading">
					<h3 class="panel-title">연락처</h3>
					<span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span>
				</div>
				<div class="panel-body">
					<div class="col-md-12">
						<form method="post" action="/springProject/sms/pinsert.do">
						 <div class="form-group">
                             <select class="form-control" name="title_code">
                                 <option value="0" selected>그룹 리스트</option>
                                 <c:forEach var="group" items="${glist}"  varStatus="status">
	                                 <option value="${group.title_code}">${group.title}</option>
                                 </c:forEach>
                             </select>
                         </div>
	                        <input type="hidden" name="id" value="${user.id}"/>
							<input type="text" class="form-control" name="name" id="name" placeholder="이름" value="">
							<input type="text" class="form-control" name="phone" id="phone" placeholder="번호 '-'포함 " value="">
							<input type="submit" class="btn btn-outlined btn-block btn-success" value="연락처 등록">
						</form>
					</div>
				</div>
	    </div>
    </div>
		<div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading c-list">
                    <span class="title">연락처</span>
                    <ul class="pull-right c-controls">
                        <li><a href="#" class="hide-search" data-command="toggle-search" data-toggle="tooltip" data-placement="top" title="검색"><i class="fa fa-ellipsis-v"></i></a></li>
                    </ul>
                </div>
                
                <div class="row" style="display: none;">
                    <div class="col-xs-12">
                        <div class="input-group c-search">
                            <input type="text" class="form-control" id="contact-list-search">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-search text-muted"></span></button>
                            </span>
                        </div>
                    </div>
                </div>
                
                <ul class="list-group" id="contact-list">
                 <c:forEach var="phone" items="${plist}"  varStatus="status">
                    <li class="list-group-item">
                    	<div class="col-xs-12">
                    		<div class="col-xs-9">
	                            <span class="name" id="${phone.phone}">${phone.name}</span>
                            </div>
                            <div class="col-xs-3">
                            <span class="glyphicon glyphicon-user text-muted c-info" data-toggle="tooltip" title="${phone.title}"></span>
                            <span class="visible-xs"> <span class="text-muted">${phone.title}</span><br/></span>
                            <span class="glyphicon glyphicon-earphone text-muted c-info" data-toggle="tooltip" title="${phone.phone}"></span>
                            <span class="visible-xs"> <span class="text-muted">${phone.phone}</span><br/></span>
                            <a href="/springProject/sms/pDelete.do?phone=${phone.phone}&id=${user.id}">
                            <span class="glyphicon glyphicon-remove text-muted c-info" data-toggle="tooltip" title="삭제"></span>
                            </a>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </li>
                 </c:forEach>
                </ul>
            </div>
        </div>
	</div>
	</div>
	</div>
  <div class="col-md-4">
  <div class="col-md-12">
    <form method="post" name="smsForm" action="/springProject/sms/send.do">
    	<img src="/springProject/resources/sms/phone.png" alt="..." class="img-rounded" style="width:300px;z-index:1;">
        <textarea name="msg" class="form-control" cols="30" rows="10" style="width:230px;z-index:2;position: absolute;top: 60px;left: 50px;" placeholder="내용입력"></textarea>
        <input type="text" class="form-control" name="rphone" id="rphone" placeholder="받는 사람"
        			style="width:230px;z-index:3;position: absolute;top: 300px;left: 50px;">
        <input type="text" class="form-control" name="sphone" id="sphone" placeholder="보내는 사람"
        			style="width:230px;z-index:3;position: absolute;top: 350px;left: 50px;" value="${user.name}">
        <input type="hidden" name="phone" value="${user.phone}">
        <input type="hidden" name="id" value="${user.id}">
      	<button class="btn" id="btn" type="submit"><img class="btn-img" src="/springProject/resources/sms/send.png" style="width:50px;z-index:4;position: absolute;top: 443px;left: 140px;border:none"></button>
    </form>
   </div>
  </div>
  </div>
  
  
  
  
  
  
  
  
  
</body>
</html>