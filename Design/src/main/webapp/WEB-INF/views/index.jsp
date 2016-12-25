<%@include file="header.jsp" %>
 <!-- -------------------------------Carousel----------------------------------------------------------- -->
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img class="img-responsive" src="resources/image/bath-powder.jpg"  alt="bath-powder" >
      </div>

      <div class="item">
        <img class="img-responsive" src="resources/image/Essential-Oil-Diffuser.jpg" alt="Essential-Oil-Diffuser">
      </div>
    
      <div class="item">
        <img class="img-responsive" src="resources/image/herbaloils.jpg" alt="herbaloils">
      </div>

      <div class="item">
        <img class="img-responsive" src="resources/image/Home-Fragrance.jpg" alt="Home-Fragrance">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div><br>
            <!-- *** ADVANTAGES HOMEPAGE ***
 _________________________________________________________ -->
            <div id="advantages">

                <div class="container">
                    <div class="row">
  					
                        <div class="col-sm-4">
                            <div class="box same-height clickable">
                                <div class="icon"><i class="fa fa-heart"></i>
                                </div>

                                <h3><a href="#">We love our customers</a></h3>
                                <p>We are known to provide best possible service ever</p>
                            </div>
                        </div>

                        <div class="col-sm-4">
                            <div class="box same-height clickable">
                                <div class="icon"><i class="fa fa-tags"></i>
                                </div>

                                <h3><a href="#">Best prices</a></h3>
                                <p>You can check that the height of the boxes adjust when longer text like this one is used in one of them.</p>
                            </div>
                        </div>

                        <div class="col-sm-4">
                            <div class="box same-height clickable">
                                <div class="icon"><i class="fa fa-thumbs-up"></i>
                                </div>

                                <h3><a href="#">100% satisfaction guaranteed</a></h3>
                                <p>Free returns on everything for 3 months.</p>
                            </div>
                        </div>
                    </div>
                    <!-- /.row -->

                </div>
                <!-- /.container -->

            </div>
            <!-- /#advantages -->

            <!-- *** ADVANTAGES END *** -->

            <!-- *** HOT PRODUCT SLIDESHOW ***
 _________________________________________________________ -->
            <div id="hot">

                <div class="box">
                    <div class="container">
                        <div class="col-md-12">
                            <h2>Products</h2>
                        </div>
                    </div>
                </div></div>
                
 <div class="container">
  <div class="row">
    <div class="col-sm-4 col-md-4" ng-repeat="list in productsViewList">
    
                            
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
        				<a href="addCart-{{list.productId}}-1"><button class="btn btn-default" title="Add to cart">
        					<span class="fa fa-shopping-cart"></span>
        				</button></a>
        			 </div> 
        			<a href="viewproduct-{{list.productId}}-product"> <img src="resources/image/{{list.productId}}.jpg" class="img-responsive" alt="Product Image" style="width:300px;min-height:200px" /> </a>
        			        
        		</div>
        		
        	</article>
            <p class="text-center">{{list.productName}}<span ng-if="list.productQuantity==0"><strong><font color=red>(Out of stock)</font></strong></span></p>
        
        
        	
    </div>
</div></div>
<br><br>


                            <!-- *** HOT END *** -->

            <!-- *** GET INSPIRED ***
 _________________________________________________________ -->
            <div class="container" data-animate="fadeInUpBig">
                <div class="col-md-12">
                    <div class="box slideshow">
                        <h3>New Products</h3>
                        <p class="lead">Check out New Products in our store</p>
                        <div id="get-inspired" class="owl-carousel owl-theme">
                            <div class="item">
                                <a href="#">
                                    <img src="resources/image/bath-powder.jpg" alt="Get inspired" class="img-responsive">
                                </a>
                            </div>
                            <div class="item">
                                <a href="#">
                                    <img src="resources/image/Essential-Oil-Diffuser.jpg" alt="Get inspired" class="img-responsive">
                                </a>
                            </div>
                            <div class="item">
                                <a href="#">
                                    <img src="resources/image/Home-Fragrance.jpg" alt="Get inspired" class="img-responsive">
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- *** GET INSPIRED END *** -->

            <!-- *** BLOG HOMEPAGE ***
 _________________________________________________________ -->

            <div class="box text-center" data-animate="fadeInUp">
                <div class="container">
                    <div class="col-md-12">
                        <h3 class="text-uppercase">From our blog</h3>

                        <p class="lead">What Our Customer has to Say? <a href="blog.html">Check our blog!</a>
                        </p>
                    </div>
                </div>
            </div>

            <div class="container">

                <div class="col-md-12" data-animate="fadeInUp">

                    <div id="blog-homepage" class="row">
                        <div class="col-sm-6">
                            <div class="post">
                                <h4><a href="post.html">Products now</a></h4>
                                <p class="author-category">By <a href="#">John Slim</a> 
                                </p>
                                <hr>
                                <p class="intro">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean
                                    ultricies mi vitae est. Mauris placerat eleifend leo.</p>
                                <p class="read-more"><a href="post.html" class="btn btn-primary">Continue reading</a>
                                </p>
                            </div>
                        </div>

                        <div class="col-sm-6">
                            <div class="post">
                                <h4><a href="post.html">Who is who - example blog post</a></h4>
                                <p class="author-category">By <a href="#">John Slim</a> 
                                </p>
                                <hr>
                                <p class="intro">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean
                                    ultricies mi vitae est. Mauris placerat eleifend leo.</p>
                                <p class="read-more"><a href="post.html" class="btn btn-primary">Continue reading</a>
                                </p>
                            </div>

                        </div>

                    </div>
                    <!-- /#blog-homepage -->
                </div>
            </div>
            <!-- /.container -->

            <!-- *** BLOG HOMEPAGE END *** -->


       
        <!-- /#content -->

            <!-- /#all -->

<script type="text/javascript">
				  angular.module('myNewApp',[]).controller('myNewController',function($scope)
						  {
					  $scope.productsViewList=${productList};
					  
					   
						  });
				  </script>
				  
				 <%@include file="footer.jsp" %> 
    

   