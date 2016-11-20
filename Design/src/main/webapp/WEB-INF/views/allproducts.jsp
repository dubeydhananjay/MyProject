<%@include file="header.jsp" %>

<div  ng-repeat="list in productViewLists | filter:searchkeyword | orderBy:sortkey:reverse | filter:nextFilter">
<input type="checkbox" ng-click="myNewFilter(list.subCategoryName)"/> {{list.subCategoryName}}<br>
</div>

<div class="container">
<div><span ng-click="sort('productName')"><button type="submit" class="btn btn-default">Product Name 
<span class="glyphicon sort-icon" ng-show="sortkey=='productName'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></button>
</span>
<span ng-click="sort('productId')"><button type="submit" class="btn btn-default">Latest 
<span class="glyphicon sort-icon" ng-show="sortkey=='productId'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></button>
</span></div><br>

<!-- <input type="checkbox" ng-click="myNewFilter('Oils')"/> Oils<br>
        <input type="checkbox" ng-click="myNewFilter('Soap')"/> Soap<br> -->
  <div class="row" ng-model="searchkeyword">
    <div class="col-sm-4 col-md-4"  ng-repeat="list in productViewLists | filter:searchkeyword | orderBy:sortkey:reverse | filter:nextFilter">
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
					  $scope.searchkeyword=location.search.substr(8).toLowerCase();
					  $scope.letterlimit=3;
					  $scope.productViewLists=${productViewList};
					  
					  $scope.sort=function(keyname) {
						  $scope.sortkey=keyname;//param passed..set the sort key
						  $scope.reverse=!$scope.reverse;//if true make it false and vice versa
					  }
					  
					  $scope.myFilter = [];
					    
					    $scope.myNewFilter = function(subCategoryName) {
					        var i = $.inArray(subCategoryName, $scope.myFilter);
					        if (i > -1) {
					            $scope.myFilter.splice(i, 1);
					        } else {
					            $scope.myFilter.push(subCategoryName);
					        }
					    }
					    
					    $scope.nextFilter = function(productViewLists) {
					        if ($scope.myFilter.length > 0) {
					            if ($.inArray(productViewLists.subCategoryName, $scope.myFilter) < 0)
					                return;
					        }
					        
					        return productViewLists;
					    }
				      
						  });
				  </script>


</body>
</html>