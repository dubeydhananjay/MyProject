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
<title>View Product</title>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
 <link rel="stylesheet" href="resources/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="resources/js/bootstrap.min.js"></script>
 
<style type="text/css">
#div2 {
    width: 100px;
    height: 100px;
    background: red;
    -webkit-transition: width 2s, height 4s; /* For Safari 3.1 to 6.0 */
    transition: width 2s, height 4s;
}

#div2:hover {
    width: 300px;
    height: 300px;
}

</style>
</head>
<body ng-app="getProducts" ng-controller="productController">
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
    </div></div></div>
    <br>
<h1>{{productList.productName}}</h1>
 <div class="col-sm-5">
<img id="div2" src="resources/image/{{productList.productId}}.jpg">
 </div>
<div class="col-sm-7">
<h6>Product ID: {{productList.productId}}</h6>
<h6>Product Name:{{productList.productName}}</h6>
<h6>Category Name:{{productList.categoryName}}</h6>
<h6>SubCategory Name: {{productList.subCategoryName}}</h6>
<h6>Size: {{productList.productSize}}</h6>
<h6>Weight: {{productList.productWeight}}</h6>
<h6>Aroma Type:{{productList.aromaType}}</h6>

</div> 
  <script type="text/javascript">
				  angular.module('getProducts',[]).controller('productController',function($scope)
						  {
					  $scope.productList=${productView};
				      
						  });
				  </script>

</body>
</html>