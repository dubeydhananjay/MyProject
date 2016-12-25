<%@include file="header.jsp" %>

<div class="container">
  <div class="row" ng-model="searchkeyword" ng-keyup="complete()">
    <div class="col-sm-4 col-md-4"  ng-repeat="list in productViewLists | filter:searchkeyword">
      <div class="panel panel-primary">
        <div class="panel-heading">{{list.productName}}</div>
        <div class="panel-body"><a href="viewproduct-{{list.productId}}-product"><img src="resources/image/{{list.productId}}.jpg" class="img-responsive" style="width:300px;min-height:200px" alt="Image"></a></div>
        <div class="panel-footer">{{list.productId}}</div>
      </div>
    </div>
</div>
</div><br><br>

<script type="text/javascript">
				  angular.module('myNewApp',[]).controller('myNewController',function($scope,$http,$location)
						  {
					  $scope.searchkeyword=location.search.substr(8);
					  $scope.letterlimit=3;
					  $scope.productViewLists=${productViewList};
				      
						  });
				  </script>


</body>
</html>