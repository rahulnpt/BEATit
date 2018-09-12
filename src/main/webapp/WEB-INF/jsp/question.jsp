<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Insert title here</title>
	<link rel="stylesheet" href="/css/common/bootstrap.min.css">
	<script src="/js/common/jquery.min.js"></script>
	<script src="/Js/common/popper.min.js"></script>
	<script src="/js/common/bootstrap.min.js"></script>
<style type="text/css">
.error{
	color: red;
}
</style>
</head>
<body>
	<div class=header>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
		  <a class="navbar-brand" href="#">Navbar</a>
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-toggler-icon"></span>
		  </button>
		
		  <div class="collapse navbar-collapse" id="navbarSupportedContent">
		    <ul class="navbar-nav mr-auto">
		      <li class="nav-item active">
		        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="#">Link</a>
		      </li>
		      <li class="nav-item dropdown">
		        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		          Dropdown
		        </a>
		        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
		          <a class="dropdown-item" href="#">Action</a>
		          <a class="dropdown-item" href="#">Another action</a>
		          <div class="dropdown-divider"></div>
		          <a class="dropdown-item" href="#">Something else here</a>
		        </div>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link disabled" href="#">Disabled</a>
		      </li>
		    </ul>
		    <form class="form-inline my-2 my-lg-0">
		      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
		      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
		    </form>
		    <form:form class="form-inline my-2 my-lg-0" action="${pageContext.request.contextPath }/logout" method="post">
		      <button class="btn ml-3" type="submit">Logout</button>
		    </form:form>
		  </div>
		</nav>
	</div>
	<div class="container">
	<h5>
	User: <security:authentication property="principal.username"/><br>
	Role: <security:authentication property="principal.authorities"/><br>
	</h5>
	  <form:form action="/question/submit" method="post" modelAttribute="question">
	    <div class="form-group">
	      <form:label path="title" for="ques">Question Title:</form:label>
	      <form:input type="text" class="form-control" id="ques" name="ques" path="title" />
	      <form:errors path="title" cssClass="error"></form:errors>
	    </div>
	   <div class="form-group">
	      <form:label path="description" for="ques_desc">Question Description:</form:label>
	      <form:textarea  rows="4" cols="50" class="form-control" id="ques_desc" name="ques_desc" path="description" />
	      <form:errors path="description" cssClass="error"></form:errors>
	    </div>
	    <button type="submit" class="btn btn-primary">Submit</button>
	  </form:form>
	</div> 
	</body>
</html>


	