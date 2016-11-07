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
<title>Product Page</title>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="resources/js/bootstrap.min.js"></script>
  
<style type="text/css">body{background-image:url('image/tile.jpg');}</style>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<body>
<h2>Products Page</h2>
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
    </div></div></div><br>
          <form:form method="POST" class="form-inline" action="product" commandName="products" modelAttribute="products" enctype="multipart/form-data" >
   			<form:input path="productId" hidden="true" />
  
  <div class="form-group">
  <label class="col-md-4 control-label">select supplier</label>
   <form:select path="userDetail.username" items="${listSupplier}" class="form-control input-md" itemValue="username" itemName="username" itemLabel="username"></form:select><br><br>
   
     
  <label class="col-md-4 control-label">select subcategory</label>
   <form:select path="subCategory.subCategoryName" items="${subCategoryList}" class="form-control input-md" itemValue="subCategoryName" itemName="subCategoryName" itemLabel="subCategoryName"></form:select><br><br>
 
   
 <form:label path="productName" class="col-md-4 control-label">Product Name</form:label>
        <form:input path="productName" class="form-control input-md"/>
        <form:errors path="productName"></form:errors><br><br>
   
  
  <label class="col-md-4 control-label">Product Weight</label>
   <input type="text" name="productWeight" class="form-control input-md"><br><br>
 
    
  <label class="col-md-4 control-label">Product size</label>
   <input type="text" name="productSize" class="form-control input-md"><br><br>
   
   
   <label class="col-md-4 control-label">Skin Type</label>
   <input type="text" name="skintype" class="form-control input-md"><br><br>
   
   
   <label class="col-md-4 control-label">Soap Type</label>
   <input type="text" name="soapType" class="form-control input-md"><br><br>
   
   
   <label class="col-md-4 control-label">Organic</label>
  <input type="text" name="organic" class="form-control input-md"><br><br>
  
   
   <label class="col-md-4 control-label">select file</label>
   <form:input type="file" name="file" path="uploadFiles" class="form-control input-md"></form:input></div><br><br>
   
  
   <button type="submit" class="btn btn-default">Submit</button>
  
</form:form>
          
        <br><br>
       <!-- ------------------------------------------------------------------------------------------ -->
          <div ng-app="getProducts" ng-controller="productController">
          <table><tr><td>Search</td>
        <td><input type="text" ng-model="test"></td></tr></table><br>
				  <table class="table">
                  <thead>
                  <tr>
                  <th ng-click="orderByMe('productId')">productId</th>
                  <th ng-click="orderByMe('productName')">ProductName</th>
                  <th ng-click="orderByMe('subCategoryId')">subCategoryId</th>
                  <th ng-click="orderByMe('supplierId')">supplierId</th>
                  <th ng-click="orderByMe('productWeight')">Product Weight</th>
                  <th ng-click="orderByMe('productSize')">Product Size</th>
                  <th ng-click="orderByMe('soapType')">Soap Type</th>
                  <th ng-click="orderByMe('skintype')">Skin Type</th>
                  <th ng-click="orderByMe('organic')">Organic</th>
                  <th>Edit</th>
                  <th>Delete</th>
				</tr>
			</thead>
			<tbody>
				  <tr ng-repeat="list in productList | orderBy:myOrderBy | filter:test">
				  <td>{{list.productId}}</td>
				  <td>{{list.productName}}</td>
				  <td>{{list.subCategoryId}}</td>
				  <td>{{list.userId}}</td>
				  <td>{{list.productWeight}}</td>
				  <td>{{list.productSize}}</td>
				  <td>{{list.soapType}}</td>
				  <td>{{list.skintype}}</td>
				  <td>{{list.organic}}</td>
				  
				  <td><a href="editProduct-{{list.productId}}">edit</a></td>
				  <td><a href="deleteProduct-{{list.productId}}">delete</a></td>
				  <td><img src="resources/image/{{list.productId}}.jpg" width="100px" height="100px"></td>
				  <td><a href="viewproduct-{{list.productId}}-product">View</a>
				  </tr></tbody></table>
				  </div>
				  <script type="text/javascript">
				  angular.module('getProducts',[]).controller('productController',function($scope)
						  {
					  $scope.productList=${productsList};
					  $scope.orderByMe = function(productsList) {
					        $scope.myOrderBy =productsList;}
						  });
				  </script>
				   
       </body>
</html>