<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<div>
		<form action="updateBar.do"method "GET">
			<input type="hidden" value="${bar.id}" name="id"> <input
				type="submit" value="Update SuperBowl">
		</form>
	</div>
	<div>
		<form action="deletebar.do"method "GET">
			<input type="hidden" value="${bar.id}" name="id"> <input
				type="submit" value="Delete Bar">
		</form>
	</div>
</body>
</html>