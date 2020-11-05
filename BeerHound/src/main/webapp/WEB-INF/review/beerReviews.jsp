<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>show beer</title>
</head>
<body>


<h2>Reviews</h2>

			<c:set var="sum" value="${0}" />
			<c:forEach items="${beer.beerRating}" var="ratings">
				<c:set var="counter" value="${counter + 1}" />
				<c:set var="sum" value="${sum + ratings.starRating}" />
			</c:forEach>
			<p>Average rating ${sum / counter} stars</p>
			<a href="beerReviews.do?id=${beer.id}">Average rating ${sum / counter} stars</a>
			
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
					<c:forEach items="${beer.beerRating}" var="ratings">

						<tr>
							<td>${ratings.starRating} stars</td>
							<td>${ratings.ratingDate}</td>
							<td><a href="getUser.do?id=${ratings.user.id}">${ratings.user.username}</a></td>
							<td>${ratings.review}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

<div>


	<br>

	<form:form action="addedBeerReview.do" method="GET"
		modelAttribute="beerRating">
		<input path="beer" name="beerId" value="${ beer.id }" type="hidden">

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
	
	
	<form action="getBeer.do" method="GET">
				<input type="hidden" name="id" value="${beer.id}" /> <input
					type="submit" value="Return to bar" />
			</form>
	
	</div>



</body>
</html>