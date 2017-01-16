<%@include file="header.jsp" %>
<div class="container-fluid">
<div class="row">
<div class="col-sm-3">
<div  ng-repeat="list in productViewLists | filter:searchkeyword ">
<input type="checkbox" ng-click="myNewFilter(list.subCategoryName)"/> {{list.subCategoryName}}<br>
</div></div>


<div class="col-sm-9">
<div><span ng-click="sort('productName')"><button type="submit" class="btn btn-default">Product Name 
<span class="glyphicon sort-icon" ng-show="sortkey=='productName'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></button>
</span>
<span ng-click="sort('productId')"><button type="submit" class="btn btn-default">Latest 
<span class="glyphicon sort-icon" ng-show="sortkey=='productId'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></button>
</span></div><br>


  <div ng-model="searchkeyword">
    <div class="col-xs-18 col-sm-6 col-md-3"  ng-repeat="list in productViewLists | filter:searchkeyword | orderBy:sortkey:reverse | filter:nextFilter">
      <article class="col-item">
        		<div class="photo">
        			<div class="options" ng-if="list.productQuantity!=0">
        				<a href="wishlist-{{list.productId}}"><button class="btn btn-default" type="submit" data-toggle="tooltip" data-placement="top" title="Add to wish list">
        					<i class="fa fa-heart"></i>
        				</button></a>
        				<a href="buynow-{{list.productId}}?userId=1"><button class="btn btn-default" type="submit" data-toggle="tooltip" data-placement="top" title="Buy Now">
        					<i class="fa fa-credit-card"></i>
        				</button></a>
        			
        			<!-- <div class="options-cart"> -->
        				<a href="addCart-{{list.productId}}"><button class="btn btn-default" title="Add to cart">
        					<span class="fa fa-shopping-cart"></span>
        				</button></a>
        			 </div> 
        			<a href="viewproduct-{{list.productId}}-product"> <img src="resources/image/{{list.productId}}.jpg" class="img-responsive" alt="Product Image" style="width:300px;min-height:200px" /> </a>
        			        
        		</div>
        		
        	</article>
            <p class="text-center">{{list.productName}}<span ng-if="list.productQuantity==0"><strong><font color=red>(Out of stock)</font></strong></span></p>
    
    </div>
</div>


</div></div></div><br><br>

<script type="text/javascript">
				  angular.module('myNewApp',[]).controller('myNewController',function($scope,$http,$location)
						  {
					  $scope.searchkeyword=location.search.substr(8);
					  $scope.letterlimit=3;
					  $scope.productViewLists=${productViewList};
					  
					  $scope.subCategoryList=${subCategoriesList};
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
					    
					    $scope.nextFilter = function(subCategoryList) {
					        if ($scope.myFilter.length > 0) {
					            if ($.inArray(subCategoryList.subCategoryName, $scope.myFilter) < 0)
					                return;
					        }
					        
					        return subCategoryList;
					    }
				      
						  });
				  </script>


</body>
</html>