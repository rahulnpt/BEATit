<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>


<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common/bootstrap.min.css">


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/common/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/js/common/bootstrap.min.js"></script>
 
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common/bootstrap-select.min.css" />
  <script src="${pageContext.request.contextPath}/js/common/bootstrap-select.min.js"></script>

<style type="text/css">
.bootstrap-select > .btn {
    height: 45px;
} 
</style>
</head>
<body>
404 page
<div class="form-group">
<select class="selectpicker form-control" data-live-search="true" >
  <option>Mustard</option>
  <option>Ketchup</option>
  <option>Relish</option>
</select>
</div>
<script type="text/javascript">
$('.selectpicker').selectpicker({
	  style: 'btn-info',
	  size: 4
	});
</script>
</body>
</html>