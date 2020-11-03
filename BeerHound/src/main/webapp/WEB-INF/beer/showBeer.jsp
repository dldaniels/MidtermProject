<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>show beer</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/review.css"></link>
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
<<<<<<< HEAD
<<<<<<< HEAD
=======
=======

>>>>>>> b8195b22690c4a219c2aa34d320cb87c6b254e2b
		
		<table class="table table-dark">
		<thead>
		  <tr>
		  <th>List of Bars</th>
		  </tr>
		</thead>
		<tbody>
			<c:forEach items="${beer.beerPrice}" var="beerPrice">
				<tr>
					<td><a href="getBar.do?id=${beerPrice.bar.id}">${beerPrice.bar.name}</a></td>
					<td><img src="${beerPrice.bar.logoUrl}" width ="100" height = "100">
				</tr>
		</c:forEach>
		</tbody>
	</table>
	<%-- 	<form action="updateBeerForm.do" method="GET">
			<button class="btn btn secondary" type="submit" name="id"
				value="${beer.id }">Edit Beer</button>
<<<<<<< HEAD
>>>>>>> 7444161d03aeab449248b80ecd74e75ab24cb597
=======

>>>>>>> b8195b22690c4a219c2aa34d320cb87c6b254e2b

		
		
		<form action="updateBeerForm.do" method="GET">
				<button class="btn btn-outline-secondary" type="submit" name="id"
					value="${dinosaur.id}">Edit Beer</button>
			</form>
		
		

		<br> <a href="getBrewery.do?id=${beer.brewery.id}">${beer.brewery.name}</a>
		<br> <img src="${beer.imageUrl}" width="200" height="200">
		<div>
		Like this beer? Give it a review!
		<form action="addedBeerReview.do" method="GET">
			<fieldset class="rating">
				<input type="radio" id="star5" name="rating" value="5" /><label
					class="full" for="star5" title="Awesome - 5 stars"></label> <input
					type="radio" id="star4half" name="rating" value="4 and a half" /><label
					class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
				<input type="radio" id="star4" name="rating" value="4" /><label
					class="full" for="star4" title="Pretty good - 4 stars"></label> <input
					type="radio" id="star3half" name="rating" value="3 and a half" /><label
					class="half" for="star3half" title="Meh - 3.5 stars"></label> <input
					type="radio" id="star3" name="rating" value="3" /><label
					class="full" for="star3" title="Meh - 3 stars"></label> <input
					type="radio" id="star2half" name="rating" value="2 and a half" /><label
					class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
				<input type="radio" id="star2" name="rating" value="2" /><label
					class="full" for="star2" title="Kinda bad - 2 stars"></label> <input
					type="radio" id="star1half" name="rating" value="1 and a half" /><label
					class="half" for="star1half" title="Meh - 1.5 stars"></label> <input
					type="radio" id="star1" name="rating" value="1" /><label
					class="full" for="star1" title="Sucks big time - 1 star"></label> <input
					type="radio" id="starhalf" name="rating" value="half" /><label
					class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>
			</fieldset>
			<br> <br>
			<textarea>
          </textarea>
			<br>
			<button type="submit">Submit</button>
		</form>
	</div>
		${beer.description}

	</div>


	<div class="container-fluid">
	

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
