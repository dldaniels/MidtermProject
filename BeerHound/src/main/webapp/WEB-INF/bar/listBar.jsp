<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List of Bars</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
</head>

<body>
	<div class="container">
		<jsp:include page="../headersFooters/header.jsp"></jsp:include><br>
	</div>
	<br>
	<div class="container-fluid">

		<h3>Bar List</h3>

		<form action="getBar.do" method="GET">
			Bar ID: <input type="text" name="id" /> <input type="submit"
				value="Find Bar" />
		</form>
			<form action="createBar.do" method="GET">
		<input type="hidden" name="" value="" /> <input type="submit"
			value="Add Bar" />
	</form>
		<table class="table table-dark">
			<thead class="thead thead-dark">
				<tr>
					<th>Bar Name</th>
					<th>Bar ID</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${bars}" var="bar">
					<tr>
						<td><a href="getBar.do?id=${bar.id}">${bar.name}</a></td>
						<c:if test="${empty bar.logoUrl}">
						<td>No Logo</td>
						</c:if>
						<c:if test="${! empty bar.logoUrl}">
						<td><img src="${bar.logoUrl}" width ="100" height = "100"> </td>
						</c:if>
					</tr>
				</c:forEach>
			</tbody>
		</table>

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