<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>add beer</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
</head>
<body>
<div class="container">
<jsp:include page = "../headersFooters/header.jsp"></jsp:include>
</div>
<br>
<br>
<br>
<br>
<div class="container">
	<form:form action="addBeer.do" method="GET" modelAttribute="beer">
	<br>
	<h5>New Beer:</h5>
	
	<form:label path="name">Beer Name:</form:label>
		<form:input path="name"/>
		<form:errors path="name"/>
		<br>
		<form:label path="alcoholContent">Alcohol Content:</form:label>
		<form:input path="alcoholContent"/>
		<form:errors path="alcoholContent"/>
		<br>
		<form:label path="description">Description:</form:label>
		<form:input path="description"/>
		<form:errors path="description"/>
		<br>
		<form:label path="imageUrl">Image URL:</form:label>
		<form:input path="imageUrl"/>
		<form:errors path="imageUrl"/>
		<br>
		
		<form:label path="typeOfBeer.id">Select Type of Beer:</form:label>
		<form:select path="typeOfBeer.id">
				<form:option value ="${1}">Lager</form:option>
				<form:option value ="${2}">IPA-English</form:option>
				<form:option value ="${3}">IPA-American</form:option>
				<form:option value ="${4}">Lager-American Light</form:option>
				<form:option value ="${5}">IPA-Session</form:option>
				<form:option value ="${6}">American Amber</form:option>
				<form:option value ="${7}">Blonde Ale</form:option>
				<form:option value ="${8}">IPA-Imperial/Double</form:option>
				<form:option value ="${9}">Milk Stout</form:option>
				<form:option value ="${10}">Brown Ale</form:option>
				<form:option value ="${11}">IPA-Hazy</form:option>
				<form:option value ="${12}">Belgian Style Ale</form:option>
				<form:option value ="${13}">Pilsner</form:option>
				<form:option value ="${14}">Wheat Beer</form:option>
				<form:option value ="${15}">Dark Lager</form:option>
				<form:option value ="${16}">Stout</form:option>
				<form:option value ="${17}">Porter</form:option>
				<form:option value ="${18}">Oatmeal Stout</form:option>
				<form:option value ="${19}">Irish Dry Stout</form:option>
				<form:option value ="${20}">Specialty Beer</form:option>
				<form:option value ="${21}">Wild & Sour Ale</form:option>
				<form:option value ="${22}">Other</form:option>
				        
<%-- 					<form:option value= "2">IPA-English</form:option>
					<form:option value= "3" ></form:option> --%>
		
		
		
			</form:select>	
				
		
		<form:errors path="typeOfBeer"/>
		<br>
		
		<input type="submit" value="Add beer" />
	
	



<!-- 
		Name of Beer: <input type="text" name="name" placeholder="name"
			required="required" /><br>
			Type of Beer: <input type="text" name="type" placeholder="type" /><br>
			Alcohol content: <input type="number" name="Alcohol content" step=".1" placeholder="Alcohol Content" /><br>
			Image Url: <input type="text"name="image" placeholder="image" /><br> 
			Description: <input type="text" name ="description"/> -->
		
	</form:form>
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