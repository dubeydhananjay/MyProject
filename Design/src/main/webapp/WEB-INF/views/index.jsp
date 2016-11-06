<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %>
 
<html>
<head>
<title>Simple Web Design</title>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="resources/css/bootstrap.min.css">
  <link rel="stylesheet" href="resources/css/megamenu.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="resources/js/bootstrap.min.js"></script>
  <script src="resources/js/megamenu.js"></script>
  <style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 100%;
      margin: auto; height:500px;
  }
  h2 {
    color: white;
    text-shadow: 1px 1px 2px black, 0 0 25px blue, 0 0 5px darkblue;
}
#div2 {
    width: 100px;
    height: 100px;
    background: red;
    -webkit-transition: width 2s, height 4s; /* For Safari 3.1 to 6.0 */
    transition: width 2s, height 4s;
}

#div2:hover {
    width: 300px;
    height: 300px;
}
#div1  {
    width: 100px;
    height: 100px;
    background: red;
    -webkit-transition: width 2s, height 2s, -webkit-transform 2s; 
    transition: width 2s, height 2s, transform 2s;
}

#div1:hover {
    width: 300px;
    height: 300px;
    -webkit-transform: rotate(360deg); 
    transform: rotate(360deg);
}
input[type=text] {
    width: 130px;
    box-sizing: border-box;
    border: 2px solid #ccc;
    border-radius: 4px;
    font-size: 16px;
    background-color: white;
    background-image: url('image/search.png');
    background-position: 10px 10px;
    padding-bottom: 08px;
    background-repeat: no-repeat;
    -webkit-transition: width 0.4s ease-in-out;
    transition: width 0.4s ease-in-out;
}

input[type=text]:focus {
    width: 70%;
}

  
  </style></head>
    <body>
    <div class="container-fluid">
    <div class="col-sm-9">
  <h2>Welcome to web Design Demo</h2></div>
  <div class="col-sm-3"><form><br>
  <button class="btn btn-default" type="button">
            <span class="glyphicon glyphicon-search"></span>
          </button><input type="text" name="search" placeholder="Search..">
        
</form></div></div>

  <nav class="navbar navbar-inverse">
    <div class="navbar-header">
    	<button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".js-navbar-collapse">
			<span class="sr-only">Toggle navigation</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="#">My Store</a>
	</div>
	
	<div class="collapse navbar-collapse js-navbar-collapse">
		<ul class="nav navbar-nav">
			<!-- Start c:ForEach here -->
			<c:forEach items="${categoriesList}" var="category">
            <li class="dropdown mega-dropdown">
    			<a href="#" class="dropdown-toggle" data-toggle="dropdown">${category.categoryName}<span class="caret"></span></a>				
				
				<ul class="dropdown-menu mega-dropdown-menu">
					<c:forEach items="${category.subCategory}" var="subCategory">
					<li class="col-sm-3">
    					<ul>
							<li class="dropdown-header">${subCategory.subCategoryName}</li>
							<c:forEach items="${subCategory.product}" var="product">
							<li><a href="#">${product.productName}</a></li>
							
							</c:forEach><!-- End of third c:forEach -->
                            <li class="divider"></li>
						</ul>
						
					</li>
					</c:forEach><!-- End of second c:forEach -->
			
                  </ul></li></c:forEach><!-- End of first c:forEach -->
                 
                  <c:if test="${pageContext.request.userPrincipal.name!=null}">
       			  <li><a href="#">Welcome
       			  <sec:authorize access="isAuthenticated()">  
        		  <strong><sec:authentication property="principal.username"/></strong>
        		  </sec:authorize></a>
       			  </li>
       			  </c:if>
                
       			 <c:if test="${pageContext.request.userPrincipal.name==null}">
       			 <li><a href="login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
        		 </c:if>
                  
        		 <c:if test="${pageContext.request.userPrincipal.name!=null}">
        		<sec:authorize access="isAuthenticated()"> 
        		<li><a href="perform_logout">Logout</a></li>
        		</sec:authorize></c:if>
        		<li><a href="registration"><span class="glyphicon glyphicon-user"></span>Sign Up</a>
                 </ul>
                  
	</div><!-- /.nav-collapse -->
  </nav>


<!-- ----------------------------Second Navbar--------------------------------------------------------- -->
<nav class="navbar navbar-inverse">
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
    </div>
  </nav>
  <%-- ----------------------------------CAROUSEL------------------------------------- --%>
  
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
  <div class="container text-center">
  <h3>some text</h3><br>
  <div class="row">
  
    <div class="col-sm-4">
      <img id="div1" src="resources/image/essential-oil-diffuser1.jpg" class="img-responsive" style="width:100%" alt="Eminem">
      <p>Current Project</p>
    </div>
    
    <div class="col-sm-4" >
      <img id="div2" src="resources/image/essentialoils.jpg" class="img-responsive" style="width:100%" alt="tile">
      <p>Project</p>
    </div>
    <div class="col-sm-4">
      <div class="well">
       <p>Some text..</p>
      </div>
      <div class="well">
       <p>Some text..</p>
      </div>
    </div>
  </div>
</div><br>

  <div class="container text-center">
  <h3>NEW Text</h3>
  <br>
  <div class="row">
    <div class="col-sm-2">
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100% height:500px" alt="Image">
      <p>Text 1</p>
    </div>
    <div class="col-sm-2">
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100% height:500px" alt="Image">
      <p>Text 2</p>
    </div>
    <div class="col-sm-2">
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100% height:500px" alt="Image">
      <p>Text 3</p>
    </div>
    <div class="col-sm-2">
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100% height:500px" alt="Image">
      <p>Text 4</p>
    </div>
    <div class="col-sm-2">
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100% height:500px" alt="Image">
      <p>Text 5</p>
    </div>
    <div class="col-sm-2">
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100% height:500px" alt="Image">
      <p>Text 6</p>
    </div>
  </div>
</div><br>

<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>

  <!-- padding: 10px 20px 12px 40px; padding-right: 30px;
    padding-bottom: 12px;-->

</body>
</html>


