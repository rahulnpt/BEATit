<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BEATit</title>
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common/all.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/common/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/js/common/bootstrap.min.js"></script>
<script src="//cdn.quilljs.com/1.3.6/quill.min.js"></script>
<link href="//cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">

<!-- websockets related js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common/bootstrap-select.min.css" />
<script src="${pageContext.request.contextPath}/js/common/bootstrap-select.min.js"></script>

<!-- Jquery confirm/alert box plugins -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>

<!-- moment.js for time handling -->
<script src="${pageContext.request.contextPath}/js/common/moment.min.js"></script>

<style type="text/css">
body{
	font-family: 'Roboto', sans-serif !important ;
}
.problem-box{
    height: 82px;
    border: 1px solid rgba(0, 123, 255, 0.4);
    padding: 25px;
    border-radius: 8px;
    font-size: 20px;
    color: #b1b1b1;
}
.problem-stmt-text{
    width: fit-content;
}
.problem-stmt-text:hover{
 	color: #000000;
    cursor: pointer;
}
.feed-box{
  
}
.feed-heading{
	padding: 6px;
    font-size: 1.25rem;
    background: #f8f9fa;
    margin-bottom: 4px;
    border-bottom: 1px solid rgba(0, 123, 255, 0.4);
    border-radius: 4px 4px 0px 0px;
    text-align: center;
}
.add-concerns{
    text-align: center;
    width: 100%;
}
.unbeaten-problm-list{
    background: #ffffd0;
}
.unbeaten-prblm-heading{
    padding: 6px;
    font-size: 1.25rem;
    background: #f8f9fa;
    margin-bottom: 4px;
    border-bottom: 1px solid rgba(0, 123, 255, 0.4);
    border-radius: 4px 4px 0px 0px;
    text-align: center;
}
.problem-text{
    color: black !important;
}
.problem{
      /* background: #f8f9fa; */
    border: 1px solid rgba(193, 193, 193, 0.4);
    padding: 20px;
    margin-top: 30px;
}
.problem-title{
    font-size: 27px;
    font-weight: bold;
    border-bottom: 0.02em solid #ccc;
}
.img-width{
    width: 100%;
	border-radius: 4px;
}
.problem-owner{
    float: right;
    width: 100%;
}
.owner-container{
    width: 246px;
    float: right;
    background: #f2f2f3;
    /* padding: 6px; */
    border-radius: 4px;
}
.op-row{
	padding: 4px;
}
.owner-name{
    padding-left: 0px !important;
    padding-top: 5px;
}
.problem-timestamp{
    font-size: 13px;
}
.timestamp-container{
	padding-right: 0;
}
.problem-tag-options{
    padding: 10px 0 10px;
	float: right;
}
.tags-holder{
    padding: 5px;
    background: #c8e2ff;
    color: #003c7b;
    border-radius: 5px;
    font-size: 13px;
    margin-right: 7px;
}

.divider{
    border-bottom: 1px solid #ccc;
    margin-bottom: 20px;
    margin-top: 20px;
    width: 100%;
}
.responder-section{
    padding: 10px 0;
    background: #e8efff;
    border-radius: 4px;
}
.responder-img{
	padding: 5px 5px;
}
.response-time{
    font-size: 13px;
}
.prblm-body-header{
    display: inline-block;
    margin-bottom: .5rem;
	padding: 3px 0;
}
.current-problem-row{
	padding: 8px 0;
}
.bootstrap-select > .btn {
    height: 40px;
}
.error{
	color: red;
}
.overlay{
	position: fixed;
    top: 0;
    bottom: 0;
    background: rgba(0, 0, 0,0.75);
    right: 0;
    left: 0;
    z-index: 1100;
    display: none;
    width: 100%;
    height: 100%;
}
.loader{
    position: absolute;
    top: 50%;
    left: 50%;
    font-size: 50px;
    color: white;
    transform: translate(-50%,-50%);
    -ms-transform: translate(-50%,-50%);
    text-align: center;
}
.loader-icon{
	font-size:28px
}
.loading-text{
	font-size:15px
}
.loading-text:after {
  content: ' .';
  animation: dots 1s steps(5, end) infinite;}

#answer-container{
	height: 180px;
}


