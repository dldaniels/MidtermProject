<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>Brewery edit</title>
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
		<c:when test= "${! empty loginUser}">

		<h2>	Brewery you are editing: ${brewery.name} </h2><br>
			
			<img src="${brewery.breweryLogoUrl}" width = "150" height = "150">
			
			
			<form action="updateBrewery.do" method="GET"><br>
			
				<label for="name">Change Brewery Name:</label> <input type="text" name="name"
					value="${brewery.name}" /> <input type="hidden" name="id"
					value="${brewery.id}" /> 
			<br>
				<%-- <label for="address">Address:</label> <input type="text" name="address"
					value="${brewery.address}" /> <input type="hidden" name="id"
					value="${brewery.id}" />  --%>
			<br>
		<%-- 		<label for="breweryWebsite">Website:</label> <input type="text" name="breweryWebsite"
					value="${brewery.breweryWebsite}" /> <input type="hidden" name="id"
					value="${brewery.id}" /> 
			<br>
				<label for="breweryLogoUrl">Brewery Logo:</label> <input type="text" name="breweryLogoUrl"
					value="${brewery.breweryLogoUrl}" /> <input type="hidden" name="id"
					value="${brewery.id}" /> 
			<br> --%>
			
			<h3>List of beers to edit</h3><br>
	
	<table class="table table-striped table-hover">
		<thead class="thead thead-dark">
		  <tr>
			<th>Beer name</th>
			<th></th>
		  </tr>
		</thead>
		<tbody>
			<c:forEach items="${brewery.beers}" var="beer">
				<tr>
					<td><a href="getBeer.do?id=${beer.id}">${beer.name}</a></td>
					<td><img src="${beer.imageUrl}" width = "150" height = "150"></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
			<br>
				
			<br>
			<button class="btn btn-primary" type=“submit” name=“id” value=“${brewery.id}“>Submit</button>
			</form><br>
		</c:when>
		<c:otherwise>
			<h4>If you wish to edit this brewery you must login OR create a profile</h4>
			
			<br>
			<br>
			<br>
			<br>
			
			
			<form action="login" method="GET">
				<button type="submit" class="btn btn-primary">Login</button>
			</form><br>
			
			<form action="register.do" method="GET">
				<button type="submit" class="btn btn-primary">Create user profile</button>
			</form><br> 
			
			
			
		</c:otherwise>
	</c:choose>
 


			
			
		<%-- 	<form action="index.do" method="GET">
				<input type="hidden" name="" value="" /> <input type="submit"
					value="Back to home page" />
			</form><br> --%>
		

</div>

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

