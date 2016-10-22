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
<title>Supplier</title>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="resources/js/bootstrap.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<style type="text/css">body{background-image:url('image/tile.jpg');}</style>
</head>
<body>

  <h2>Supplier Page</h2>
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
        <li class="active"><a href="suppliers">Suppliers</a></li>
        <li><a href="products">Products</a></li>
        <li><a href="registration">Registration</a></li>
        <li><a href="home">Home</a></li>
      </ul>
      </div>
    </div>
  </nav>
  <br>
  <form:form method="POST" action="supplier" commandName="suppliers" modelAttribute="suppliers" >
   			<form:input path="supplierId" hidden="true" />
   <table>
    <tr>
        <td><form:label path="supplierName">SupplierName</form:label></td>
        <td><form:input path="supplierName" /></td>
        <td><form:errors path="supplierName"></form:errors>
    </tr>
    <tr>
        <td><form:label path="supplierAddress">Address</form:label></td>
        <td><form:input path="supplierAddress" /></td>
        <td><form:errors path="supplierAddress"></form:errors>
    </tr>
    
    <tr>
        <td colspan="2">
            <input type="submit" value="Submit"/>
        </td>
    </tr>
</table>  
</form:form>
<br><br>

<div ng-app="getSupplier" ng-controller="supplierController">
          <table><tr><td>Search</td>
        <td><input type="text" ng-model="test"></td></tr></table><br>
				  <table class="table">
                  <thead>
                  <tr>
                  <th ng-click="orderByMe('supplierId')">#</th>
                  <th ng-click="orderByMe('supplierName')">supplierName</th>
                  <th ng-click="orderByMe('supplierAddress')">supplierAddress</th>
                  <th>Edit</th>
                  <th>Delete</th>
				</tr>
			</thead>
			<tbody>
				  <tr ng-repeat="list in supplierList | orderBy:myOrderBy | filter:test">
				  <td>{{list.supplierId}}</td>
				  <td>{{list.supplierName}}</td>
				  <td>{{list.supplierAddress}}</td>
				  <td><a href="editSupplier-{{list.supplierId}}">edit</a></td>
				  <td><a href="deleteSupplier-{{list.supplierId}}">delete</a></td>
				  </tr></tbody></table>
				  </div>
				  <script type="text/javascript">
				  angular.module('getSupplier',[]).controller('supplierController',function($scope)
						  {
					  $scope.supplierList=${suppliersList};
					  $scope.orderByMe = function(supplierList) {
					        $scope.myOrderBy =supplierList;}
						  });
				  </script>
				  </body>
</html>