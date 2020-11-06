<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<title>beer list</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
	
	<!-- 
	<link rel="stylesheet" href="css/beer.css"> -->
	
<style>
body, html {
  height: 100%;
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}
.hero-image {
  background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url("images/beerLineup.jpg");
  height: 50%;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  position: relative;
}
.hero-text {
  text-align: center;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  color: white;
}
.hero-text button {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 10px 25px;
  color: black;
  background-color: #ddd;
  text-align: center;
  cursor: pointer;
}
.hero-text button:hover {
  background-color: #555;
  color: white;
}
</style>	

	
</head>





<body>
<div class="container">
<jsp:include page = "../headersFooters/header.jsp"></jsp:include>
</div>

<div class="hero-image">
  <div class="hero-text">
  <p> "Good people drink good beer"<br>
   - Hunter S. Thompson</p>
   

   
  </div>
</div>
	<div class="container-fuid">
		<br>
		<table class="table table-striped table-hover">
			<thead class="thead thead-dark">
				<tr>
					<th>Beer Name</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${beers}" var="beer">
					<tr>
						<td><a href="getBeer.do?id=${beer.id}">${beer.name}</a></td>
						<td><img src="${beer.imageUrl}" width ="100" height = "100"> 
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br>
		<br>
		<br>
		<br>
	
		<c:if test="${! empty loginUser }">
		<form action="addBeerForm.do" method="GET">
		<input type= "submit" value = "Add Beer" />
		</form>
		
		</c:if>
		
		<c:if test="${empty loginUser }">
		<form action="login" method="GET">
					<input type="hidden" name="" value="" /> <input type="submit"
						value="Login to add a beer" />
				</form>
		</c:if>

		<br>
		<br>
		<br>
		<br>

	</div>

	<div class="container-fluid">
<jsp:include page = "../headersFooters/footer.jsp"></jsp:include>
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