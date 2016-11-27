<%@include file="header.jsp" %>

  <div class="container">
	<div class="row">
		
        
        
       <div class="col-md-7 ">

<div class="panel panel-default">
  <div class="panel-heading">  <h4 >User Profile</h4></div>
   <div class="panel-body">
       
    <div class="box box-info">
        
            <div class="box-body">
                     <div class="col-sm-6">
                     <div  align="center">
                     <div  align="center"> <img alt="User Pic" src="https://x1.xingassets.com/assets/frontend_minified/img/users/nobody_m.original.jpg" id="profile-image1" class="img-circle img-responsive"> 
                
                <input id="profile-image-upload" class="hidden" type="file">
<div style="color:#999;" >click here to change profile image</div>
                <!--Upload Image Js And Css-->
  </div>
               <br>
    
              <!-- /input-group -->
            </div>
            <div class="col-sm-6">
           <h4 style="color:#00b1b1;"><span>{{listUsers.firstname}} {{listUsers.lastname}}</span></h4>
              <span><p>Buyer</p></span>            
            </div>
            <div class="clearfix"></div>
            <hr style="margin:5px 0 5px 0;">
    
              
<div class="col-sm-5 col-xs-6 tital " >First Name:</div><div class="col-sm-7 col-xs-6 ">{{listUsers.firstname}}</div>
     <div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital " >Last Name:</div><div class="col-sm-7"> {{listUsers.lastname}}</div>
  <div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital " >Contact Number:</div><div class="col-sm-7">{{listUsers.contactNo}}</div>

  <div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital " >Alternate Contact Number:</div><div class="col-sm-7">{{listUsers.alternateContactNo}}</div>

  <div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital " >Email Id:</div><div class="col-sm-7">{{listUsers.emailId}}</div>

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
              $(function() {
    $('#profile-image1').on('click', function() {
        $('#profile-image-upload').click();
    });
});       
              </script>  
               
<script type="text/javascript">
				  angular.module('myNewApp',[]).controller('myNewController',function($scope)
						  {
					  $scope.listUsers=${listUser};
						  });
				  </script></div>
  <%@include file="footer.jsp" %>



         