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

<div class="navbar navbar-default yamm" role="navigation" id="navbar">
        <div class="container">
            <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNewNavbar">
 <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <div class="collapse navbar-collapse" id="myNewNavbar">
      <ul class="nav navbar-nav">
        <li><a href="home">Home</a>
        <li ><a href="categories">Categories</a></li>
        <li><a href="subCategories">SubCategories</a></li>
        <li><a href="products">Products</a></li>
        <li><a href="registration">Registration</a></li>
      </ul>
      </div>
    </div></div></div>  <br><br>
    <h2>Registration</h2><br><br>
  
<form:form method="POST" class="form-inline" commandName="userDetail" >
               
   <div class="form-group">
    <label class="col-md-4 control-label">User Name</label>
    <div class="col-md-4">
        <form:input path="username" class="form-control input-md" />
        <!--  to display validation message -->
        	<c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('username')}" var="err">
     <span>${err.text}</span>
        </c:forEach></div></div><br><br>
    
   <div class="form-group">
        <label class="col-md-4 control-label">First Name</label>
        <div class="col-md-4">
        <form:input path="firstname" class="form-control input-md"/>
        <c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('firstname')}" var="err">
        <span>${err.text}</span>
        </c:forEach></div></div><br><br>
        
 <div class="form-group">
        <label class="col-md-4 control-label">Last Name</label>
        <div class="col-md-4">
        <form:input path="lastname" class="form-control input-md" />
        <c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('lastname')}" var="err">
        <span>${err.text}</span>
        </c:forEach></div></div><br><br>
       
    <div class="form-group"> 
        <label class="col-md-4 control-label">Password</label>
        <div class="col-md-4">
       <form:input path="password" type="password" class="form-control input-md" />
        <c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('password')}" var="err">
        <span>${err.text}</span>
        </c:forEach></div></div><br><br>
        
     <div class="form-group">   
        <label class="col-md-4 control-label">Contact No.</label>
        <div class="col-md-4">
        <form:input path="contactNo" class="form-control input-md"/>
        <c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('contactNo')}" var="err">
        <span>${err.text}</span>
        </c:forEach></div></div><br><br>
        
        
       <div class="form-group">
        <label class="col-md-4 control-label">Alternate Contact No.</label>
        <div class="col-md-4">
        <form:input path="alternateContactNo" class="form-control input-md"/>
        </div></div><br><br>
        
<div class="form-group">
        <label class="col-md-4 control-label">Email Id</label>
        <div class="col-md-4">
        <form:input path="emailId" class="form-control input-md"/>
        <c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('emailId')}" var="err">
        <span>${err.text}</span>
        </c:forEach></div></div>
     <br><br>
           <input name="_eventId_submit" type="submit" value="Submit" />
        
     
</form:form><br><br>
</body>
</html>