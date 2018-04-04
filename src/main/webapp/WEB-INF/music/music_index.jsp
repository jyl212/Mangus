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
<script src="//rawgithub.com/stidges/jquery-searchable/master/dist/jquery.searchable-1.0.0.min.js"></script>
<link href="/springProject/resources/music/music.css" rel="stylesheet" id="bootstrap-css">
<style type='text/css'>
	.active a{ color:#5DB0E6;text-decoration:none; }
	span a{ color:#eeeedd;background:#333;padding:5px;display:block; cursor:pointer }
	span a:hover{ text-decoration:none; }
</style>
<script type='text/javascript'>//<![CDATA[ 
$(window).load(function(){
var audio;
var playlist;
var tracks;
var current;
var img;
init();

$(function() {
	  if (typeof webkitSpeechRecognition != 'function') {
	    return false;
	  }

	  var recognition = new webkitSpeechRecognition();
	  var isRecognizing = false;
	  var ignoreOnend = false;
	  var finalTranscript = '';
	 	var audio = document.getElementById('audio');
	  var $btnMic = $('#btn-mic');
	 	var $result = $('#result');
	 	var $iconMusic = $('#icon-music');
	  recognition.continuous = true;
	  recognition.interimResults = true;

	  recognition.onstart = function() {
	    console.log('onstart', arguments);
	    isRecognizing = true;

	    $btnMic.attr('class', 'on');
	  };

	  recognition.onend = function() {
	    console.log('onend', arguments);
	    isRecognizing = false;

	    if (ignoreOnend) {
	      return false;
	    }

	    // DO end process
	    $btnMic.attr('class', 'off');
	    if (!finalTranscript) {
	      console.log('empty finalTranscript');
	      return false;
	    }

	    if (window.getSelection) {
	      window.getSelection().removeAllRanges();
	      var range = document.createRange();
	      range.selectNode(document.getElementById('final-span'));
	      window.getSelection().addRange(range);
	    }

	  };

	  recognition.onresult = function(event) {
	    console.log('onresult', event);

	    var interimTranscript = '';
	    if (typeof(event.results) == 'undefined') {
	      recognition.onend = null;
	      recognition.stop();
	      return;
	    }

	    for (var i = event.resultIndex; i < event.results.length; ++i) {
	      if (event.results[i].isFinal) {
	        finalTranscript += event.results[i][0].transcript;
	      } else {
	        interimTranscript += event.results[i][0].transcript;
	      }
	    }

	    finalTranscript = capitalize(finalTranscript);
	    final_span.innerHTML = linebreak(finalTranscript);
	    interim_span.innerHTML = linebreak(interimTranscript);

	    console.log('finalTranscript', finalTranscript);
	    console.log('interimTranscript', interimTranscript);
	    fireCommand(interimTranscript);
	  };

	  function fireCommand(string) {
	  	if (string.endsWith('레드')) {
	  		$result.attr('class', 'red');
	  	} else if (string.endsWith('알람') || string.endsWith('알 람')) {
	  	} else if (string.endsWith('노래 켜') || string.endsWith('음악 켜')) {
	  		audio[0].play();
	  		$iconMusic.addClass('visible');
	  	} else if (string.endsWith('노래 꺼') || string.endsWith('음악 꺼')) {
	  		audio[0].pause();
	  		$iconMusic.removeClass('visible');
	  	} else if (string.endsWith('볼륨 업') || string.endsWith('볼륨업')) {
	  		audio[0].volume += 0.2;
	  	} else if (string.endsWith('볼륨 다운') || string.endsWith('볼륨다운')) {
	  		audio[0].volume -= 0.2;
	  	} else if (string.endsWith('스피치') || string.endsWith('말해줘') || string.endsWith('말 해 줘')) {
	  	  textToSpeech($('#final_span').text() || '전 음성 인식된 글자를 읽습니다.');
	  	}
	  }

	  recognition.onerror = function(event) {
	    console.log('onerror', event);

	    if (event.error == 'no-speech') {
	      ignoreOnend = true;
	    } else if (event.error == 'audio-capture') {
	      ignoreOnend = true;
	    } else if (event.error == 'not-allowed') {
	      ignoreOnend = true;
	    }

	    $btnMic.attr('class', 'off');
	  };

	  var two_line = /\n\n/g;
	  var one_line = /\n/g;
	  var first_char = /\S/;

	  function linebreak(s) {
	    return s.replace(two_line, '<p></p>').replace(one_line, '<br>');
	  }

	  function capitalize(s) {
	    return s.replace(first_char, function(m) {
	      return m.toUpperCase();
	    });
	  }

	  function start(event) {
	    if (isRecognizing) {
	      recognition.stop();
	      return;
	    }
	    recognition.lang = 'ko-KR';
	    recognition.start();
	    ignoreOnend = false;

	    finalTranscript = '';
	    final_span.innerHTML = '';
	    interim_span.innerHTML = '';

	  }

	  /**
	   * textToSpeech
	   * 지원: 크롬, 사파리, 오페라, 엣지
	   */
	  function textToSpeech(text) {
	    console.log('textToSpeech', arguments);


	    // simple version
	    speechSynthesis.speak(new SpeechSynthesisUtterance(text));
	  }

	  /**
	   * requestServer
	   * key - AIzaSyDiMqfg8frtoZflA_2LPqfGdpjmgTMgWhg
	   */
	  function requestServer() {
	    $.ajax({
	      method: 'post',
	      url: 'https://www.google.com/speech-api/v2/recognize?output=json&lang=en-us&key=AIzaSyDiMqfg8frtoZflA_2LPqfGdpjmgTMgWhg',
	      data: '/examples/speech-recognition/hello.wav',
	      contentType: 'audio/l16; rate=16000;', // 'audio/x-flac; rate=44100;',
	      success: function(data) {

	      },
	      error: function(xhr) {

	      }
	    });
	  }

	  /**
	   * init
	   */
	  $btnMic.click(start);
	  $('#btn-tts').click(function() {
	    textToSpeech($('#final_span').text() || '전 음성 인식된 글자를 읽습니다.');
	  });
	});

function init(){
    current = 0;
    audio = $('audio');
    playlist = $('#playlist');
    tracks = playlist.find('span a');
    len = tracks.length - 0;   
    audio[0].volume = 1.0;
    playlist.find('a').click(function(e){
        e.preventDefault();
        link = $(this);
        current = link.parent().index();
        run(link, audio[0]);
    });
    audio[0].addEventListener('ended',function(e){
        current++;
        if(current == len){
            current = 0;
            link = playlist.find('a')[0];
        }else{
            link = playlist.find('a')[current];    
        }
        run($(link),audio[0]);
    });

}
function run(link, player){
        player.src = link.attr('href');
        par = link.parent();
        par.addClass('active').siblings().removeClass('active');
        img = $("span[class=active] a input").val();
        audio[0].load();
        audio[0].play();
        $("#musicIMG").attr("src","data:image/jpg;base64, "+img);
        updatecount();
		}
});//]]>  
</script>

<script type="text/javascript">
$(function () {
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
</script>

<script type="text/javascript">
function updatecount(){
		$.ajax({
			async : true,
			url : "/springProject/music/count.do",
			type : "get",
			dataType : "text",
			data : {
				"id" : $("#id").val(),
				"count" : $("span[class=active] input[name=count]").val(),
				"file_name" : $("span[class=active] a input").attr("id")
			},
			success : success_count_run
		});
}

function success_count_run(data) {
	$("span[class=active] input[name=count]").val(data);
}
</script>

<script type="text/javascript">

var file_name = ""

 $(document).ready(function() {
	$(".update_T").on({
		'click':function(){
			file_name = $(this).attr("id");
			$.ajax({
				async : true,
				url : "/springProject/music/update_T.do",
				type : "get",
				dataType : "text",
				data : {
					"id" : $("#id").val(),
					"file_name" : $(this).next().val()
				},
				success : success_update_T_run
			});
		}
	});
	
	$(".update_F").on({
		'click':function(){
			$.ajax({
				async : true,
				url : "/springProject/music/update_F.do",
				type : "get",
				dataType : "text",
				data : {
					"id" : $("#id").val(),
					"file_name" : $(this).next().val()
				},
			    success : success_update_F_run
			    
			});
		}
	});
	
	function success_update_T_run(data) {
		$("#"+file_name).attr("class","update_F");
		$("#"+file_name).attr("src","/springProject/resources/music/m.png");

	}
	function success_update_F_run(data) {
		$("#"+file_name).attr("class","update_T");
		$("#"+file_name).attr("src","/springProject/resources/music/p.png");
		
	}
	
});

</script>



<script type="text/javascript">
function delete_music(){
	$.ajax({
		async : true,
		url : "/springProject/music/update_F.do",
		type : "get",
		dataType : "text",
		data : {
			"id" : $("#id").val(),
			"file_name" : $(this).val()
		},
		success : success_count_run
	});
}

function success_count_run(data) {
	$("span[class=active] input[name=count]").val(data);
}
</script>


</head>
<body>
	<div class="row" style="margin-top:20px">
		<div class="col-md-6">
			<div class="col-md-12">
				<form method="POST" enctype="multipart/form-data" action="/springProject/music/insert.do">
						<input type="file" class="form-control input-lg" multiple="multiple" name="filesrc" id="filesrc"/>
						<input type="hidden" id="id" name="id" value="${user.id}"/>
						<input type="submit" class="form-control input-lg" id="mp3" value="MP3 리스트 추가"/>
				</form>
			</div>
			<div class="row" >
        	<div class="col-md-12" style="margin-top:10px">
            <div class="panel panel-default">
                <div class="panel-heading c-list">
                    <span class="title">노래 리스트</span>
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
                 <c:forEach var="musiclist" items="${musicList_F_P}"  varStatus="status">
                    <li class="list-group-item">
                    	<div class="col-xs-12">
                    		<div class="col-xs-2">
                    			<img src="data:image/jpg;base64, ${musiclist.photo}" style="width:50px;height:50px"/>
                            </div>
                            <div class="col-xs-7">
	                            <span class="name" id="${musiclist.title}">${musiclist.title}</span>
	                            <span class="name">-</span>
	                            <span class="name" id="${musiclist.artist}">${musiclist.artist}</span>
                            </div>
                            <div class="col-xs-3">
                            <c:choose>
							<c:when test="${musiclist.list eq 'F'}" >
								<input class="update_T" id="music${status.index}" type="image" src="/springProject/resources/music/p.png" style="width:30px;height:30px"
									onclick=""/>
								<input type="hidden" value="${musiclist.file_name}" />
								<input type="hidden" value="${musiclist.list}"/>
							</c:when>
							<c:otherwise>
								<input  class="update_F" id="music${status.index}" type="image" name="${musiclist.file_name}" value="${musiclist.file_name}" src="/springProject/resources/music/m.png" style="width:30px;height:30px"
									onclick=""/>
								<input type="hidden" value="${musiclist.file_name}" />
								<input type="hidden" value="${musiclist.list}"/>
							</c:otherwise>
						</c:choose>
							<input type="image" class="delete_music" src="/springProject/resources/music/x.png" style="width:30px;height:30px"
									onclick="delete_music()"/>
								<input type="hidden" value="${musiclist.file_name}" />
								
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
		<div class="col-md-6">
			<div class="col-md-12">
				<audio id="audio" preload="auto" tabindex="0" controls="" autoplay="" >
					<source type="audio/mp3" src="/springProject/resources/mp3file/${musiclist[0].file_name}">
					<h6>지원하지 않는 브라우저 입니다.</h6>
				</audio>
			</div>
			<div class="col-md-6" id="playlist">
			<c:forEach var="musiclist" items="${musicList_T_P}"  varStatus="status">
				<span id="${musiclist.file_name}"
					<c:if test="${status.count=='1'}">
			       		class="active"
			       	</c:if>
			    >
					<a class="${status.count}" href="/springProject/resources/mp3file/${musiclist.file_name}">${musiclist.title}-${musiclist.artist}
						<input type="hidden" id="${musiclist.file_name}" value="${musiclist.photo}"/>
					</a>
					
					<input type="hidden" name="count" value="${musiclist.count}"/>
				</span>
			</c:forEach>
			</div>
			<div class="col-md-6" id="playlistIMG">
				<img id="musicIMG" src="" style="width:256px;height:256px"/>
			</div>
		</div>
		<div class="col-md-6" style="margin-top:10px">
		<div class="span5">
		<h2> 자주 듣는 노래 </h2>
            <table class="table table-striped table-condensed">
                  <thead>
                  <tr>
                      <th>순위</th>
                      <th>곡</th>
                      <th>아티스트</th>                                          
                  </tr>
              </thead>   
              <tbody>
              	<c:forEach var="data" items="${musicLike}"  varStatus="status">
					<tr>
					   <c:choose>
					       <c:when test="${status.count == 1}">
					          	<td><span class="label label-success">${status.count}</span></td>
					       </c:when>
					       <c:otherwise>
					           <td><span class="label label-warning">${status.count}</span></td>
					       </c:otherwise>
					   </c:choose>
						<td>${data.title}</td>
						<td>${data.artist}</td>
					</tr>
				</c:forEach>          
              </tbody>
            </table>
            </div>
		</div>
	</div>
	<button id="btn-mic" class="off">마이크 <span></span></button>

</body>
</html>