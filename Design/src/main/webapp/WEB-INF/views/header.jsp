<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %>
<fmt:setBundle basename="mymessage" />
<fmt:message key="message.password" var="noPass" />
<fmt:message key="message.username" var="noUser" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> <meta name="keywords" content="">
    

    <link href='http://fonts.googleapis.com/css?family=Roboto:400,500,700,300,100' rel='stylesheet' type='text/css'>

    <!-- styles -->
    <link href="resources/css/font-awesome.css" rel="stylesheet">
    <link href="resources/css/flip-animation.css" rel="stylesheet">
    <link href="resources/css/font-awesome.min.css" rel="stylesheet">
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/css/animate.min.css" rel="stylesheet">
    <link href="resources/css/owl.carousel.css" rel="stylesheet">
    <link href="resources/css/owl.theme.css" rel="stylesheet">
	<link href="resources/css/owl.transitions.css" rel="stylesheet">
	<link href="resources/css/userprofile.css" rel="stylesheet">
	<link href="resources/css/login.css" rel="stylesheet">
	<link href="resources/css/productstyle.css" rel="stylesheet">
    <!-- theme stylesheet -->
    <link href="resources/css/style.default.css" rel="stylesheet" id="theme-stylesheet">

    <!-- your stylesheet with modifications -->
    <link href="resources/css/custom.css" rel="stylesheet">

    <script src="resources/js/respond.min.js"></script>

    

<title>Insert title here</title>
</head>
<body ng-app="myNewApp" ng-controller="myNewController">

    <!-- *** TOPBAR ***
 _________________________________________________________ -->
    <div id="top">
                 <div class="container">
           
            <div class="col-md-6 offer" data-animate="fadeInDown">
                <a href="#" class="btn btn-success btn-sm"  data-animate-hover="shake"><img src="resources/image/logo.png"/></a>  <a href="#">Welcome TO Organic Soul</a>
            </div>
            <div class="col-md-6" data-animate="fadeInDown">
                <ul class="menu">
                       			 <c:if test="${pageContext.request.userPrincipal.name==null}">
                    <li><a href="login" class="btn btn-success btn-sm">Login</a>
                    </li>
                    <li><a href="registration" class="btn btn-success btn-sm">Register</a>
                    </li></c:if>
                   <c:if test="${pageContext.request.userPrincipal.name!=null}">
        		<sec:authorize access="isAuthenticated()"> 
        		<li><a href="perform_logout" class="btn btn-success btn-sm">Logout</a></li>
        		</sec:authorize></c:if>
                    
					 <c:if test="${pageContext.request.userPrincipal.name!=null}">
                                    
       			  <li><a href="userprofile" class="btn btn-success btn-sm">Welcome
       			  <sec:authorize access="isAuthenticated()">  
        		  <strong><sec:authentication property="principal.username"/></strong>
        		  </sec:authorize></a>
                    </li></c:if>
                    </ul>
            
            </div>
        </div>
     
    </div>

    <!-- *** TOP BAR END *** -->

    <!-- *** NAVBAR ***
 _________________________________________________________ -->

    <div class="navbar navbar-default yamm" role="navigation" id="navbar">
        <div class="container">
             <div class="navbar-header">

               
                <div class="navbar-buttons">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation">
                        <span class="sr-only">Toggle navigation</span>
                        <i class="fa fa-align-justify"></i>
                    </button>
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#search">
                        <span class="sr-only">Toggle search</span>
                        <i class="fa fa-search"></i>
                    </button>
                     <a class="btn btn-default navbar-toggle" href="#">
                        <i class="fa fa-shopping-cart"></i>  <span class="hidden-xs">My cart</span>
                    </a>
                </div>
            </div>
             <!--/.navbar-header -->

            <div class="navbar-collapse collapse" id="navigation">

                <ul class="nav navbar-nav navbar-left">
                    <li class="active"><a href="home">Home</a>
                    </li>
                    <!-- Start c:ForEach here -->
			<c:forEach items="${listCategories}" var="category">
                    
                    <li class="dropdown yamm-fw">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="200">${category.categoryName} <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                        					<c:forEach items="${category.subCategory}" var="subCategory">
                            <li>
                                <div class="yamm-content">
                                    <div class="row">
                                        <div class="col-sm-3">
                                         <h5><a href="allproducts?search=${subCategory.subCategoryName}">${subCategory.subCategoryName}</a></h5>
                                            <ul>
                                                
							<c:forEach items="${subCategory.product}" var="product">
							<li>
						
							<a href="viewproduct-${product.productId}-product">${product.productName}</a></li>
							
							</c:forEach><!-- End of third c:forEach -->
                            
                                            </ul>
                                        </div>
                                                       </div>
                                    </div>
                                    </li>
                                    </c:forEach><!-- End of second c:foreach  -->
                                    </ul>
                                    </li></c:forEach><!-- End of First c:foreach  -->
                                    <li><a href="aboutus">About Us</a></li>
        							<li><a href="contactus">Contact Us</a></li>
        		
                                    </ul>
                                     
                                </div>
                                <!-- /.yamm-content -->
                            
            <!--/.nav-collapse -->

            <div class="navbar-buttons">

                 <div class="navbar-collapse collapse right" id="basket-overview">
                    <a href="cartList" class="btn btn-primary navbar-btn"><i class="fa fa-shopping-cart"></i><span class="hidden-sm">My cart</span></a>
                </div> 
                <!--/.nav-collapse -->

                <div class="navbar-collapse collapse right" id="search-not-mobile">
                    <button type="button" id="button" class="btn navbar-btn btn-primary" data-toggle="collapse" data-target="#search">
                        <span class="sr-only">Toggle search</span>
                        <i class="fa fa-search"></i>
                    </button>
                </div>

            </div>

            <div class="collapse clearfix" id="search" >

                <form class="navbar-form" role="search" >
                    <div class="input-group">
                        <input type="text" id="searchItem" class="form-control" placeholder="Search" ng-model="searchkeyword" onkeypress="enterfunction(event)">
                      <span class="input-group-btn btn btn-primary"><a href="allproducts?search={{searchkeyword}}">  
								<i class="glyphicon glyphicon-search white "></i></a>

		    </span>
                    </div>
                </form>

            </div>
            <!--/.nav-collapse -->

        </div>
        <!-- /.container -->
        
    </div>
    <!-- /#navbar -->

    <!-- *** NAVBAR END *** -->
    <div class="scroll-top-wrapper ">
  <span class="scroll-top-inner">
    <i class="fa fa-2x fa-arrow-circle-up"></i>
  </span>
