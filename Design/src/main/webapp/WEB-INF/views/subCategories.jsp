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
<title>SubCategories Page</title>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="resources/js/bootstrap.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<style type="text/css">body{background-image:url('image/tile.jpg');}</style>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<body>

  <h2>SubCategory Page</h2>
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
  <form:form method="POST" action="subCategory" commandName="subCategories" modelAttribute="subCategories" >
   				<form:input path="subCategoryId" hidden="true" />
   <table>
   <tr>
  <td><label>select category</label></td>
   <td><form:select path="category.categoryName" items="${categoryList}" itemValue="categoryName" itemName="categoryName" itemLabel="categoryName"></form:select></td>
   		
   </tr>
    <tr>
        <td><form:label path="subCategoryName">SubCategoryName</form:label></td>
        <td><form:input path="subCategoryName" /></td>
        <td><form:errors path="subCategoryName"></form:errors>
    </tr>
    <tr>
        <td><form:label path="subCategoryPrice">Price</form:label></td>
        <td><form:input path="subCategoryPrice" /></td>
        <td><form:errors path="subCategoryPrice"></form:errors>
    </tr>
    
    <tr>
        <td colspan="2">
            <input type="submit" value="Submit"/>
        </td>
    </tr>
</table>  
</form:form><br><br>

<div ng-app="getSubCategories" ng-controller="subCategoriesController">
           <table><tr><td>Search</td>
        <td><input type="text" ng-model="test"></td></tr></table><br>
				  <table class="table">
                  <thead>
                  <tr>
                  <th ng-click="orderByMe('subCategoryId')">#</th>
                  <th ng-click="orderByMe('subCategoryName')">subCategoryName</th>
                  <th ng-click="orderByMe('subCategoryPrice')">subCategoryPrice</th>
                  <th ng-click="orderByMe('categoryId')">categoryId</th>
                  <th>Edit</th>
                  <th>Delete</th>
				</tr>
			</thead>
			<tbody>
				  <tr ng-repeat="list in subCategoryList | orderBy:myOrderBy | filter:test">
				  <td>{{list.subCategoryId}}</td>
				  <td>{{list.subCategoryName}}</td>
				  <td>{{list.subCategoryPrice}}</td>
				  <td>{{list.categoryId}}</td>
				  <td><a href="editSubCategory-{{list.subCategoryId}}">edit</a></td>
				  <td><a href="deleteSubCategory-{{list.subCategoryId}}">delete</a></td></tr></tbody></table>
				  </div>
				  <script type="text/javascript">
				  angular.module('getSubCategories',[]).controller('subCategoriesController',function($scope)
						  {
					  $scope.subCategoryList=${subCategoriesList};
					  $scope.orderByMe = function(subCategoryList) {
					        $scope.myOrderBy =subCategoryList;}
						  });
				  </script>
			</body>
</html>