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
<title>Categories Page</title>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="resources/js/bootstrap.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>

</head>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<body ng-app="myNewApp" ng-controller="myNewController">

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
    </div></div></div> <br><br>


<h2>Category Page</h2><br><br>
      <form:form method="POST" action="category" commandName="categories" modelAttribute="categories" class="form-inline" >
            <form:input path="categoryId" hidden="true" />  
        
        <div>${sessionScope.Error} <c:set var="Error" value="" scope="session"/></div>     
   <div class="form-group">
        <form:label path="categoryName">CategoryName</form:label>
        <form:input path="categoryName" class="form-control"/>
        <form:errors path="categoryName" /></div>
    
    <div class="form-group">
        <form:label path="categoryDescription">Description</form:label>
        <form:input path="categoryDescription" class="form-control"/>
        <form:errors path="categoryDescription" /></div>
    
            <button type="submit" class="btn btn-default">Submit</button>
       
    
 
</form:form><br><br>
<!-- --------------------------------------------------------------------------------------------------- -->
     <h2>List of Categories</h2><br><br>
     <div>
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
				  <td><a href="editCategory-{{list.categoryId}}"><button type="button" class="btn btn-primary">Edit</button></a></td>
				  <td><a href="deleteCategory-{{list.categoryId}}"><button type="button" class="btn btn-success">Delete</button></a></td></tr></tbody></table>
				  </div>
				  <script type="text/javascript">
				  angular.module('myNewApp',[]).controller('myNewController',function($scope)
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
				  
				    
</body></html>