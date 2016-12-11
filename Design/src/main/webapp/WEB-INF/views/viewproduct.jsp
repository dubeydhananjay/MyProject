<%@include file="header.jsp" %>
<div class="container">
    <br>
    <div class="row">
<div class="col-md-3">
                   
                    <div class="panel panel-default sidebar-menu">

                        <div class="panel-heading">
                            <h3 class="panel-title">Categories</h3>
                        </div>

                        <div class="panel-body">
                        <ul class="nav nav-pills nav-stacked category-menu">
                        <li ng-repeat="list in categorylist"><a href="allproducts?search={{list.categoryName}}">{{list.categoryName}}</a></li>
                        
                        </ul>
						</div></div>
						<br>
						<div class="panel panel-default sidebar-menu">

                        <div class="panel-heading">
                            <h3 class="panel-title">Sub Categories</h3>
                        </div>

                        <div class="panel-body">
                        <ul class="nav nav-pills nav-stacked category-menu">
                        <li ng-repeat="list in subcategorylist"><a href="allproducts?search={{list.subCategoryName}}">{{list.subCategoryName}}</a></li>
                        
                        </ul>
						</div></div>
						<br>
						<div class="panel panel-default sidebar-menu">

                        <div class="panel-heading">
                            <h3 class="panel-title">Products</h3>
                        </div>

                        <div class="panel-body">
                        <ul class="nav nav-pills nav-stacked category-menu">
                        <li ng-repeat="list in productLists"><a href="viewproduct-{{list.productId}}-product">{{list.productName}}</a></li>
                        
                        </ul>
						</div></div>
						
						
						
</div>
 <div class="col-md-9">
  <div class="row" id="productMain">
                        <div class="col-sm-6">  
                            
     
        			<div class="options">
        				
        			 </div> 
        			<a href="#"> <img id="div2" src="resources/image/{{productList.productId}}.jpg" class="img-responsive" alt="Product Image" style="width:500px;min-height:500px" /> </a>
        		
            </div>
        
        <div class="col-sm-6">
                            <div class="box">
                                <h1 class="text-center">{{productList.productName}}</h1>
                                <p class="goToDescription"><a href="#details" class="scroll-to">Scroll to product details</a>
                                </p>
                               <!--  <p class="price">Rs.{{productList.productPrice}}</p> -->
                                <p class="text-center buttons" ng-if="productList.productQuantity!=0">
                                    <a href="addCart-{{productList.productId}}" class="btn btn-primary"><i class="fa fa-shopping-cart"></i> Add to cart</a> 
                                    <a href="wishlist-{{productList.productId}}" class="btn btn-default"><i class="fa fa-heart"></i> Add to wishlist</a>
                                    
                                </p>
         </div>
    
                            <div class="row" id="thumbs">
                                <div class="col-xs-4">
                                    <a href="#" class="thumb">
                                        <img src="resources/image/{{productList.productId}}.jpg" alt="" class="img-responsive">
                                    </a>
                                </div>
                                <div class="col-xs-4">
                                    <a href="#" class="thumb">
                                        <img src="resources/image/{{productList.productId}}.jpg" alt="" class="img-responsive">
                                    </a>
                                </div>
                                <div class="col-xs-4">
                                    <a href="#" class="thumb">
                                        <img src="resources/image/{{productList.productId}}.jpg" alt="" class="img-responsive">
                                    </a>
                                </div>
                            </div>
                             </div>
								</div><br>
                    <div class="box" id="details">
<h6>Product ID: {{productList.productId}}</h6>
<h6>Product Name:{{productList.productName}}</h6>
<h6>Category Name:{{productList.categoryName}}</h6>
<h6>SubCategory Name: {{productList.subCategoryName}}</h6>
<h6>Size: {{productList.productSize}}</h6>
<h6>Weight: {{productList.productWeight}}</h6>
<h6>Aroma Type:{{productList.aromaType}}</h6>

<div class="social">
                                <h4>Show it to your friends</h4>
                                <p>
                                    <a href="#" class="external facebook" data-animate-hover="pulse"><i class="fa fa-facebook"></i></a>
                                    <a href="#" class="external gplus" data-animate-hover="pulse"><i class="fa fa-google-plus"></i></a>
                                    <a href="#" class="external twitter" data-animate-hover="pulse"><i class="fa fa-twitter"></i></a>
                                    <a href="#" class="email" data-animate-hover="pulse"><i class="fa fa-envelope"></i></a>
                                </p>
                            </div></div></div>
</div></div> <br>
  <script type="text/javascript">
				  angular.module('myNewApp',[]).controller('myNewController',function($scope)
						  {
					  $scope.productList=${productView};
					  $scope.categorylist=${categoriesLists};
					  $scope.subcategorylist=${subcategoriesLists};
					  $scope.productLists=${productsLists};
				      
						  });
				  </script>



<%@include file="footer.jsp" %>