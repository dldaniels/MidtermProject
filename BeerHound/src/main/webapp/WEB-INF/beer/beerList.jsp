<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>beer list</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
	<link rel="stylesheet" href="css/beer.css">
	
	
<!-- 	style="height: 500px; padding-top: 150px:"/>
	 -->
	
</head>



<body>
<div class="container">
<jsp:include page = "../headersFooters/header.jsp"></jsp:include>
</div>

  <!-- <div class="content"> 
       <div style='position:absolute;zindex:0;left:0;top:0;width:100%;height:100%'>
           <img src="https://standard-knapp.com/dev/wp-content/uploads/2020/06/craft-beer.jpg" style='width:100%;height:100%' alt='[]' />
       </div>
   </div> -->
   
<!--    <style> {
    background-image: url(https://standard-knapp.com/dev/wp-content/uploads/2020/06/craft-beer.jpg" style='width:100%;height:100%' alt='[]');
}
.no-background {
    background-image: url("images/blank.jpg");
}
</style> -->

<br>
<br>
<br>
<br>
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
		Add A Beer: <input type= "submit" value = "Add Beer" />
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
<%-- 		<div class="container">
<jsp:include page = "../headersFooters/footer.jsp"></jsp:include>
</div> --%>

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