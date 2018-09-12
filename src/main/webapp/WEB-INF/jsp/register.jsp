<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BEATit</title>

<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/js/common/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/common/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/js/common/bootstrap.min.js"></script>

<style type="text/css">

body{
	font-family: 'Roboto', sans-serif;
}
.error-msg{
	color: red;
}
.form-container{
	/* min-width: 300px;
    max-width: 350px; */
}
.theme-color{
    color: #0585ad;
}
.login-link{
	float: right;
    padding: .375rem .75rem;
}
.blank-sec{
	margin-top: 40px;
}
</style>
</head>
<body>

<div class="container">
	<div class="blank-sec"></div>
	<h2 class="theme-color">Welcome to BEATit</h2>
	<div class="row">
		<div class="form-container col-sm-5">
			<form:form action="${pageContext.request.contextPath}/register" method="post" modelAttribute="user">
			<%-- 	<c:if test="${param.successMessage != null }">
					<div class='success-block'>
						<i class="success-msg">${param.successMessage}</i>
					</div>
				</c:if> --%>
				<div class="form-group">
					<form:label for="email" path="email">Email:</form:label>
					<form:input type="text" class="form-control" id="email" placeholder="Enter your email" name="email" path="email"/>
					<form:errors path="email" cssClass="error-msg"></form:errors>
				</div>
				<div class="form-group">
					<form:label for="firstname" path="firstName">First name:</form:label>
					<form:input type="text" class="form-control" id="firstname" placeholder="Enter your first name" name="firstname" path="firstName"/>
					<form:errors path="firstName" cssClass="error-msg"></form:errors>
				</div>
				<div class="form-group">
					<form:label for="lastname" path="lastName">Last name:</form:label>
					<form:input type="text" class="form-control" id="lastname" placeholder="Enter your last name" name="lastname" path="lastName"/>
					<form:errors path="lastName" cssClass="error-msg"></form:errors>
				</div>
				<div class="form-group">
					<form:label for="password" path="password">Password:</form:label>
					<form:input type="password" class="form-control" id="password" placeholder="Enter your password" name="password" path="password"/>
					<form:errors path="password" cssClass="error-msg"></form:errors>
				</div>
				<button type="submit" class="btn btn-default theme-color">Submit</button>
				<span class="login-link">
					<a href="${pageContext.request.contextPath}/login" class="">Already registered? login</a>
				</span>
			</form:form>
		</div>
		<div class="col-sm-7">
			<img alt="" style="width: 700px" src="${pageContext.request.contextPath}/images/registration/1.jpg">
		</div>
	</div>
</div>

<h2></h2>
</body>
</html>