</div>
    
    <!-- ----------------------second navbar------------------------------------------------ -->
   
      
        <c:if test="${pageContext.request.userPrincipal.name!=null}">		  
       		<sec:authorize access="hasRole('ROLE_ADMIN')">  
     <div class="navbar navbar-default yamm" role="navigation" id="navbar">
        <div class="container">
            <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNewNavbar">
 <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <div class="collapse navbar-collapse" id="myNewNavbar">
     
      <ul class="nav navbar-nav">
       
        <li ><a href="categories">Categories</a></li>
        <li><a href="subCategories">SubCategories</a></li>
        
        <li><a href="products">Products</a></li>
      
        <li><a href="registration">Registration</a></li>
      </ul>
      
      </div>
    </div></div></div></sec:authorize></c:if>
    
                
    
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.devbridge-autocomplete/1.2.26/jquery.autocomplete.min.js"></script>   
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
    
    <script src="resources/js/bootstrap.min.js"></script>
 
    <script src="resources/js/jquery.cookie.js"></script>
    <script src="resources/js/waypoints.min.js"></script>
    <script src="resources/js/modernizr.js"></script>
    <script src="resources/js/bootstrap-hover-dropdown.js"></script>
    <script src="resources/js/owl.carousel.min.js"></script>
    <script src="resources/js/front.js"></script>
    <!-- <script src="resources/js/quantity.js"></script> -->
    <!-- <script src="resources/js/productsearch.js"></script> -->
    <script src="resources/js/scrolltotop.js"></script>
   <script src="resources/js/dirPagination.js"></script>
    
<script type="text/javascript">
function filterredirect()
{
	window.location.href = "allproducts?search="+document.getElementById('searchItem').value;
};

function enterfunction(e)
{
	  if(e.keyCode==13)
		  {
		      window.location.href = "allproducts?search="+document.getElementById('searchItem').value;
		  }
};

$(document).ready(function() {

	$('#searchItem').autocomplete({
		serviceUrl: '${pageContext.request.contextPath}/getTags',
		paramName: "subCategoryName",
		delimiter: ",",
	   transformResult: function(response) {

		return {
		  //must convert json to javascript object before process
		  suggestions: $.map($.parseJSON(response), function(item) {

		      return { value: item.subCategoryName, data: item.subCategoryId };
		   })

		 };

          }

		
	 });
	
});


</script>