@keyframes dots {
  0%, 20% {
    color: rgba(0,0,0,0);
    text-shadow:
      .25em 0 0 rgba(0,0,0,0),
      .5em 0 0 rgba(0,0,0,0);}
  40% {
    color: white;
    text-shadow:
      .25em 0 0 rgba(0,0,0,0),
      .5em 0 0 rgba(0,0,0,0);}
  60% {
    text-shadow:
      .25em 0 0 white,
      .5em 0 0 rgba(0,0,0,0);}
  80%, 100% {
    text-shadow:
      .25em 0 0 white,
      .5em 0 0 white;}}

.problem-options-1 >li{
	cursor: pointer;
}

.problem-options-1 > li > i{
	color: #007bff;
}

.problem-options-2{
	text-align: right;
}
.problem-options-2 > li > i{
	color: #007bff;
	cursor: pointer;
}
.op-img{
    padding: 2px 6px;
}
.responder-info{
	text-align: left;
    background: #f2f2f3;
    padding: 2px 0px;
    border-radius: 4px;
	margin-bottom: 5px;
}
.responder-img-width{
    width: 50px;
}
.editor-btns{
	padding-top: 10px;
}

.problem-desc img{
    max-width: 100%;
    max-height: 100%;
    display: block;
}

.ql-snow .ql-editor img {
    display: block;
}

/* .ql-snow .ql-editor img::after {
    content: '\A';
} */
</style>
</head>

<body onload="setOnLoadValues()">
	<jsp:include page="header.jsp"></jsp:include>
	
	<div class='overlay'>
		<div class='loader'>
			<i class="fa fa-spinner fa-spin loader-icon"></i>
			<div class='loading-text'>Loading</div>
		</div>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col-sm-8">
				<div class="row">
					<div class='col-sm-12'>
						<div class="problem-title">
							${problem.title}
						</div>
					</div>
				</div>
				<div class="row">
					<div class='col-sm-12'>
						<div class="problem-desc">
							${problem.description}
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6 d-flex align-items-center">
						<div class="problem-tags">
							<c:forEach items="${problem.concerns}" var="concern">
								<span class="tags-holder">
									${concern.name}
								</span>
							</c:forEach>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="owner-container">
							<div class="container pr-0">
								<div class="row op-row ">
									<div class="col-sm-3 align-items-center d-flex op-img ">
										<img alt="" class="img-width" src="${pageContext.request.contextPath}/images/profile/1.jpg">
									</div>
									<div class="col-sm-8 px-0 ">
										<div class="owner-name">
											<div>${problem.user_name}</div>
										</div>	
											<input type=hidden name=askedOn value="${problem.askedOn}">
											<input type=hidden name=problemId value="${problem.id}">
										<div class="problem-timestamp">
										asked on Aug 15 '12 at 8:07</div>
									</div>
									
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class='col-sm-12'>
						<div class='divider'></div>
					</div>
				</div>
				<div class=row>
					<div class=col-sm-6>
						<ul class="list-inline problem-options-1">
						    <li class="list-inline-item answer-btn"><i class="fas fa-edit"></i><span>Answer </span></li>
					  	</ul>
					</div>
					<div class=col-sm-6>
					  	<ul class="list-inline problem-options-2">
					  		<li class="list-inline-item"><i class="far fa-comment"></i>10+</li>
					  		<li class="list-inline-item"><i class="far fa-thumbs-up"></i></li>
						    <li class="list-inline-item"><i class="far fa-thumbs-down"></i></li>
						    <li class="list-inline-item"><i class="far fa-share-square"></i></li>
					    </ul>
					</div>
				</div>
				<div class='row'>
					<div class=col-sm-12>
						<div id='editor-section'  style='display: none'>
							<div id='answer-container'>
							</div>
							<div class='editor-btns'>
								<button class="btn btn-info" onclick="submitAnswer()">Submit</button>
								<button class="btn btn-light" onclick="javascript:$('#editor-section').slideUp();">Cancel</button>
							</div>
						</div>
					</div>						
				</div>
				<div class="row">
					<div class='col-sm-12'>
						<div class='divider'></div>
					</div>
				</div>
				<div class="row">
					<div class='col-sm-12'>
						<ul class="list-inline responder-info d-flex">
					  		<li class="list-inline-item">
					  			<div class="responder-img">
									<img alt="" class="responder-img-width" src="${pageContext.request.contextPath}/images/profile/1.jpg">
								</div>
					  		</li>
					  		<li class="list-inline-item">
						  		<div class="responder-info">
									Anonymous <div class="response-time">answered on  Aug 15 '13 at 10:07</div>
								</div>	
					  		</li>
					    </ul>
					</div>
				</div>
				<div class="row">
					<div class='col-sm-12'>
						<div class="problem-solution">
							It was the time when whole India was fuming over the JNU issue of anti-nationalist remarks. Some were expressing their solidarity towards the perpetrator Kanhaiya K					
							some were protesting against his arrest, and the rest were condemning him for his anti nationalist activities. That was a time when News channels were consta
						</div>
					</div>
				</div>
				
				<!-- for websockets testing -->
				<!-- <div class="row">
					<div class='col-sm-6'>
							<input type="text" id='testInput'>
							<button class="btn" onclick='sendName()'> submit</button>
					</div>
					<div class='col-sm-6 testBox'>
							test is test
					</div>
				</div> -->
				
				
			</div>
			<div class="col-sm-4">
				<div class="miscellaneous-box">
					<div class="unbeaten-prblm-heading" >
						Unsolved Problems
					</div>
					<ul class="unbeaten-problm-list">
					  <li class="">
						  <a href="#" class="problem-text">
						  	What are the best-kept secrets of the hotel industry?
						  </a>
					  </li>
					  <li class="">
						  <a href="#" class="problem-text">
						  	What are the things that make Hindus sad in India?
						  </a>
					  </li>
					  <li class="">
						  <a href="#" class="problem-text">
						  	In what ways is the Bible superior to the Bhagavad Gita?
						  </a>
					  </li>
					  <li class="">
						  <a href="#" class="problem-text">
						  	What is the essence of Shiva energies?
						  </a>
					  </li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
	<input type="hidden" name="userId" value="${user.userId}">
	
