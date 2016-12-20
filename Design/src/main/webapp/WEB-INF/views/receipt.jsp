<%@include file="header.jsp" %>

<div class="container">
<form:form method="post" action="home">
    <div class="row">
        <div class="well col-xs-10 col-sm-10 col-md-6 col-xs-offset-1 col-sm-offset-1 col-md-offset-3">
            <div class="row">
                <div class="col-xs-6 col-sm-6 col-md-6">
                    <address>
                        <strong>Elf Cafe</strong>
                        <br>
                        2135 Sunset Blvd
                        <br>
                        Los Angeles, CA 90026
                        <br>
                        <abbr title="Phone">P:</abbr> (213) 484-6829
                    </address>
                </div>
                <div class="col-xs-6 col-sm-6 col-md-6 text-right">
                    <p>
                        <em>Date: 1st November, 2013</em>
                    </p>
                    <p>
                        <em>Receipt #: 34522677W</em>
                    </p>
                </div>
            </div>
            <div class="row">
                <div class="text-center">
                    <h1>Receipt</h1>
                </div>
                
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Product</th>
                            <th>Quantity</th>
                            <th class="text-center">Price</th>
                            <th class="text-center">Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr ng-repeat="list in orders">
                            <td class="col-md-9"><em>{{list.productName}}</em></td>
                            <td class="col-md-1" style="text-align: center"> {{list.quantity}} </td>
                            <td class="col-md-1 text-center">{{list.amount}}</td>
                            <td class="col-md-1 text-center">{{list.amount * list.quantity}}</td>
                        </tr>
                        
                        <tr>
                            <td>   </td>
                            <td>   </td>
                            <td class="text-right">
                            
                        </tr>
                        <tr>
                            <td>   </td>
                            <td>   </td>
                            <td class="text-right"><h4><strong>Total: </strong></h4></td>
                            <td class="text-center text-danger"><h4><strong>{{calcTotal()}}</strong></h4></td>
                        </tr>
                    </tbody>
                </table>
                <button type="submit" class="btn btn-success btn-lg btn-block">
                    Pay Now   <span class="glyphicon glyphicon-chevron-right"></span>
                </button>
            </div>
        </div>
    </div>
</form:form>
</div>

<script type="text/javascript">
				  angular.module('myNewApp',[]).controller('myNewController',function($scope)
						  {   
					  $scope.orders = ${placedOrder};
						  
   
      $scope.calcTotal = function(){
    	    var total = 0;
    	    for(var i = 0; i < $scope.orders.length; i++){
    	        var x = $scope.orders[i];
    	        total += (x.amount * x.quantity);
    	    }
    	    return total;
    	};
  
   
});


</script>

<%@include file="footer.jsp" %>