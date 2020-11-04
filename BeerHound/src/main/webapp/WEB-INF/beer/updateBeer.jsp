<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update beer</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<jsp:include page="../headersFooters/header.jsp"></jsp:include>
	</div>
	<br>
	<br>
	
	<div class="container">
	 <c:choose>
		<c:when test= "${! empty loginUser}">
		<br>
		<br>
		<br>

	<h3>Edit Beer</h3>
	
	
	<div class="row"><h3>${beer.name}</h3>
	<div class="col">
			<img alt="User Profile Image" src="${beer.imageUrl }" height ="100" width ="100" >
		</div>
		</div>
		
	<div class="row">
		<div class="col">
			
			<table class="table">
				<form:form action="updateBeer.do" method="POST" modelAttribute="beer">
				<form:hidden path="id" value="${beer.id }"/>
			<%-- 	<form:hidden path="alcoholContent" value="${beer.alcoholContent}"/>
				<form:hidden path="description" value="${beer.description}"/>
				<form:hidden path="imageUrl" value="${beer.imageUrl }"/>
				<form:hidden path="name" value="${beer.name}"/> --%>
				
				
				<tr>
					<td><form:label path="name">Beer Name</form:label></td>
					<td><form:input path="name" value="${beer.name}"/></td>
					<td><form:errors path="name"/></td>
				</tr>
				<tr>
					<td><form:label path="alcoholContent">Alcohol Content</form:label></td>
					<td><form:input path="alcoholContent" value="${beer.alcoholContent }"/></td>
					<td><form:errors path="alcoholContent"/></td>
				</tr>
				
				
				<tr>
					<td><form:label path="description">Description</form:label></td>
					<td><form:input path="description" value="${beer.description }"/></td>
					<td><form:errors path="description"/></td>
				</tr>
				<tr>
					<td><form:label path="imageUrl">Image URL</form:label></td>
					<td><form:input path="imageUrl" value="${beer.imageUrl }"/></td>
					<td><form:errors path="imageUrl"/></td>
				</tr>
				<%-- <tr>
					<td><form:label path="email">Email</form:label></td>
					<td><form:input path="email" value="${user.email }"/></td>
					<td><form:errors path="email"/></td>
				</tr>
				<tr>
					<td>User Since</td><td>${user.createDate }</td>
				</tr>
				<tr>
					<td>Street</td><td>${user.address.street }</td>
					<td><form:label path="address.street">Street</form:label></td>
					<td><form:input path="address.street" value="${user.address.street }"/></td>
					<td><form:errors path="address.street"/></td>
				</tr>
				<tr>
					<td>City</td><td>${user.address.city }</td>
					<td><form:label path="address.city">City</form:label></td>
					<td><form:input path="address.city" value="${user.address.city }"/></td>
					<td><form:errors path="address.city"/></td>
				</tr>
				<tr>
					<td>State</td><td>${user.address.state }</td>
					<td><form:label path="address.state">State</form:label></td>
					<td><form:select path="address.state">
						<form:option value="${user.address.state }"></form:option>
						<form:options items="${stateAbbrevs }"/>
						</form:select>
					</td>
					<td><form:errors path="address.state"/></td>
				</tr>
				<tr>
					<td>ZIP</td><td>${user.address.zip }</td>
					<td><form:label path="address.zip">ZIP</form:label></td>
					<td><form:input path="address.zip" value="${user.address.zip }"/></td>
					<td><form:errors path="address.zip"/></td>
				</tr> --%>
				<tr>
					<td><input type="submit" value="Update Information"/></td>
				</tr>
				</form:form>
			</table>
			
		</div>	
	

<%-- 
	<form action="updateBeer.do" method="Post">
	<div class="row">Name of Beer:
	<div class ="col"<input type="text" name="name" value="${beer.name}">
	</div>
	</div>
	<br>
	
	Type of Beer:&nbsp;
	<input type="dropdown">
        <select name="typeOfBeer">
            <c:forEach items="${typeOfBeer}" var="typeOfBeer">
                <option value="${typeOfBeer.id}"
                    <c:if test="${typeOfBeer.id eq selectedId}">selected="selected"</c:if>
                    >
                    ${typeOfBeer.name}
                </option>
            </c:forEach>
        </select>
	
	
	<input type="dropdown" name="type" value="${beer.typeOfBeer.typeName}" />
	<br> Alcohol content:
	<input type="number" name="alcoholContent" step=".1"
		value="${beer.alcoholContent }" />
	<br> ImageUrl:
	<input type="text" name="imageUrl" value="${beer.imageUrl}" />
	<br>
	<input type="text" name="description" value="${beer.description}"/>
	<button class="btn btn-warning" type="submit" name="id"
		value="${beer.id}">Update Beer</button>

	</form>
 --%>

	</c:when>
		<c:otherwise>
		
		<br>
		<br>
		<br>
			<h4>If you wish to edit this brewery you must login OR create a profile</h4>
			
			
			
			
			
			
 


			<br>
			<br>
			<br>
			<br>
			
			<form action="login" method="GET">
				<input type="hidden" name="" value="" /> <input type="submit"
					value="Login" />
			</form><br>
			
			<form action="register.do" method="GET">
				<input type="hidden" name="" value="" /> <input type="submit"
					value="Create a user profile" />
			</form><br>
	 	</c:otherwise>
	
	</c:choose> 
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