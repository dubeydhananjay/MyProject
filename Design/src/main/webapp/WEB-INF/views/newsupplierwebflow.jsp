<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="resources/js/bootstrap.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>

</head>
<body>
<h2>Supplier Registration</h2>
<nav class="navbar navbar-inverse">
<div class="navbar-header">
<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNewNavbar">
 <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <div class="collapse navbar-collapse" id="myNewNavbar">
      <ul class="nav navbar-nav">
        <li ><a href="categories">Categories</a></li>
        <li><a href="subCategories">SubCategories</a></li>
        <li><a href="suppliers">Suppliers</a></li>
        <li><a href="products">Products</a></li>
        <li class="active"><a href="registration">Registration</a></li>
        <li><a href="home">Home</a></li>
        <li><a href="productSpecification">Product Specification</a></li>
      </ul>
      </div>
    </div>
  </nav>
  <br>
  
<form:form method="POST"  commandName="userDetail" >
               
   <div class="form-group">
    <label>User Name</label>
        <form:input path="username" class="form-control" />
        <!--  to display validation message -->
        	<c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('username')}" var="err">
        <div><span>${err.text}</span></div>
        </c:forEach></div>
    
   <div class="form-group">
        <label>First Name</label>
        <form:input path="firstname" class="form-control"/>
        <c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('firstname')}" var="err">
        <div><span>${err.text}</span></div>
        </c:forEach></div>
        
 <div class="form-group">
        <label>Last Name</label>
        <form:input path="lastname" class="form-control" />
        <c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('lastname')}" var="err">
        <div><span>${err.text}</span></div>
        </c:forEach></div>
       
     <div class="form-group">
        <label>Password</label>
       <form:input path="password" type="password" class="form-control" />
        <c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('password')}" var="err">
        <div><span>${err.text}</span></div>
        </c:forEach></div>
        
        <div class="form-group">
        <label>Contact No.</label>
        <form:input path="contactNo" class="form-control"/>
        <c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('contactNo')}" var="err">
        <div><span>${err.text}</span></div>
        </c:forEach></div>
        
        
       <div class="form-group">
        <label>Alternate Contact No.</label>
        <form:input path="alternateContactNo" class="form-control"/>
        <c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('alternateContactNo')}" var="err">
        <div><span>${err.text}</span></div>
        </c:forEach></div>
        
<div class="form-group">
        <label>Email Id</label>
        <form:input path="emailId" class="form-control"/>
        <c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('emailId')}" var="err">
        <div><span>${err.text}</span></div>
        </c:forEach></div>
     <br>
           <input name="_eventId_submit" type="submit" value="Submit" />
        
     
</form:form><br><br>
</body>
</html>