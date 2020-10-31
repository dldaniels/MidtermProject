<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Brewery edit</title>
</head>
<body>
<div class="container-fluid">

	 <c:choose>
		<c:when test="${! empty brewery }">

			brewery you are editing: ${brewery.brand} - ${brewery.name}
			<br>
			
			<form action="updateBrewery.do" method="GET"><br>
			
				<label for="name">Name:</label> <input type="text" name="name"
					value="${brewery.name}" /> <input type="hidden" name="id"
					value="${brewery.id}" /> 
			<br>
				<label for="address">Address:</label> <input type="text" name="address"
					value="${brewery.address}" /> <input type="hidden" name="id"
					value="${brewery.id}" /> 
			<br>
				<label for="breweryWebsite">Length:</label> <input type="text" name="breweryWebsite"
					value="${brewery.breweryWebsite}" /> <input type="hidden" name="id"
					value="${brewery.id}" /> 
			<br>
				<label for="breweryLogoUrl">Brewery Logo:</label> <input type="text" name="breweryLogoUrl"
					value="${brewery.breweryLogoUrl}" /> <input type="hidden" name="id"
					value="${brewery.id}" /> 
			<br>
			
			<h3>List of beers to edit</h3><br>
	
	<table>
		<thead>
		  <tr>
			<th>Beer ID</th>
			<th>Name</th>
		  </tr>
		</thead>
		<tbody>
			<c:forEach items="${brewery.beers}" var="beer">
				<tr>
					<td>${beer.id}</td>
					<td><a href="getBeer.do?id=${beer.id}">${beer.name}</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
			<br>
				
			<br>
			<button type=“submit” name=“id” value=“${brewery.id}“>Submit</button>
			</form><br>
		</c:when>
		<c:otherwise>
			<p>No result</p>
		</c:otherwise>
	</c:choose>
 
</div>
</body>
</html>

