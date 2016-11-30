<%@include file="header.jsp" %>

<div class="container">
 <table class="table" border="1" width="100%">
                  <thead>
                  <tr>
                  
                  <th>#</th>
                  <th>Cart Id</th>
                  <th>Product Id</th>
                  
                  <th>Product Name</th>
                  <th>Quantity</th>
                  <th>Amount</th>
                  <th>Image</th>
                  <th>Buy Now</th>
                  <th>Remove</th>
                  
				</tr>
			</thead>
			<tbody>
				  <tr ng-repeat="list in cartLists">
				  
				  <td>{{list.cartItemId}}</td>
				  <td>{{list.cartId}}</td>
				  <td>{{list.productId}}</td>
				  
				  <td>{{list.productName}}</td>
				  <td>{{list.quantity}}</td>
				  <td>{{list.amount}}</td>
				  
				  <td><a href="viewproduct-{{list.productId}}-product"><img src="resources/image/{{list.productId}}.jpg" width="100px" height="100px"></a></td>
				  <td><a href="buynow-{{list.productId}}?userId=1"><button type="button" class="btn btn-warning">Buy Now</button></a></td>			 
				  <td><a href="delete-{{list.cartItemId}}"><button type="button" class="btn btn-success">Remove</button></a></td>
				  </tr>
				  </tbody></table>
				  
				  <a href="checkoutCart">Checkout</a>
				  
				  
				  </div>
				  <script type="text/javascript">
				  angular.module('myNewApp',[]).controller('myNewController',function($scope)
						  {
					  $scope.cartLists=${cartList};
						  });
				  </script>
<br>


<%@include file="footer.jsp" %>