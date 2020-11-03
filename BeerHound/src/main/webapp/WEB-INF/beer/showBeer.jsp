<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>show beer</title>
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
	<br>
	<br>
	



	<div class="container-fluid">
		<h2>${beer.name}</h2>
		<br>
		<h4>${beer.typeOfBeer.typeName}</h4>
		Alcohol Content:
		<h4>${beer.alcoholContent}%</h4>

		<br> <a href="getBrewery.do?id=${beer.brewery.id}">${beer.brewery.name}</a>
		<br> <img src="${beer.imageUrl}" width="200" height="200">
		${beer.description}

	</div>


	<div class="container-fluid">

	 	<ul class="list-group list-group-horizontal">
			<li class="list-group-item">

				<form action="/" method="GET">
				<button type="button" class="btn btn outline-secondary" type="submit" name=""
				value="">Home</button>
				
				
				
					<!-- <input type="hidden" name="" value="" /> <input type="submit"
						value="Home" /> -->
				</form>
	 		</li>
			<li class="list-group-item"> 

			<%-- 	<form action="updateBeerForm.do" method="GET">
					<input type="hidden" name="id" value="=${beer.id}" /> <input
						type="submit" value="Edit Beer" /> --%>


					<%-- name="id"
				value="${beer.id }">Edit Beer</button> --%>
	 <div class="container-fluid">
		<form action="updateBeerForm.do" method="GET">
			<button class="btn btn outline-secondary" type="submit" name="id"
				value="${beer.id }">Edit Beer</button>

		</form>
		</div> 
				


		 	</li>
			<li class="list-group-item">

				<form action="deleteBeer.do" method="GET">
					<button type= "button" class="btn btn secondary" type="submit" name="id" 
					value="${beer.id}">Delete Beer</button>
<!-- 
					type="submit" value="Delete Beer" /> -->
				</form>


			</li>
		</ul>

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
