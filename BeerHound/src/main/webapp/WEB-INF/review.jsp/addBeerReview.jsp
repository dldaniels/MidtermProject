<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>show beer</title>
</head>
<body>

<h2>${beer.name}</h2>
<br>
<h2>${beer.typeOfBeer}</h2>
<br>
<h2>${beer.brewery}</h2>
<br>
<img src="${beer.imageUrl}" width = "200" height = "200">

	
		<h2>Reviews</h2>

<table>
		<thead>
		  <tr>
			<th>Date</th>
			<th>Rating</th>
			<th>Username</th>
		  </tr>
		</thead>
		<tbody>
			<c:forEach items="${beer.beerRating}" var="ratings">
				<tr>
					<td>${ratings.ratingDate}</td>
					<td>${ratings.starRating}</td>
					<td>${ratings.user}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
		<br> 

		<form:form action="addedBeerReview.do" method="GET">
		<form: path="rating" value="${beerRating.beer }">
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

			<button type=“submit”>Submit</button>


		</form>
	</div>

	
	
</body>
</html>