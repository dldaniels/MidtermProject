<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
<jsp:include page = "../headersFooters/header.jsp"></jsp:include>
</div>
<br>
<br>
<br>
<br>
<div class="container">
<c:choose>
<c:when test="${not empty user && (user.enabled || loginUser.role == 'ADMIN')}">
	<div class="row"><h3>${user.username }</h3></div>
	
	<div class="row">
		<c:choose>
		<c:when test="${user.id == loginUser.id || loginUser.role == 'ADMIN'}">
		<div class="col">
			<h4>Actions</h4>
			<form action="updateUser">
				<input type="hidden" name="id" value="${user.id }">
				<button type="submit" class="btn btn-primary">Update profile</button>
			</form>
			<br>
			<form action="deleteUser.do">
				<input type="hidden" name="id" value="${user.id }">
				<button type="submit" class="btn btn-primary">Delete profile</button>
			</form>
		</div>
		</c:when>
		</c:choose>
		<div class="col">
			<img alt="User Profile Image" src="${user.image }" height="100">
		</div>
	</div>
	<br>
	
	<div class="row">
	
		<div class="col">
			<table class="table table-striped table-hover">
				<thead class="thead thead-dark">
					<tr>
						<th>Info</th><th></th>
					</tr>
				</thead>
				
				<tbody>
				
				<tr>
					<td>User ID</td><td>${user.id }</td>
				</tr>
				<tr>
					<td>Username</td><td>${user.username }</td>
				</tr>
				<c:if test="${user.id == loginUser.id }">
				<tr>
					<td>Password</td><td>${user.password }</td>
				</tr>
				</c:if>
				<c:if test="${loginUser.role == 'ADMIN'}">
				<tr>
					<td>Enabled</td><td>${user.enabled }</td>
				</tr>
				</c:if>
				<c:if test="${(user.id == loginUser.id && not empty user.role) || loginUser.role == 'ADMIN'}">
				<tr>
					<td>Role</td><td>${user.role }</td>
				</tr>
				</c:if>
				<c:if test="${user.id == loginUser.id || loginUser.role == 'ADMIN'}">
				<tr>
					<td>First Name</td><td>${user.firstName }</td>
				</tr>
				<tr>
					<td>Last Name</td><td>${user.lastName }</td>
				</tr>
				</c:if>
				<c:if test="${user.id == loginUser.id || loginUser.role == 'ADMIN'}">
				<tr>
					<td>Email</td><td>${user.email }</td>
				</tr>
				</c:if>
				<tr>
 					<td>User Since</td><td>
 					<fmt:parseDate  value="${user.createDate}"  type="date" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDate" />
 					<fmt:formatDate type="date" value="${parsedDate }"/>
 					</td>
				</tr>
				<c:if test="${user.id == loginUser.id || loginUser.role == 'ADMIN'}">
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
				</c:if>
				</tbody>
			</table>
			
		</div>
		
		<div class="col">
			<h4>Bio</h4>
				<p>${user.biography }</p>
			<table class="table table-striped table-hover">
				<thead class="thead thead-dark">
					<tr>
						<th>Favorites</th>
					</tr>
				</thead>
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
			<br>
			<table class="table table-striped table-hover">
				<thead class="thead thead-dark">
					<tr>
						<th>Reviews</th>
					</tr>
				</thead>
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


<div class="container-fluid">
<jsp:include page = "../headersFooters/footer.jsp"></jsp:include>
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