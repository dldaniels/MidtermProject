<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	<%@ taglib uri="/WEB-INF/custom-functions.tld" prefix="fn" %>


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
	<div class="row"></div>
		<h3>${bar.name}</h3>
		
		<c:set var="sum" value="${0}" />
			<c:forEach items="${bar.barRatings}" var="ratings">
				<c:set var="counter" value="${counter + 1}" />
				<c:set var="sum" value="${sum + ratings.starRating}" />
			</c:forEach>
			<a href="barReviews.do?id=${bar.id}">Average rating ${sum / counter} stars</a>
		
		
	
	<div class="row">
		<div class="col">
		
		<br> <%-- <img src="${bar.logoUrl}" width="200" height="200" /> --%>
		<c:if test="${empty bar.logoUrl}">
							<p>No Logo</p>
						</c:if>
						<c:if test="${! empty bar.logoUrl}">
							<p><img src="${bar.logoUrl}" width="200" height="200">
							</p>
						</c:if>
		</div>
		<div class="col">
		<p>${bar.description}
		<p>
		<p>${bar.phoneNumber}</p>
		<p><a href="${bar.website}">Website</a></p>
		<p>${bar.address.street} <br>${bar.address.city}, ${bar.address.state} ${bar.address.zip}</p>
		</div>
		<div class="col">
			<iframe
  				width="300"
  				height="250"
  				frameborder="3" style="border:0"
  				src="https://www.google.com/maps/embed/v1/place?key=AIzaSyBHmCXr5IdHwRvUCAvA_cmXjJadZe0Ldzw
    			&q=${bar.address.street },${bar.address.city },${bar.address.state }" allowfullscreen>
			</iframe>
		</div>
	</div>
		<table class="table table-striped table-hover">
			<thead class="thead thead-dark">
				<tr>
					<th>List of Beers</th>
					<th></th>
					<th></th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${bar.beerPrices}" var="beerPrice">
					<tr>
						<td><a href="getBeer.do?id=${beerPrice.beer.id}">${beerPrice.beer.name}</a></td>
						<td><img src="${beerPrice.beer.imageUrl}" width="100"
							height="100"/></td>
							<td>Beer Price: ${beerPrice.beerPrice}</td>
						<td><c:choose>

								<c:when test="${empty loginUser }">
									<form action="login" method="GET">
										<input type="hidden" name="" value="" /> <button type="submit"
											value="Login to edit bar menu">Login to edit bar menu</button>
									</form>
								</c:when>



								<c:when test="${! empty loginUser}">

									<form action="removeBeer.do" method="POST">
										<input type="hidden" name="beerPriceId"
											value="${beerPrice.id}" /> <input type="hidden" name="barId"
											value="${bar.id}" /> <button type="submit"
											value="Delete beer from menu">Delete Beer from Menu</button>
									</form>

								</c:when>


							</c:choose></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>



		<!-- update menu -->
		<form action="updateMenu.do" method="post">
			<table>
				<tr>
					<td><input type="hidden" name="barId" value="${bar.id }">
					</td>
					<td><label for="beerPrice">Price:</label> <input type="number"
						step=".01" title="Currency" name="beerPrice" placeholder="0.00" min="0"></td>
					<td><select name="beerId">
							<c:forEach items="${beerList}" var="beer">
								<option value="${beer.id}">${beer.brewery.name } - ${beer.name}</option>
							</c:forEach>
					</select></td>

					<%-- <td>
				<form:label path="beerName">Beer</form:label>
					<form:select path="beerName">
						<form:option value="select a beer"></form:option>
						<form:options items="${beerList }"/>
					</form:select>
			</td> --%>
					<td>
						<button type="submit">Add Beer to menu</button>
					</td>
				</tr>
			</table>
		</form>




		<br>
		<div class="container-fluid">

<%-- 
			<h2>Reviews</h2>
			<c:set var="sum" value="${0}" />
			<c:forEach items="${bar.barRatings}" var="ratings">
				<c:set var="counter" value="${counter + 1}" />
				<c:set var="sum" value="${sum + ratings.starRating}" />
			</c:forEach>
			<p>Average rating ${sum / counter} stars</p>
			<table class="table table-striped table-hover">
			<thead class="thead thead-dark">
					<tr>
						<th>Rating</th>
						<th>Date</th>
						<th>Username</th>
						<th>Review</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${bar.barRatings}" var="ratings">

						<tr>
							<td>${ratings.starRating} stars</td>
							<td>${ratings.ratingDate}</td>
							<td><a href="getUser.do?id=${ratings.user.id}">${ratings.user.username}</a></td>
							<td>${ratings.review}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table> --%>



			<c:if test="${! empty loginUser }">


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

					<textarea name="review" value="" placeholder="leave review here"
						rows="5" cols="60"></textarea>
					<br>



					<button type=“submit”>Submit</button>




				</form:form>
			</c:if>

			<br>

			<c:if test="${empty loginUser }">

				<form action="login" method="GET">
					<input type="hidden" name="" value="" /> <button type="submit"
						value="Login to add a review">Login to add a review</button>
				</form>


			</c:if>
		</div>


		<!-- add to favorites -->
		<c:if test="${not empty loginUser }">
	<c:choose>
	<c:when test="${ ! fn:contains( loginUser.favoriteBarList, bar ) }">
	<div>
		<form action="favoriteBar.do" method="GET">
			<button type="submit" name="barId"
					value="${bar.id}">Add to Favorites
			</button>
		</form>
	</div>
	</c:when>
	<c:otherwise>
		<form action="favoriteBar.do" method="GET">
			<button type="submit" name="barId"
					value="${bar.id}">Remove from Favorites
			</button>
		</form>
	</c:otherwise>
	</c:choose>
	</c:if>
	
		<br>
		<c:choose>

			<c:when test="${empty loginUser }">
				<form action="login" method="GET">
					<input type="hidden" name="" value="" /> <button type="submit"
						value="Login to update Bar Info">Login to Update Bar Info</button>
				</form>
			</c:when>
			<c:when test="${! empty loginUser}">

				<form action="updatebar.do" method="GET">
					<input type="hidden" value="${bar.id}" name="id"> <button
						type="submit" value="Update Bar info">Update Bar Info</button>
				</form>
			</c:when>
		</c:choose>
		<c:choose>
			<c:when test="${empty loginUser }">
				<form action="login" method="GET">
					<input type="hidden" name="" value="" /> <button type="submit"
						value="Login to Delete Bar">Login to Delete Bar</button>
				</form>
			</c:when>
			<c:when test="${! empty loginUser}">

				<form action="deletebar.do" method="GET">
					<input type="hidden" value="${bar.id}" name="id"> <button
						type="submit" value="Delete Bar">Delete Bar</button>
				</form>
			</c:when>


		</c:choose>
		<form action="/" method="GET">
			<input type="hidden" name="" value="" /> <Button type="submit"
				value="Home">Home</Button>
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

