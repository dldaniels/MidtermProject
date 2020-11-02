<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Brewery info</title>
</head>
<body>
<div class="container-fluid">
	<c:choose>
		<c:when test="${! empty brewery }">
			<div>
			
				<h2>${brewery.name}</h2>
				
				<h3>List of beers</h3><br>
	
	<table>
		<tbody>
			<c:forEach items="${brewery.beers}" var="beer">
				<tr>
					
					<td><a href="getBeer.do?id=${beer.id}">${beer.name}</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
					
				<p>${brewery.address}</p>
				
				
			<p>	<a href="${brewery.breweryWebsite}">${brewery.breweryWebsite}</a> <p>
				
				
				
				<img src="${beer.imageUrl}" width = "200" height = "200">
				
			</div><br>
			
			<form action="getBreweryUpdate.do" method="GET">
				<input type="hidden" name="id" value="${brewery.id }" /> <input
					type="submit" value="Update brewery info" />
			</form>
			<br>

			<form action="deleteBrewery.do" method="GET">
				<input type="hidden" name="id" value="${brewery.id}" /> <input
					type="submit" value="Delete brewery" />
			</form>
			<br>

			<form action="/" method="GET">
				<input type="hidden" name="" value="" /> <input type="submit"
					value="Back to home page" />
			</form>
			<br>
		</c:when>
		<c:otherwise>
			<p>No result</p>
			<br>
			<form action="index.do" method="GET">
				<input type="hidden" name="" value="" /> <input type="submit"
					value="Back to home page" />
			</form>

		</c:otherwise>
	</c:choose>

</div>
</body>
</html>