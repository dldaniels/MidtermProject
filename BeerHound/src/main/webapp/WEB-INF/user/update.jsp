<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<title>Profile</title>
</head>
<body>
<div class="container">
<c:choose>
<c:when test="${not empty user }">
	<div class="row"><h3>${user.username }</h3></div>
	
	<div class="row">
		<c:choose>
		<c:when test="${user.id == loginUser.id }">
		<div class="col">
			<h4>Actions</h4>
			<a href="updateUser.do">Update Profile</a>
			<br>
			<form action="deleteUser.do">
				<input type="hidden" name="id" value="${user.id }">
				<input type="submit" value="Delete Profile" class="button">
			</form>
		</div>
		</c:when>
		</c:choose>
		<div class="col">
			<img alt="User Profile Image" src="${user.image }">
		</div>
	</div>
	
	<div class="row">
		<div class="col">
			<h4>Info</h4>
			<table class="table">
				<form:form action="updateUser.do" method="POST" modelAttribute="user">
				<form:hidden path="id" value="${user.id }"/>
				<form:hidden path="enabled" value="${user.enabled }"/>
				<form:hidden path="role" value="${user.role }"/>
				<form:hidden path="image" value="${user.image }"/>
				<form:hidden path="favoriteBarList" value="${user.favoriteBarList }"/>
				<form:hidden path="favoriteBeerList" value="${user.favoriteBeerList }"/>
				<form:hidden path="barRatings" value="${user.barRatings }"/>
				<form:hidden path="beerRatings" value="${user.beerRatings }"/>
				<form:hidden path="biography" value="${user.biography }"/>
				<tr>
					<td>ID</td><td>${user.id }</td>
				</tr>
				<tr>
					<td><form:label path="username">Username</form:label></td>
					<td><form:input path="username" value="${user.username }"/></td>
					<td><form:errors path="username"/></td>
				</tr>
				<tr>
					<td><form:label path="password">Password</form:label></td>
					<td><form:input path="password" value="${user.password }"/></td>
					<td><form:errors path="password"/></td>
				</tr>
				<tr>
					<td>Enabled</td><td>${user.enabled }</td>
				</tr>
				<tr>
					<td>Role</td><td>${user.role }</td>
				</tr>
				<tr>
					<td><form:label path="firstName">First Name</form:label></td>
					<td><form:input path="firstName" value="${user.firstName }"/></td>
					<td><form:errors path="firstName"/></td>
				</tr>
				<tr>
					<td><form:label path="lastName">Last Name</form:label></td>
					<td><form:input path="lastName" value="${user.lastName }"/></td>
					<td><form:errors path="lastName"/></td>
				</tr>
				<tr>
					<td><form:label path="email">Email</form:label></td>
					<td><form:input path="email" value="${user.email }"/></td>
					<td><form:errors path="email"/></td>
				</tr>
				<tr>
					<td>User Since</td><td>${user.createDate }</td>
				</tr>
				<tr>
					<td>Street</td><td>${user.address.street }</td>
				</tr>
				<tr>
					<td>City</td><td>${user.address.city }</td>
				</tr>
				<tr>
					<td>State</td><td>${user.address.state }</td>
				</tr>
				<tr>
					<td>ZIP</td><td>${user.address.zip }</td>
				</tr>
				<tr>
					<td><input type="submit" value="Update"/></td>
				</tr>
				</form:form>
			</table>
			
		</div>
		<div class="col">
			<h4>Bio</h4>
				<p>${user.biography }</p>
			<h4>Favorites</h4>
			<table class="table">
					<tr>
						<th>Bars</th>
					</tr>
				<c:forEach items="${user.favoriteBarList }" var="i">
					<tr>
						<td><a href="getBar.do?id=${i.id }">${i.name }</a></td>
					</tr>
				</c:forEach>
					<tr>
						<th>Beer</th>
					</tr>
				<c:forEach items="${user.favoriteBeerList }" var="i">
					<tr>
						<td><a href="getBeer.do?id=${i.id }">${i.name }</a></td>
					</tr>
				</c:forEach>
			
			</table>
			<h4>Reviews</h4>
			<table class="table">
					<tr>
						<th>Bars</th>
					</tr>
				<c:forEach items="${user.barRatings }" var="i">
					<tr>
						<td><a href="getBar.do?id=${i.bar.id }">${i.bar.name }</a></td>
					</tr>
				</c:forEach>
					<tr>
						<th>Beer</th>
					</tr>
				<c:forEach items="${user.beerRatings }" var="i">
					<tr>
						<td><a href="getBeer.do?id=${i.beer.id }">${i.beer.name }</a></td>
					</tr>
				</c:forEach>
			
			</table>
		</div>
		
			
		
	</div>
	
		
		
	
	
	
	
	
	
	
	
</c:when>
<c:otherwise>
		<h3>No Result</h3>
</c:otherwise>
</c:choose>
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