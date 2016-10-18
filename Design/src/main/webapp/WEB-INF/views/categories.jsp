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
<title>Category Page</title>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="resources/js/bootstrap.min.js"></script>
  <style type="text/css">body{background-image:url('image/tile.jpg');}</style>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<body >

<h2>Category Page</h2>
<nav class="navbar navbar-inverse">
<div class="navbar-header">
<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNewNavbar">
 <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <div class="collapse navbar-collapse" id="myNewNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="/Design/categories">Categories</a></li>
        <li><a href="/Design/subCategories">SubCategories</a></li>
        <li><a href="/Design/suppliers">Suppliers</a></li>
        <li><a href="/Design/products">Products</a></li>
        <li><a href="/Design/registration">Registration</a></li>
        <li><a href="/Design">Home</a></li>
      </ul>
      </div>
    </div>
  </nav>
<br>
      <form:form method="POST" action="category" commandName="categories" modelAttribute="categories" >
            <form:input path="categoryId" hidden="true" />    
   <table>
    <tr>
        <td><form:label path="categoryName">CategoryName</form:label></td>
        <td><form:input path="categoryName" /></td>
        <td><form:errors path="categoryName" /></td>
    </tr>
    <tr>
        <td><form:label path="categoryDescription">Description</form:label></td>
        <td><form:input path="categoryDescription" /></td>
        <td><form:errors path="categoryDescription" /></td>
    </tr>
    
    <tr>
        <td colspan="2">
            <input type="submit" value="Submit"/>
        </td>
    </tr>
</table>  
</form:form><br><br>
<!-- --------------------------------------------------------------------------------------------------- -->
        <div ng-app="getCategories" ng-controller="categoriesController">
        <table><tr><td>Search</td>
        <td><input type="text" ng-model="test"></td></tr></table><br>
				  <table class="table" border="1" width="100%">
                  <thead>
                  <tr>
                  
                  <th ng-click="orderByMe('categoryId')">#</th>
                  <th ng-click="orderByMe('categoryName')">categoryName</th>
                  <th ng-click="orderByMe('categoryDescription')">categoryDescription</th>
                  <th>Edit</th>
                  <th>Delete</th>
				</tr>
			</thead>
			<tbody>
				  <tr ng-repeat="list in categoryList | orderBy:myOrderBy | filter:test">
				  
				  <td>{{list.categoryId}}</td>
				  <td>{{list.categoryName}}</td>
				  <td>{{list.categoryDescription}}</td>
				  <td><a href="editCategory-{{list.categoryId}}" >edit</a></td>
				  <td><a href="deleteCategory-{{list.categoryId}}">delete</a></td></tr></tbody></table>
				  </div>
				  <script type="text/javascript">
				  angular.module('getCategories',[]).controller('categoriesController',function($scope)
						  {
					  $scope.categoryList=${categoriesList};
						  $scope.orderByMe = function(categoryList) {
						        $scope.myOrderBy =categoryList;}});
				  </script>
				   <%--<table>
			<thead>
				<tr>
					<th>categoryID</th>
					<th>categoryName</th>
					<th>categoryDescription</th>
				</tr>
			</thead>

			<c:forEach var="categoryList" items="${categoriesList}">
			    <tr>
				<%-- <td>${categoryList.categoryId}</td> 
				<td>${categoryList.categoryName}</td>
				<td>${categoryList.categoryDescription}</td>
				</tr>
                                  
				  </c:forEach></table>--%>
				  
				    
</body>
</html>