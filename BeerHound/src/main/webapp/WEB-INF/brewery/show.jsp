<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" >
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
<br>
<br>
	<c:choose>
		<c:when test="${! empty brewery }">
			
			
				<div class="row">
				<div class="col">
				<h2><a href="${brewery.breweryWebsite}">
				${brewery.name}
				</a> </h2>
				<img src="${brewery.breweryLogoUrl}" width = "200" height = "200">
				<p>${brewery.address.street} ${brewery.address.city}, ${brewery.address.state} ${brewery.address.zip}</p>
				</div>
				<div class="col">
				<br>
			<iframe
  				width="300"
  				height="250"
  				frameborder="3" style="border:0"
  				src="https://www.google.com/maps/embed/v1/place?key=AIzaSyBHmCXr5IdHwRvUCAvA_cmXjJadZe0Ldzw
    			&q=${brewery.address.street },${brewery.address.city },${brewery.address.state }" allowfullscreen>
			</iframe>
		</div>
				</div>
				
				
				
				
			<%-- 	<p>	<a href="${brewery.breweryWebsite}">${brewery.breweryWebsite}</a> <p>  --%>
				
				
				
	</div>	
			<!-- 	<h3>List of beers</h3><br> -->
				
			<table class="table table-striped table-hover">
		
		<thead class="thead thead-dark">
		  <tr>
		  <th>List of Beers</th>
		  <th></th>
		  </tr>
		</thead>
				<br>

		<tbody>
			<c:forEach items="${brewery.beers}" var="beer">
				<tr>
					
					<td><a href="getBeer.do?id=${beer.id}">${beer.name}</a></td>
					<td><img src="${beer.imageUrl}" width ="100" height = "100">
					
					
				</tr>
			</c:forEach>
		</tbody>
	</table>
					
				
				
			
				
				

	<%-- 		<form action="/" method="GET">
				<input type="hidden" name="" value="" /> <input type="submit"
					value="Back to home page" />
			</form>
 --%>			
 <br>
		</c:when>
		<c:otherwise>
			<p>No result</p>
			<br>
		<%-- 	<form action="index.do" method="GET">
				<input type="hidden" name="" value="" /> <input type="submit"
					value="Back to home page" />
			</form> --%>

		</c:otherwise>
	</c:choose>
			<div class ="container-fluid">
				
<br>
			<form action="getBreweryUpdate.do" method="GET">
				<input type="hidden" name="id" value="${brewery.id }" /> 
				<button type="submit" class="btn btn-primary">Update brewery info</button>
			</form>
			<br>
		<c:if test="${! empty loginUser && loginUser.role== 'ADMIN'}">	
			<form action="deleteBrewery.do" method="GET">
				<input type="hidden" name="id" value="${brewery.id}" />
				<button type="submit" class="btn btn-danger">Delete brewery</button>
			</form>
			<br>
</c:if>


		


</div>


<div class="container-fluid">
<jsp:include page = "../headersFooters/footer.jsp"></jsp:include>
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