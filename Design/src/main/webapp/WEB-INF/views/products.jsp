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
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<style type="text/css">body{background-image:url('image/tile.jpg');}</style>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<body>
<h2>Products Page</h2>
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
        <li class="active"><a href="products">Products</a></li>
        <li><a href="registration">Registration</a></li>
        <li><a href="home">Home</a></li>
      </ul>
      </div>
    </div>
  </nav>
<br>
          <form:form method="POST" action="product" commandName="products" modelAttribute="products" enctype="multipart/form-data" >
   			<form:input path="productId" hidden="true" />
   <table>
   <tr>
  <td><label>select supplier</label></td>
   <td><form:select path="supplier.supplierName" items="${supplierList}" itemValue="supplierName" itemName="supplierName" itemLabel="supplierName"></form:select></td>
      
   </tr>
   <tr>
  <td><label>select subcategory</label></td>
   <td><form:select path="subCategory.subCategoryName" items="${subCategoryList}" itemValue="subCategoryName" itemName="subCategoryName" itemLabel="subCategoryName"></form:select></td>
   
   </tr>
   
 
    <tr>
        <td><form:label path="productName">Product Name</form:label></td>
        <td><form:input path="productName" /></td>
        <td><form:errors path="productName"></form:errors>
    </tr>
   <tr>
   <td><label>select file</label></td>
   <td><form:input type="file" name="file" path="uploadFiles"></form:input></td>
   </tr> 
   <tr>
   <td><label>name</label></td>
   <td><input type="text" name="name"></td>
   </tr> 
   <tr>
   
   <td colspan="2"><input type="submit" value="Upload"/></td>
   </tr>
   
    <%-- <tr>
        <td colspan="2">
            <input type="submit" value="Submit"/>
        </td>
    </tr>--%>
</table>  
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
                  <th>Edit</th>
                  <th>Delete</th>
				</tr>
			</thead>
			<tbody>
				  <tr ng-repeat="list in productList | orderBy:myOrderBy | filter:test">
				  <td>{{list.productId}}</td>
				  <td>{{list.productName}}</td>
				  <td>{{list.subCategoryId}}</td>
				  <td>{{list.supplierId}}</td>
				  
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
					  $scope.orderByMe = function(productList) {
					        $scope.myOrderBy =productList;}
						  });
				  </script>
				   
       </body>
</html>