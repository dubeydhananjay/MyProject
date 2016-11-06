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
<h2>Registration</h2>
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
        
        <li><a href="products">Products</a></li>
        
        <li><a href="home">Home</a></li>
        
      </ul>
      </div>
    </div>
  </nav>
  <br>
  
<form:form method="POST" class="form-inline" action="addRegistration" commandName="registration" modelAttribute="registration" >
               
   <table>
   <tr>
        <td><label>User Name</label></td>
        <td><form:input path="username" /></td>
        <!--  to display validation message -->
        	<c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('username')}" var="err">
        <div><span>${err.text}</span></div>
        </c:forEach>
    </tr>
    <tr>
        <td><label>First Name</label></td>
        <td><form:input path="firstname" /></td>
        <c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('firstname')}" var="err">
        <div><span>${err.text}</span></div>
        </c:forEach>
        
    </tr>
   <tr>
        <td><label>Last Name</label></td>
        <td><form:input path="lastname" /></td>
        <c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('lastname')}" var="err">
        <div><span>${err.text}</span></div>
        </c:forEach>
        
    </tr>
     <tr>
        <td><label>Password</label></td>
        <td><form:input path="password" /></td>
        <c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('password')}" var="err">
        <div><span>${err.text}</span></div>
        </c:forEach>
        
    </tr>
     <tr>
        <td><label>Contact No.</label></td>
        <td><form:input path="contactNo" /></td>
        <c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('contactNo')}" var="err">
        <div><span>${err.text}</span></div>
        </c:forEach>
        
    </tr>
     <tr>
        <td><label>Alternate Contact No.</label></td>
        <td><form:input path="alternateContactNo" /></td>
        <c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('alternateContactNo')}" var="err">
        <div><span>${err.text}</span></div>
        </c:forEach>
        
    </tr>
     <tr>
        <td><label>Email Id</label></td>
        <td><form:input path="emailId" /></td>
        <c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('emailId')}" var="err">
        <div><span>${err.text}</span></div>
        </c:forEach>
        
    </tr>
     
    <tr>
        <td colspan="2">
           <input name="_eventId_submit" type="submit" value="Submit" />
        </td>
    </tr>
</table>  
</form:form><br><br>
</body>
</html>