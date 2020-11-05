<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


  <nav class="navbar navbar fixed-top navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="index.do">
    <img src="images/beerhoundimage.jpg"  height ="50" width ="50" alt="" class ="img-thumbnail"></a>
     <a class="navbar-brand" href="index.do"> Beer Hound</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse container-fluid" id="navbarColor01">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
          <a class="nav-link" href="beerIndex.do">Beers</a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="barIndex.do">Bars<span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="breweryIndex.do">Breweries</a>
        </li>
        <c:choose>
        <c:when test="${not empty loginUser }">
        <li class="nav-item active">
          <a class="nav-link" href="getUser.do?id=${loginUser.id }">Profile<span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="logout.do">Logout<span class="sr-only">(current)</span></a>
        </li>
        <c:if test="${loginUser.role == 'ADMIN' }">
        <li class="nav-item active">
          <a class="nav-link" href="userIndex.do">Users<span class="sr-only">(current)</span></a>
        </li>
        </c:if>
        </c:when>
        <c:otherwise>
        <li class="nav-item active">
          <a class="nav-link" href="login">Login<span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="register.do">Register<span class="sr-only">(current)</span></a>
        </li>
        </c:otherwise>
        </c:choose>
      </ul>
      <form class="form-inline" action="searchAll.do" method = "GET">
        <input class="form-control mr-sm-2"  type="text" name = "keyword" placeholder="Search" aria-label="Search" />
        <button class="btn btn-outline-info my-2 my-sm-0" type="submit">Search</button>
      </form>
    </div>
  </nav>

</body>
</html>