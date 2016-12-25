<%@include file="header.jsp" %>
<div class="container">
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
</div> <br>
  <script type="text/javascript">
				  angular.module('myNewApp',[]).controller('myNewController',function($scope)
						  {
					  $scope.productList=${productView};
				      
						  });
				  </script>



<%@include file="footer.jsp" %>