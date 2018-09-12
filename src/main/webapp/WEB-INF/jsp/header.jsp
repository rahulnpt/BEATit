<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BEATit</title>

<style type="text/css">
.search-box{
	width: 550px !important;
	margin-left: 39px;
}
.badge1 {
   position:relative;
}
.badge1[data-badge]:after {
    content: attr(data-badge);
    position: absolute;
    top: -6px;
    right: -5px;
    font-size: .7em;
    background: #007bff;
    color: #ffffff;
    width: 18px;
    height: 18px;
    text-align: center;
    line-height: 18px;
    border-radius: 50%;
    /* box-shadow: 0 0 1px #333; */
    /* border: 0.01em solid #007bff; */
}
.dropdown-toggle::after {
    display:none;
}
.user-img{
    border-radius: 50%;
    height: 40px;
    width: 40px;
}
.navbar-nav > li{
  padding-left:20px;
  padding-right:20px;
}
.user-img{
    width: 45px;
    height: 43px;
    margin-top: -14px;
    margin-bottom: -14px;
    border: 1px solid #dedede;
    border-radius: 5px;
}
</style>

<!-- Initialize Bootstrap functionality -->
<script>
</script>
</head>
<body>
<nav class="navbar navbar-expand-sm bg-light py-lg-3">
   <a class="navbar-brand" href="${pageContext.request.contextPath}/home">BEATit</a>
 <form class="form-inline">
    <div class="input-group search-box">
      <input type="text" class="form-control" placeholder="Search BEATit" aria-label="Search" aria-describedby="basic-addon1">
      <div class="input-group-append">
        <span class="input-group-text" id="basic-addon1"><i class="fas fa-search"></i></span>
      </div>
    </div>
  </form>
  
  <ul class="navbar-nav ml-auto">
    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <img class="user-img" alt="" src="${pageContext.request.contextPath}/images/profile/1.jpg">
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
    <li class="nav-item">
      <a class="nav-link badge1" href="#" data-badge="27"><i class="fas fa-envelope"></i></a>
    </li>
    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        <i class="fas fa-list-ul"></i>
        </a>
        <div class="dropdown-menu  dropdown-menu-right" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
          <form:form class="form-inline my-2 my-lg-0" action="${pageContext.request.contextPath }/logout" method="post">
	      <button class="dropdown-item" type="submit">Logout</button>
	    </form:form>
        </div>
      </li>
  </ul>
</nav>
<br>


<%-- <nav class="navbar navbar-expand-lg navbar-light bg-light">
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
  </div>
</nav> --%>

</body>
</html>