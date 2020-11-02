<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	
	
	
	
	
	
	
	 <label>Leave a review</label>
          <textarea>
          
          </textarea>
	
	
</body>
</html>