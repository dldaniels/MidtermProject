<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update beer</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<jsp:include page="../headersFooters/header.jsp"></jsp:include>
	</div>
	<br>
	<br>

	<h3>Edit Beer</h3>

	<%-- <form:hidden path="id" value="${beer.id}"/>
<form:hidden path="name" value="${beer.name}"/>
<form:hidden path="typeOfBeer" value="${beer.typeOfBeer.typeName}"/>
<form:hidden path="alcoholContent" value="${beer.alcoholContent}"/>
<form:hidden path="imageUrl" value="${beer.imageUrl}"/>

<form:label path="name">Name</form:label>
<form:input path="name" value="${beer.name}"/>
<form:errors path="name"/>

<form:label path="typeOfBeer">Type of Beer</form:label>
<form:input path="typeOfBeer" value="${beer.typeOfBeer}"/>
<form:errors path="typeOfBeer"/>

<form:label path="alcoholContent">Alcohol Content</form:label>
<form:input path="alcoholCOntent" value="${beer.alcoholContent}"/>
<form:errors path="alcoholContent"/>

<form:label path="imageUrl">Image URL</form:label>
<form:input path="imageUrl" value="${beer.imageUrl}"/>
<form:errors path="imageUrl"/> --%>


	<form action="updateBeer.do" method="Post" />
	Name of Beer:
	<input type="text" name="name" value="${beer.name}" />
	<br> Type of Beer:
	<input type="text" name="type" value="${beer.typeOfBeer.typeName}" />
	<br> Alcohol content:
	<input type="number" name="alcoholContent" step=".1"
		value="${beer.alcoholContent }" />
	<br> ImageUrl:
	<input type="text" name="imageUrl" value="${beer.imageUrl}" />
	<br>
	<input type="text" name="description" value="${beer.description}"/>
	<button class="btn btn-warning" type="submit" name="id"
		value="${beer.id}">Update Beer</button>

	</form>

	<div class="container-fluid">
		<c:choose>
			<c:when test="${! empty beer.name }">
				<div class="alert alert-warning alert-dismissible fade show"
					role="alert">
					<strong>Thank You!</strong> Your update was successful.
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

			</c:when>
		</c:choose>
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