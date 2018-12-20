<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customers List</title>
<!-- Refernces to CSS  -->
<link type="text/css" rel="stylesheet" 
href="${pageContext.request.contextPath}/resources/css/style.css" />
</head>
<body>

	<div id="wrapper">
		<div id="header">
			<h2>CRM - Customer Relationship Manager</h2>
		</div>
	</div>
	
	<div id="container">
		<div id="content">
		
		<!-- Put New button to Add New Customer -->
		<input type="button" value="Add Customer" onclick="window.location.href='showFormForAdd';return fasle;" class="add-button"/>
		
			<!-- Add out HTML Table Here -->
			<table>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email </th>
					<th>Action</th>
				</tr>
				<!-- Loop over and print out customers-->
				 <c:forEach var="tempCustomer" items="${customers}">
				 
				 <!-- Construct an "update link" with customer ID -->
				 
				 <c:url var="updatelink" value="/customer/showFormForUpdate">
				 	<c:param name="customerId" value="${tempCustomer.id}"></c:param>
				 </c:url>
				 
				 <!-- Construct an "Delete link" with customer ID -->
				 
				  <c:url var="deletelink" value="/customer/delete">
				 	<c:param name="customerId" value="${tempCustomer.id}"></c:param>
				 </c:url>
				 
				 	<tr>
					<td>${tempCustomer.firstName}</td>
					<td>${tempCustomer.lastName}</td>
					<td>${tempCustomer.email}</td>
					<td>
						<!-- Display Update Link -->
						<a href="${updatelink}">Update</a>
						|
						<a href="${deletelink}" 
						onclick="if (!(confirm('Are you sure want to delete a this customer ?'))) return false">
						Delete</a>
					</td>
					</tr>
				 </c:forEach>
				
			</table>
		</div>
	</div>

</body>
</html>