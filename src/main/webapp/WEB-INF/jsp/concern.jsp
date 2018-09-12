<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
<script src="${pageContext.request.contextPath}/js/common/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/common/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/js/common/bootstrap.min.js"></script>

<style type="text/css">
.nxt-line{
    margin-bottom: 20px;
}
body{
	font-family: 'Roboto', sans-serif !important ;
}
.theme-color{
    color: #0585ad;
}
body{
	min-width:1124px;        /* Suppose you want minimum width of 1000px */
	width: auto !important;  /* Firefox will set width as auto */
	width:1124px;            /* As IE6 ignores !important it will set width as 1000px; */
	overflow-x: hidden;
}
.img {
    position: relative;
    float: left;
    width: 250px;
    height: 250px;
    background-position: 50% 50%;
    background-repeat: no-repeat;
    background-size: cover;
    border: 4px solid #e4e4e4;
    border-radius: 5px;
    transition: transform .3s;
}
.img:hover {
 	-ms-transform: scale(1.05); /* IE 9 */
    -webkit-transform: scale(1.05); /* Safari 3-8 */
    transform: scale(1.05); 
}
/* Bottom left text */
.bottom-left {
   	position: absolute;
    bottom: 5px;
    left: 27px;
    font-size: 26px;
    color: white;
    width: 100%;
    transition: transform .3s;
    z-index: 5;
}
.top-right{
    position: absolute;
    top: 3px;
    left: 177px;
    font-size: 40px;
    color: #ffffff;
    width: 100%;
    transition: transform .3s;
    z-index: 5;
}
.img::after {
    display: block;
    position: relative;
    background-image: linear-gradient(to bottom, rgba(255, 255, 255, 0) 70%, #1b1e21 100%);
    height: 250px;
    content: '';
}
.check-container{
    position: absolute;
    color: #ffffff;
    width: 26%;
    transition: transform .3s;
    z-index: 5;
    padding: 7px;
    border: 4px solid #ffffff;
    border-radius: 50%;
}
.checked{
	color:#27c727;
	border: 4px solid #27c727;
}
.submit-class{
    float: right;
    margin-right: 10px;
}
.skip-link{
    margin-right: 10px;
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
	<h2 class="theme-color">Tell us!! What CONCERNS you?</h2>
	
	<c:forEach var="concern" items="${concerns}" varStatus="count">
		<c:if test="${count.index % 4 == 0 }">
			<div class="row">
		</c:if>
		<div class="col-sm-3">
			<div class="img" style="background-image:url('${pageContext.request.contextPath}${concern.path}');">
				<div class="top-right">
					<div class="check-container" data-id='${concern.id}'>
						<i class="fas fa-check"></i>
					</div>
				</div>
				<div class="bottom-left">${concern.name}</div>
			</div>
		</div>
		<c:if test="${(count.index+1) % 4 == 0  }">
			</div>
			<div class="nxt-line"></div>
		</c:if>
	</c:forEach>
	</div>
	<div class="nxt-line"></div> 
	<div class="submit-class">
		<span class="skip-link">
			<a href="${pageContext.request.contextPath}/home" class="">skip for now</a>
		</span>
		<span class="">
				<button class="btn theme-color" type="submit" onclick='submitConcerns()'>Submit concerns</button>
		</span>
		
		<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
		
	</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<script type="text/javascript">

	var ctx='${pageContext.request.contextPath}';
	
	var csrf_token = $('input[name="_csrf"]').attr('value');
	
	$('body').on('click','.img',function(){
		$(this).find('.check-container').toggleClass('checked');
	})
	
	function submitConcerns(){
		var concernsList = getConcernList();
		$('.overlay').show();
	    $.ajax({
		  url: ctx+'/concern',
		  type: "POST",
		  headers: {
	       		'X-CSRF-Token': csrf_token
	      },
		  data: {"concernLst":concernsList},
		}).done(function(){
			$('.overlay').hide();
			window.location.href=ctx+'/home'
		})
		
	}
	
	function getConcernList(){
		var concernsList = []
		//get the Ids of all the selected concerns
		for(var i = 0;i< $('.check-container').length;i++){
			if($($('.check-container')[i]).hasClass('checked')){
				console.log(i)
				//concernsList['data'+i] = ($($('.check-container')[i]).attr('data-id'))
				concernsList.push($($('.check-container')[i]).attr('data-id'));
				//concernsList['data'+i] = $($('.check-container')[i]).attr('data-id');
			}
		}
		console.log(concernsList)
		return concernsList;
	}

</script>
</body>
</html>