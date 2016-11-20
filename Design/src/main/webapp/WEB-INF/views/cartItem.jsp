<%@include file="header.jsp" %>
<h2>{{cartItemLists.productName}}</h2>
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
                  <th>Checkout</th>
				</tr>
			</thead>
			<tbody>
				  <tr>
				  
				  <td>{{cartItemLists.cartItemId}}</td>
				  <td>{{cartItemLists.cartId}}</td>
				  <td>{{cartItemLists.productId}}</td>
				  <td>{{cartItemLists.userId}}</td>
				  <td>{{cartItemLists.productName}}</td>
				  <td>{{cartItemLists.quantity}}</td>
				  <td>{{cartItemLists.amount}}</td>
				  
				  <td><img src="resources/image/{{cartItemLists.productId}}.jpg" width="100px" height="100px"></td>
				  <td><a href="checkout-{{cartItemLists.productId}}">Checkout</a></td>				 
				  </tr>
				  </tbody></table>
				  </div>
				  <script type="text/javascript">
				  angular.module('myNewApp',[]).controller('myNewController',function($scope)
						  {
					  $scope.cartItemLists=${cartItemList};
						  });
				  </script>
<br>
<%@include file="footer.jsp" %>