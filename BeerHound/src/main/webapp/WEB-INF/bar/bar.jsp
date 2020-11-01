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

</body>
</html>