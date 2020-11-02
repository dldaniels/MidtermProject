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
<jsp:include page = "../headersFooters/header.jsp"></jsp:include>
</div>
<br>
<br>
<br>
<br>

<div class="container-fluid">
<form action="updateBeerForm.do" method="GET">
				<button class= "btn btn-outline-primary" type ="submit"	name="id" value="${beer.id }">Edit Beer</button>
					
			</form>
			<br>

			<form action="deleteBeer.do" method="GET">
				<input type="hidden" name="id" value="${beer.id}" /> <input
					type="submit" value="Delete Beer" />
			</form>
			<br>

			<form action="/" method="GET">
				<input type="hidden" name="" value="" /> <input type="submit"
					value="Home" />
			</form>
		

<h2>${beer.name}</h2>
<br>
<h2>${beer.typeOfBeer.typeName} Alcohol Content: ${beer.alcoholContent}% </h2>

<br>
<h2>${beer.brewery.name}</h2>
<br>
<img src="${beer.imageUrl}" width = "200" height = "200">

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