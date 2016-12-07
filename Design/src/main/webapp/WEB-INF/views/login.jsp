<%@include file="header.jsp" %>

    
    <div class="container">
    

	<c:if test="${not empty error}">
		<div class="error">
			 
		<h2>Invalid Username or Password!!!</h2>	
		</div>
	</c:if>
    
  <form method="post" action="perform_login" class="form-inline" role="form" accept-charset="UTF-8">
  
    <div class="row">
    	<div class="col-md-4 col-md-offset-4">
    	
    

    	 <%-- <h2><font color="red">${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</font></h2>  --%>
 <div class="panel panel-default">
			  	<div class="panel-heading">
			    	<h3 class="panel-title">Login</h3>
			 	</div>
			 	
			  	<div class="panel-body">
			  	

   <div class="form-group">
                                <label for="email">Username</label>
                                <input type="text" class="form-control" id="username" name="username">
                            </div><br><br>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" class="form-control" id="password" name="password">
                            </div><br><br>
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary"><i class="fa fa-sign-in"></i> Log in</button>
                            </div></div></div>
                            </div></div>
</form>
</div>


<%@include file="footer.jsp" %>