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
<link href="//cdn.quilljs.com/1.3.6/quill.bubble.css" rel="stylesheet">

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common/bootstrap-select.min.css" />
<script src="${pageContext.request.contextPath}/js/common/bootstrap-select.min.js"></script>

<!-- Jquery confirm/alert box plugins -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>

<style type="text/css">
body{
	font-family: 'Roboto', sans-serif !imp ortant ;
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
    border-bottom: 1px solid #c7c7c7;
}
.img-width{
    width: 40px;
	border-radius: 4px;
}
.problem-owner{
    float: right;
    width: 100%;
}
.owner-container{
    width: 200px;
    float: right;
    background: #f8f9fa;
    padding: 6px;
    border-radius: 4px;
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
.tag-container{
    padding-left: 0;
}
.divider{
    height: 20px;
    border-bottom: 1px solid #e2e2e2;
    margin-bottom: 20px;
}
.owerner-container-sec{
    padding-right: 0;
}
.responder-section{
    padding: 10px 0;
    background: #e8efff;
    border-radius: 4px;
}
.responder-img{
	padding: 0 5px;
}
.response-time{
    font-size: 13px;
}
.prblm-body-header{
    display: inline-block;
    margin-bottom: .5rem;
	padding: 3px 0;
}
#editor-container {
  height: 175px;
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
  animation: dots 1s steps(5, end) infinite;
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

.validation-msg{
	text-align: center;
    background: #545454;
    color: white;
    padding: 3px;
    display:none;
}

</style>
</head>

<body>
<jsp:include page="header.jsp"></jsp:include>

<div class='overlay'>
	<div class='loader'>
		<i class="fa fa-spinner fa-spin loader-icon"></i>
		<div class='loading-text'>Loading</div>
	</div>
</div>

<div class="container">
	<div class="row">
		<div class="col-sm-2 ">
			<div class="feed-box">
				<div class="feed-heading">
					Feeds
				</div>
				<ul class="list-group">
				  <li class="list-group-item d-flex justify-content-between align-items-center">
				    Health
				    <span class="badge badge-primary badge-pill">14</span>
				  </li>
				  <li class="list-group-item d-flex justify-content-between align-items-center">
				    E-waste
				    <span class="badge badge-primary badge-pill">2</span>
				  </li>
				  <li class="list-group-item d-flex justify-content-between align-items-center">
				    Education
				    <span class="badge badge-primary badge-pill">1</span>
				  </li>
				  <li class="list-group-item d-flex justify-content-between align-items-center">
				  	<div class="add-concerns">
					  	<i class="fas fa-plus"></i>
				  	</div>
				  </li>
				</ul>
			</div>
		</div>
		<div class="col-sm-7">
			<div class="problem-box">
				<div class="problem-stmt-text">
					Have some problem? BEATit before it beats you.
				</div>
			</div>
			
			<div class="problem">
				<div class="problem-title">
					Is Indian media biased?
				</div>
				<div class="problem-desc">
					We wanted to let our country know that we certainly didn't support those illogical afzal guru lovers here at JU and that we strongly resent them, that those people don't hold office for us. Our reticence simply would express our support which was non existent. We wanted to speak for ourselves and put a stop to the nuisance which was being spread in our name.
				</div>
				<div class="container">
					<div class="row">
						<div class="problem-owner">
							<div class="container">
								<div class="row">
									<div class="col-sm-6 d-flex align-items-center tag-container">
										<div class="problem-tags">
											<span class="tags-holder">
												E-waste1
											</span>
											<span class="tags-holder">
												E-waste2
											</span>
										</div>
									</div>
									<div class="col-sm-6 owerner-container-sec">
										<div class="owner-container">
											<div class="container">
											<div class="row">
												<div class="col-sm-12 timestamp-container">
													<div class="problem-timestamp">asked on Aug 15 '12 at 8:07</div>
												</div>
												<div class=" d-flex align-items-center">
													<img alt="" class="img-width" src="${pageContext.request.contextPath}/images/profile/1.jpg">
												</div>
												<div class="col-sm-8 owner-name">
													<div>Rahul </div>
												</div>
											</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row divider"></div>
					<div class="row responder-section">
						<div class="responder-img">
							<img alt="" class="img-width" src="${pageContext.request.contextPath}/images/profile/1.jpg">
						</div>
						<div class="responder-info">
							Anonymous, <span class="response-time">answered on  Aug 15 '13 at 10:07</span>
						</div>
					</div>
					<div class="row">
						<div class="problem-solution">
							It was the time when whole India was fuming over the JNU issue of anti-nationalist remarks. Some were expressing their solidarity towards the perpetrator Kanhaiya K					
							some were protesting against his arrest, and the rest were condemning him for his anti nationalist activities. That was a time when News channels were consta
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-sm-3">
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

 <!-- problem modal -->
  <div class="modal fade" id="problem-modal">
    <div class="modal-dialog modal-dialog-centered modal-lg">
      <div class="modal-content">
      <form:form action="${pageContext.request.contextPath}/problem/submit" method="post" modelAttribute="problem" class='problem-form'>
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Share your Problem</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
            <div class = 'validation-msg'>Please provide the title and choose at least 1 tag for your problem.</div>
          <div class='current-prblem-title'>
          	<div class="form-group">
			  <form:label for="problem-title" path="title">Title:</form:label>
			  <form:input type="text" class="form-control" path="title" id="problem-title" ></form:input>
			<form:errors path="title" cssClass="error"></form:errors>
			</div>
          </div>
          <div class="row current-problem-row">
          	<div class="col-sm-6">
	          <div class="prblm-body-header">
	          	Give some description to your problem(optional):
	          </div>
          	</div>
          	<div class="col-sm-6">
	          	<div class="problem-tag-options">
	          		<form:select class="selectpicker" path="concernOptions" data-live-search="true" data-title='Choose aleast 1 tag'  data-max-options="3" multiple="multiple">
					  <%-- <form:option value="E-waste" label="E-waste">www</form:option>
					  <form:option value="Education" label="Education">asd</form:option>
					  <form:option value="M-waste" label="M-waste">asd</form:option>
					  <form:option value="Relationships" label="Relationships">afrea</form:option>
					  <form:option value="Religion" label="Religion">asd</form:option> --%>
					  <form:options  items="${concernOptions}"/>
					</form:select>
				</div>
			</div>
          </div>
	        <div id="editor-container">
			</div>
			<form:textarea name="text" style="display:none" path="description"  id="hiddenArea"></form:textarea>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
        	<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          	<button type="submit" class="btn btn-secondary" onclick="">Go ahead</button>
          	<button type="button" class="btn btn-secondary" onclick="setProblemDetails();">Set content</button>
        </div>
        </form:form>
      </div>
    </div>
  </div>
<script type="text/javascript">
var ctx='${pageContext.request.contextPath}';

$(document).ready(function(){
	$('body').on('click','.problem-stmt-text',function(){
		$('#problem-modal').modal('show');
	})
})

var quill = new Quill('#editor-container', {
  modules: {
    toolbar: [
      [{ header: [1, 2, false] }],
      ['bold', 'italic', 'underline'],
      ['image', 'code-block']
    ]
  },
  placeholder: 'Share your problem...',
  theme: 'snow'  // or 'bubble'
});
var content;
$('body').on('submit','.problem-form',function(e){
	content = quill.root.innerHTML;
	$("#problem-modal").modal({"backdrop": "static"});
	$("#hiddenArea").val(content);
	
	var form = $(this);
	let url = form.attr('action'); 
	$('.overlay').show();
	
	$.ajax({
		type:'post',
		url:url,
		data:form.serialize(),
		success:function(response){
			$('.overlay').hide();
			var data = JSON.parse(response);
			console.log(data.view)
			if(data.beanValidationFailed == true){
				$('.validation-msg').slideDown(function(){
					setTimeout(function(){
						$('.validation-msg').slideUp();
					},4000)
				})
			}else{
				window.location.href=ctx+'/problem/'+data.problemId
			}
				
		},
		fail:function(){
			$('.overlay').hide();
			showErrorAlertBox();
		}
	})
	
	e.preventDefault();
})
function showErrorAlertBox(){
	$.confirm({
	    title: 'Something went wrong!!',
	    icon: 'fas fa-exclamation-triangle',
	    content: 'Please try after some time',
	    type: 'red',
	    typeAnimated: true,
	    autoClose: 'autoRefresh|6000',
	    buttons: {
	        tryAgain: {
	            text: 'Close',
	            btnClass: 'btn-red',
	            action: function(){
	            }
	        },
	        autoRefresh:function(){
	        	window.location.href=ctx+'/home'
	        }
	    }
	});
}

function setProblemDetails(){
	quill.setContents(JSON.stringify(content))
}
$('.selectpicker').selectpicker({
	  style: 'btn-info',
	  size: 3
	});
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