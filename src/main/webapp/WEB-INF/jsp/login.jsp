<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BEATit</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/js/common/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/common/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/js/common/bootstrap.min.js"></script>
<style type="text/css">
.theme-color{
	color:#0585ad;
}
.btn:hover{
    background: #dadada;
}
.error-msg{
	color: #de0e0e;
}
.error-block{
    height: 40px;
    background: #ffeeea;
    border-radius: 5px;
    text-align: center;
    padding: 7px;
}
.success-msg{
	color: #084c01;
}
.success-block{
    height: 40px;
    background: #ddfdd7;
    border-radius: 5px;
    text-align: center;
    padding: 7px;
}

.form-container{
    margin: 0 auto;
    width: 330px;
    border: 1px solid #e4e4e4;
    padding: 20px;
    box-shadow: 0px 0px 9px 1px rgba(5, 133, 173, 0.1);
    margin-top: 40px;
}

.register-link{
	float: right;
    padding: .375rem .75rem;
}
</style>
</head>
<body>
	<div class="container">
	  <div class="form-container">
		  <h2 class="theme-color">Login to BEATit!!</h2>
		  <form:form action="${pageContext.request.contextPath}/authenticateUser" method="post">
		    <c:if test="${param.error != null }">
		    	<div class='error-block'>
			    	<i class="error-msg"> Please provide valid credentials.</i>
		    	</div>
		    </c:if>
		    <c:if test="${param.logout != null }">
		    	<div class='success-block'>
			    	<i class="success-msg"> You have been successfully logged out.</i>
		    	</div>
		    </c:if>
		    <div class="form-group">
		      <label for="email">Email:</label>
		      <input type="text" class="form-control" id="email" placeholder="Enter email" name="email">
		    </div>
		    <div class="form-group">
		      <label for="password">Password:</label>
		      <input type="password" class="form-control" id="password" placeholder="Enter password" name="password">
		    </div>
		    <div class="checkbox">
		      <label><input type="checkbox" name="remember"> Remember me</label>
		    </div>
		    <button type="submit" class="btn btn-default theme-color">Submit</button>
		    <span class="register-link">
				<a href="${pageContext.request.contextPath}/register" class="">Create account</a>
			</span>
		  </form:form>
	  </div>
</div>

</body>
</html>