<script type="text/javascript">

var ctx='${pageContext.request.contextPath}';

$(document).ready(function(){
})

var quill = new Quill('#answer-container', {
  modules: {
    toolbar: [
      [{ header: [1, 2, false] }],
      ['bold', 'italic', 'underline'],
      ['image', 'code-block']
    ]
  },
  placeholder: 'Write your Solution...',
  theme: 'snow'  // or 'bubble'
});
$('.selectpicker').selectpicker({
	  style: 'btn-info',
	  size: 3
	});

$('body').on('click','.answer-btn',function(){
	$('#editor-section').slideToggle();
})

function setOnLoadValues(){
	let askedTime = $('input[name=askedOn]').val();
	askedTime = moment(askedTime).format("MMM D'YY [at] HH:mm")
	$('.problem-timestamp').html('asked on '+askedTime);
}

function submitAnswer(){
	const content = quill.root.innerHTML;
	const problemId = $('input[name=problemId]').val();
	const userId = $('input[name=userId]').val();
	$('.overlay').show();
	$.ajax({
		type:'post',
		url:ctx+'/solution/'+problemId,
		data:content,
		success:function(response){
			$('.overlay').hide();
			//window.location.href=ctx+'/answer/'+problemId 
		},
		fail:function(){
			$('.overlay').hide();
		}
	})
	
}

</script>

<!-- javascript for websockets -->

<script type="text/javascript">
var stompClient = null;

function setConnected(connected) {
  /*   $("#connect").prop("disabled", connected);
    $("#disconnect").prop("disabled", !connected);
    if (connected) {
        $("#conversation").show();
    }
    else {
        $("#conversation").hide();
    }
    $(".testBox").html(""); */
}

function connect() {
    var socket = new SockJS('/testing-webSockets');
    stompClient = Stomp.over(socket);
    stompClient.connect({}, function (frame) {
        setConnected(true);
        console.log('Connected: ' + frame);
        stompClient.subscribe('/topic/greetings', function (greeting) {
            showGreeting(JSON.parse(greeting.body).content);
        });
    });
}

function disconnect() {
    if (stompClient !== null) {
        stompClient.disconnect();
    }
    setConnected(false);
    console.log("Disconnected");
}

function sendName() {
    stompClient.send("/app/hello", {}, JSON.stringify({'name': $("#testInput").val()}));
}

function showGreeting(message) {
	console.log('message '+ message)
    $(".testBox").html(message);
}

/* $(function () {
    $("form").on('submit', function (e) {
        e.preventDefault();
    });
    $( "#connect" ).click(function() { connect(); });
    $( "#disconnect" ).click(function() { disconnect(); });
    $( "#send" ).click(function() { sendName(); });
}); */



</script>

	<%-- <security:authorize access="hasRole('Admin')">
		<a href="${pageContext.request.contextPath }/admin/">link to admin page</a>
	</security:authorize>
	
	<security:authorize access="hasRole('Developer')">
		<a href="${pageContext.request.contextPath }/developer/">link to dev page</a>
	</security:authorize> --%>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>