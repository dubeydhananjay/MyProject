<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
<html>
<head>
<title>Simple Web Design</title>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="resources/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="resources/js/bootstrap.min.js"></script>
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
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
          <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Simple WEB DESIGN</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Home</a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="/Design/categories">Categories <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Essential Oils</a></li>
            <li><a href="#">Organic Soaps</a></li>
            <li><a href="#">Diffuser</a></li>
          </ul>
        </li>
        <li><a href="#">About Us</a></li>
        <li><a href="#">Contact Us</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-user"></span><button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#mySignUpModal"> Sign Up</button></a></li>
        <li><a href="#"><span class="glyphicon glyphicon-log-in"></span><button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myLoginModal"> Login</button></a></li>
      </ul>
    </div>
    </div>
  </nav>
<nav class="navbar navbar-inverse">
<div class="navbar-header">
<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNewNavbar">
 <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <div class="collapse navbar-collapse" id="myNewNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="/Design/categories">Categories</a></li>
        <li><a href="/Design/subCategories">SubCategories</a></li>
        <li><a href="/Design/suppliers">Suppliers</a></li>
        <li><a href="/Design/products">Products</a></li>
        <li><a href="/Design/registration">Registration</a></li>
      </ul>
      </div>
    </div>
  </nav>
<!-- --------------------------------------Modal------------------------------------- -->
<!-- ------------------------------------Sign up---------------------------------------- -->
<div class="container">
  <div class="modal fade" id="mySignUpModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Sign up</h4>
        </div>
        <div class="modal-body">
          <h2>Sign up</h2>
  <form>
  <div class="form-group">
      <label for="usr">Name:</label>
      <input type="text" class="form-control" id="usr" placeholder="Enter Name">
    </div>
    <div class="form-group">
      <label for="email">Email:</label>
      <input type="email" class="form-control" id="email" placeholder="Enter email">
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd" placeholder="Enter password">
    </div>
    
    <button type="submit" class="btn btn-default">Submit</button>
  </form>
</div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      </div> </div> 
      <!-- ------------------Login Modal--------------------------------------------- -->
<div class="modal fade" id="myLoginModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Sign In</h4>
        </div>
        <div class="modal-body">
          <h2>Login</h2>
  <form>
    <div class="form-group">
      <label for="email">Email:</label>
      <input type="email" class="form-control" id="email" placeholder="Enter email">
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd" placeholder="Enter password">
    </div>
    <div class="checkbox">
      <label><input type="checkbox"> Remember me</label>
    </div>
    <button type="submit" class="btn btn-default">Submit</button>
  </form>
</div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div></div>

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
        <img class="img-responsive" src="image/Beach.jpg"  alt="Beach" >
      </div>

      <div class="item">
        <img class="img-responsive" src="image/Elephant.jpg" alt="Elephant">
      </div>
    
      <div class="item">
        <img class="img-responsive" src="image/mountain.jpg" alt="mountain">
      </div>

      <div class="item">
        <img class="img-responsive" src="image/river_mountain.jpg">
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
      <img id="div1" src="image/Eminem.jpg" class="img-responsive" style="width:100%" alt="Eminem">
      <p>Current Project</p>
    </div>
    
    <div class="col-sm-4" >
      <img id="div2" src="image/tile.jpg" class="img-responsive" style="width:100%" alt="tile">
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


