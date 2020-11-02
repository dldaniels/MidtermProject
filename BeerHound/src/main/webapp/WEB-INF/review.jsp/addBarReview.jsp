<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bar Info</title>

</head>
<body>
<div>
<h5>Bar name: ${bar.name}</h5><br>
<p>Bar Contact: ${bar.phoneNumber}, ${bar.website}</p>
<p> Bar info: ${bar.description}, ${bar.address}</p>
<p> bar Price: ${bar.beerPrices}, Bar Rating: ${bar.barRating}</p>
</div>

<!-- REVIEW ADDITION -->



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
			<c:forEach items="${bar.barRatings}" var="ratings">
				<tr>
					<td>${ratings.ratingDate}</td>
					<td>${ratings.starRating}</td>
					<td>${ratings.user}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>


<form action="addedBarRating.do" method="GET"><br>
<h2>Add review</h2>






          <textarea> 
       
          </textarea>
          <br>
          <br>
		<br>

<button type=“submit” name=“id” value=“${bar.id}“>Submit</button>
</form>

</body>
</html>