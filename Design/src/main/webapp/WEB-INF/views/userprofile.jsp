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

<div class="panel panel-default">
  <div class="panel-heading">  <h4 >User Profile</h4></div>
   <div class="panel-body">
       
    <div class="box box-info">
        
            <div class="box-body">
                     <div class="col-sm-6">
                     <div  align="center">
                     <form:form action="userprofile" modelAttribute="userDetail" method="POST" enctype="multipart/form-data">
                    
                    
                     <div  align="center"> <img alt="User Pic" src="resources/image/{{listUsers.username}}.jpg" id="profile-image1" class="img-circle img-responsive"> 
                
                <form:input id="profile-image-upload"  type="file" name="file" path="uploadFiles"/>
 <div style="color:#999;" >click here to change profile image</div> 
                <!--Upload Image Js And Css-->
                <span class="pull-left"><button type="submit" class="btn btn-default">Submit</button></span>
  </div>
  </form:form>
               <br>
    
              <!-- /input-group -->
            </div>
            <div class="col-sm-6">
           <h4 style="color:#00b1b1;"><span>{{listUsers.firstname}} {{listUsers.lastname}}</span></h4>
              <span><p>Buyer</p></span>            
            </div>
            <div class="clearfix"></div>
            <hr style="margin:5px 0 5px 0;">
    
              
<div class="col-sm-6 col-xs-6 tital " >First Name:</div><div class="col-sm-6 col-xs-6 ">{{listUsers.firstname}}</div>
     <div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-6 col-xs-6 tital " >Last Name:</div><div class="col-sm-6"> {{listUsers.lastname}}</div>
  <div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-6 col-xs-6 tital " >Contact Number:</div><div class="col-sm-6">{{listUsers.contactNo}}</div>

  <div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-6 col-xs-6 tital " >Alternate Contact Number:</div><div class="col-sm-6">{{listUsers.alternateContactNo}}</div>

  <div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-6 col-xs-6 tital " >Email Id:</div><div class="col-sm-6">{{listUsers.emailId}}</div>

 <div class="clearfix"></div>
<div class="bot-border"></div>



            <!-- /.box-body -->
          </div>
          <!-- /.box -->

        </div>
       
            
    </div> 
    </div>
</div> 

 </div>
</div>

<script>
             /*  $(function() {
    $('#profile-image1').on('click', function() {
        $('#profile-image-upload').click();
    });
});        */
             
 
 /* function readURL(input) {
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();

	        reader.onload = function (e) {
	            document.getElementById('profile-image-upload').src =  e.target.result;
	        }

	        reader.readAsDataURL(input.files[0]);
	    }
	} */
  </script>              
 <script type="text/javascript">
				  angular.module('myNewApp',[]).controller('myNewController',function($scope)
						  {
					  $scope.listUsers=${listUser};
						  });
				  </script></div>
  <%@include file="footer.jsp" %>



         