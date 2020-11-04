<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>INDEX</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
</head>
<body>
<div class="container">
<jsp:include page = "headersFooters/header.jsp"></jsp:include>
</div>
<br>
<br>
<br>
<br>
<div class="container">
<table class="table">
		<thead>
			<tr>
				<th>Users</th>
			</tr>
		</thead>
			<c:forEach items="${userList }" var="u">
				<tr>
					<td><a href="getUser.do?id=${u.id }">${u.id }</a>
				</tr>
			</c:forEach>
	</table>

<table class="table">
		<thead>
			<tr>
				<th>Bars</th>
			</tr>
		</thead>
			<c:forEach items="${barList  }" var="b">
				<tr>
					<td><a href="getBar.do?id=${b.id }">${b.id }</a>
				</tr>
			</c:forEach>
	</table>

<table class="table">
		<thead>
			<tr>
				<th>Beers</th>
			</tr>
		</thead>
			<c:forEach items="${beerList }" var="b">
				<tr>
					<td><a href="getBeer.do?id=${b.id }">${b.id }</a>
				</tr>
			</c:forEach>
	</table>

<table class="table">
		<thead>
			<tr>
				<th>Breweries</th>
			</tr>
		</thead>
			<c:forEach items="${breweryList }" var="b">
				<tr>
					<td><a href="getBrewery.do?id=${b.id }">${b.id }</a>
				</tr>
			</c:forEach>
	</table>
</div>

	<!-- bootstrap -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>
</body>
</html>