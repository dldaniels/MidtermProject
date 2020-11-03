<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bar Info</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
	<link rel="stylesheet" href="/css/review.css">
</head>
<body>
	<div class="container">
		<jsp:include page="../headersFooters/header.jsp"></jsp:include>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>

	<div class="container-fluid">
		<h3>${bar.name}</h3>
		<br>
		<p>${bar.description}
		<p>
		<p>${bar.phoneNumber}</p>
		<p>${bar.website}</p>
		<p>${bar.address}</p>
		<table class="table table-dark">
		<thead>
		  <tr>
		  <th>List of Beers</th>
		  </tr>
		</thead>
		<tbody>
			<c:forEach items="${bar.beerPrices}" var="beerPrice">
				<tr>
					<td><a href="getBeer.do?id=${beerPrice.beer.id}">${beerPrice.beer.name}</a></td>
					<td><img src="${beerPrice.beer.imageUrl}" width ="100" height = "100">
				</tr>
		</c:forEach>
		</tbody>
	</table>
		<!-- update menu -->
		<form action="updateMenu.do" method="post">
		<table>
		<tr>
			<td>
				<input type="hidden" name="barId" value="${bar.id }">
			</td>
			<td>
				<label for="price">Price:</label>
				<input type="number" name="price" value=4>
			</td>
			<td>
				<select name="beerId">
					<c:forEach items="${beerList}" var="beer">
    					<option value="${beer.id}">${beer.name}</option>
					</c:forEach>
				</select>
			</td>
			
			<%-- <td>
				<form:label path="beerName">Beer</form:label>
					<form:select path="beerName">
						<form:option value="select a beer"></form:option>
						<form:options items="${beerList }"/>
					</form:select>
			</td> --%>
			<td>
				<button type="submit">Submit</button>
			</td>
		</tr>
		</table>
	</form>
	
<br>
<div class="container-fluid">

	<form:form action="addedBarRating.do" method="GET"
		modelAttribute="barRating">
		<input path="bar" name="barId" value="${ bar.id }" type="hidden">

		<fieldset class="rating">
			<input type="radio" id="star5" name="starRating" value=5 /><label
				class="full" for="star5" title="Awesome - 5 stars"></label> <input
				type="radio" id="star4" name="starRating" value=4 /><label
				class="full" for="star4" title="Pretty good - 4 stars"></label> <input
				type="radio" id="star3" name="starRating" value=3 /><label
				class="full" for="star3" title="Meh - 3 stars"></label> <input
				type="radio" id="star2" name="starRating" value=2 /><label
				class="full" for="star2" title="Kinda bad - 2 stars"></label> <input
				type="radio" id="star1" name="starRating" value=1 /><label
				class="full" for="star1" title="Sucks big time - 1 star"></label>
		</fieldset>
		<br>
		<br>
		
		<textarea name ="review" value="" placeholder="leave review here" rows="5" cols="60">
          
         </textarea>
		<br>

		<button type=“submit”>Submit</button>
	</form:form>
	</div>
	<br>
	<!-- add to favorites -->
	<c:if test="${not empty loginUser }">
	<div>
		<form action="favoriteBar.do" method="GET">
			<button class="btn btn-outline-secondary" type="submit" name="barId"
					value="${bar.id}">Add to Favorites
			</button>
		</form>
	</div>
	</c:if>
	<br>
	<form action="updatebar.do" method="GET">
	<br>
	<br>

	<br>
	 <form action="updatebar.do" method="GET">
		<input type="hidden" value="${bar.id}" name="id"> <input
			type="submit" value="Update Bar info">
	</form>
	<form action="deletebar.do" method="GET">
		<input type="hidden" value="${bar.id}" name="id"> <input
			type="submit" value="Delete Bar">
	</form>
	<form action="/" method="GET">
		<input type="hidden" name="" value="" /> <input type="submit"
			value="Home" />
	</form> 
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