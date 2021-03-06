<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<title>List of Bars</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
	<style>
body, html {
  height: 100%;
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}
.hero-image {
  background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url("images/bar.jpg");
  height: 60%;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  position: relative;
}
.hero-text {
  text-align: center;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  color: white;
}
</style>	
</head>

<body>
<!-- <link rel="stylesheet" href="css/bar.css">
 -->
	<div class="container">
		<jsp:include page="../headersFooters/header.jsp"></jsp:include><br>
	</div>
	<div class="hero-image">
  <div class="hero-text">
  <p> “Beer, it’s the best damn drink in the world.”<br>
   - Jack Nicholson</p>
    </div>
</div>
	<div>
	<!-- 	<h3>Bar List</h3> -->
		<!-- <form action="getBar.do" method="GET">
			<input type="text" name="id" /> <input type="submit"
				value="Find Bar" />
		</form> -->
		<%-- <c:choose>
			<c:when test="${empty loginUser }">
				<form action="login" method="GET">
					<input type="hidden" name="" value="" /> <input type="submit"
						value="Login to add a bar" />
				</form>
			</c:when>
			<c:when test="${! empty loginUser}">
				<form action="createBar.do" method="GET">
					<input type="hidden" name="" value="" /> <input type="submit"
						value="Add Bar" />
				</form>
			</c:when>
		</c:choose> --%>
		<table class="table table-striped table-hover table-light">
			
			<tbody>
				<c:forEach items="${bars}" var="bar">
					<tr>
						<td><a href="getBar.do?id=${bar.id}">${bar.name}</a></td>
						<c:if test="${empty bar.logoUrl}">
							<td>No Logo</td>
						</c:if>
						<c:if test="${! empty bar.logoUrl}">
							<td><img src="${bar.logoUrl}" width="100" height="100">
							</td>
						</c:if>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<c:choose>
			<c:when test="${empty loginUser }">
				<form action="login" method="GET">
					<input type="hidden" name="" value="" /><button type="submit" class="btn btn-primary btn-lg btn-block">Login to Add Bar</button>
				</form>
			</c:when>
			<c:when test="${! empty loginUser}">

				<form action="createBar.do" method="GET">
					<input type="hidden" name="" value="" /> 
					<button type="submit" class="btn btn-primary btn-lg btn-block">Add Bar</button>
					<!-- 
					original button
					
					<button type="submit"
						value="Add Bar">Add Bar</button> 
						
						
						-->
				</form>
			</c:when>
		</c:choose>
		<br>
		<br>
		<br>
		<br>
	</div>
	<div class="container-fluid">
<jsp:include page = "../headersFooters/footer.jsp"></jsp:include>
</div>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"
		integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s"
		crossorigin="anonymous"></script>
</body>
</html>