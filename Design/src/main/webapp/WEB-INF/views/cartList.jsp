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
                            <h3 class="panel-title">My Cart</h3>
                        </div>

                        <div class="panel-body">

<div>
<label>Search</label>
<input type="text" ng-model="test"/>
</div>
<br>
<div class="form-group col-sm-6 col-xs-12">
          <label for="search">Items per page:</label>
          <select class="form-control" ng-model="maxsize" ng-init="maxsize=5">
            <option ng-selected="true">5</option>
            <option>10</option>
            <option>15</option>
            <option>20</option>
          </select>
          <!--               <input type="number" min="1" max="100" class="form-control" ng-model="maxsize" ng-init="maxsize=10" > -->
        </div>
 <table class="table" border="1" width="100%">
 
 
                  <thead>
                  <tr>
                  
                  <th>#</th>
                  <th>Cart Id</th>
                  
                      <th ng-click="sort('productName')">Product Name
<span class="glyphicon sort-icon" ng-show="sortKey=='productName'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                       </th>
                       <th ng-click="sort('productPrice')">Amount
<span class="glyphicon sort-icon" ng-show="sortKey=='productPrice'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                       </th>
                       <th ng-click="sort('productQuantity')">Quantity
<span class="glyphicon sort-icon" ng-show="sortKey=='productQuantity'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                       </th>
                  <th>Image</th>
                  <th>Total Amount</th>
                  <th>Buy Now</th>
                  <th>Remove</th>
                  
				</tr>
			</thead>
			<tbody>
				  <tr dir-paginate="list in resultValue=(cartLists | filter: test) | orderBy:sortKey:reverse | itemsPerPage: maxsize" pagination-id="Product">
				  
				  <td>{{list.cartItemId}}</td>
				  <td>{{list.cartId}}</td>
				  
				  <td>{{list.productName}}</td>
				  <td>{{list.amount}}</td>
				  <td>{{list.quantity}}</td>
				  
				  <td><a href="viewproduct-{{list.productId}}-product"><img src="resources/image/{{list.productId}}.jpg" width="100px" height="100px"></a></td>
				  <td>{{list.amount * list.quantity}}</td>
				  <td><a href="buynow-{{list.productId}}?userId=1"><button type="button" class="btn btn-warning">Buy Now</button></a></td>			 
				  <td><a href="delete-{{list.cartItemId}}"><button type="button" class="btn btn-success">Remove</button></a></td>
				  </tr>
				  <tr>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                      <td>Grand Total:Rs {{resultValue | totalAmtQty:'quantity':'amount'}}</td>
				  </tr>
				  </tbody></table>
				  
				  <a href="checkoutCart"><button type="button" class="btn btn-primary">Checkout</button></a>
				   <dir-pagination-controls  class="pull-right" maxsize="5" pagination-id="Product" direction-links="true" boundary-links="true">
                </dir-pagination-controls>
				  
				  </div></div>
				  </div></div></div>
				  <br><br>
				  <script type="text/javascript">

				  var app = angular.module('myNewApp',['angularUtils.directives.dirPagination']).filter('totalAmtQty', function () {
    return function (data, key1, key2) {
        
        if (typeof (data) === 'undefined' && typeof (key1) === 'undefined' && typeof (key2) === 'undefined') {
            return 0;
        }
        var sum = 0;
        for (var i = 0; i < data.length; i++) {
            sum = sum + (parseInt(data[i][key1]) * parseInt(data[i][key2]));
        }
        return sum;
    }
});    
 app.controller('myNewController', function($scope,$filter) 
		 {
	 $scope.cartLists = ${cartList};
   
    $scope.sort = function(keyname) {
        $scope.sortKey = keyname; //set the sortKey to the param passed
        $scope.reverse = !$scope.reverse; //if true make it false and vice versa
      };
      
   
});


</script>


<br><br>


<%@include file="footer.jsp" %>