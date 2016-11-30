<%@include file="header.jsp" %>
<h2>My WishLists</h2>
<div class="container">
 <table class="table" border="1" width="100%">
                  <thead>
                  <tr>
                  
                  <th>#</th>
                  <th>Cart Id</th>
                  <th>Product Id</th>
                  <th>User Id</th>
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
				  
				  <td>{{list.wishlistId}}</td>
				  <td>{{list.cartId}}</td>
				  <td>{{list.productId}}</td>
				  <td>{{list.userId}}</td>
				  <td>{{list.productName}}</td>
				  <td>{{list.quantity}}</td>
				  <td>{{list.amount}}</td>
				  
				  <td><a href="viewproduct-{{list.productId}}-product"><img src="resources/image/{{list.productId}}.jpg" width="100px" height="100px"></a></td>
				  <td ><a href="buynow-{{list.productId}}?userId=1"><button type="button" class="btn btn-warning">Buy Now</button></a></td>
				  <td><a href="addCart-{{list.productId}}"><button type="button" class="btn btn-danger">Add To Cart</button></a></td>				 
				  <td><a href="deleteWishlist-{{list.wishListId}}"><button type="button" class="btn btn-success">Remove</button></a></td>
				  </tr>
				  </tbody></table>
				  </div>
				  <script type="text/javascript">
				  angular.module('myNewApp',[]).controller('myNewController',function($scope)
						  {
					  $scope.mywishlist=${wishlist};
						  });
				  </script>
<br>
<%@include file="footer.jsp" %>