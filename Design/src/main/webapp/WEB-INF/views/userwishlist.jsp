<%@include file="header.jsp" %>

<div class="container">

<div class="row">
	 <div class="col-md-3">	
       <div class="panel panel-default sidebar-menu">

                        <div class="panel-heading">
                            <h3 class="panel-title">Customer section</h3>
                        </div>

                        <div class="panel-body">

                            <ul class="nav nav-pills nav-stacked">
                                <li class="active">
                                    <a href="orderList"><i class="fa fa-list"></i> My orders</a>
                                </li>
                                <li>
                                    <a href="mywishlist"><i class="fa fa-heart"></i> My wishlist</a>
                                </li>
                                <li>
                                    <a href="userprofile"><i class="fa fa-user"></i> My account</a>
                                </li>
                                
                            </ul>
                        </div>

                    </div>
                    <!-- /.col-md-3 -->
        </div>
<div class="col-md-9 ">

 <div class="panel panel-default sidebar-menu">

                        <div class="panel-heading">
                            <h3 class="panel-title">My WishLists</h3>
                        </div>

                        <div class="panel-body">

 <table class="table" border="1" width="100%">
                  <thead>
                  <tr>
                  
                  
                  <th>Cart Id</th>
                 
                  <th>Product Name</th>
                  <th>Quantity</th>
                  <th>Amount</th>
                  <th>Image</th>
                  <th>Buy </th>
                  <th>Add to Cart</th>
                  <th>Remove</th>
                  
				</tr>
			</thead>
			<tbody>
				  <tr ng-repeat="list in mywishlist">
				  
				  
				  <td>{{list.cartId}}</td>
				  
				  <td>{{list.productName}}</td>
				  <td>{{list.quantity}}</td>
				  <td>{{list.amount}}</td>
				  
				  <td><a href="viewproduct-{{list.productId}}-product"><img src="resources/image/{{list.productId}}.jpg" width="100px" height="100px"></a></td>
				  <td ><a href="buynow-{{list.productId}}?userId=1"><button type="button" class="btn btn-warning">Buy Now</button></a></td>
				  <td><a href="addCart-{{list.productId}}"><button type="button" class="btn btn-danger">Add To Cart</button></a></td>				 
				  <td><a href="deleteWishlist-{{list.wishListId}}"><button type="button" class="btn btn-success">Remove</button></a></td>
				  </tr>
				  </tbody></table>
				  </div></div>
				  </div></div></div>
				  <script type="text/javascript">
				  angular.module('myNewApp',[]).controller('myNewController',function($scope)
						  {
					  $scope.mywishlist=${wishlist};
						  });
				  </script>
<br>
<%@include file="footer.jsp" %>