<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product Specification</title>
 <link rel="stylesheet" href="resources/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
 <script src="resources/js/bootstrap.min.js"></script>
 </head>
<body>
<h2>Product Specification Page</h2>
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
        <li class="active"><a href="subCategories">SubCategories</a></li>
        <li><a href="suppliers">Suppliers</a></li>
        <li><a href="products">Products</a></li>
        <li><a href="registration">Registration</a></li>
        <li><a href="home">Home</a></li>
        <li><a href="productSpecification">Product Specification</a></li>
      </ul>
      </div>
    </div>
  </nav>
<br>
 <form:form method="post" action="addproductSpecification" commandName="productSpecification" modelAttribute="productSpecification">
    <div class="form-group">
      <label for="productName">Select Product(select one):</label>
      <form:select path="product.productName" items="${listProducts}" itemValue="productName" itemName="productName" itemLabel="productName" class="form-control" id="productName" name="productName">
        </form:select>
 </div>
 <div class="form-group">
    <label for="productWeight">Weight:</label>
    <form:input type="text" class="form-control" id="productWeight" name="productWeight" path="productWeight"/>
  </div>
  
  <div class="form-group">
    <label for="productSize">Size:</label>
    <form:input type="text" class="form-control" id="productSize" name="productSize" path="productSize"/>
  </div>
 
 <div class="form-group">
    <label for="aromaType">Aroma Type:</label>
    <form:input type="text" class="form-control" id="aromaType" name="aromaType" path="aromaType"/>
  </div> 
  
  <div class="form-group">
    <label for="soapType">Soap Type:</label>
    <form:input type="text" class="form-control" id="soapType" name="soapType" path="soapType"/>
  </div> 
  
  <div class="form-group">
    <label for="skintype">Skin Type:</label>
    <form:input type="text" class="form-control" id="skintype" name="skintype" path="skintype"/>
  </div> 
  
  <div class="form-group">
    <label for="organic">Organic:</label>
    <form:input type="text" class="form-control" id="organic" name="organic" path="organic"/>
  </div> 
  <button type="submit" class="btn btn-default">Submit</button>
  
 </form:form>
</body>
</html>