<%@include file="header.jsp" %><br>
<div class="container">
    
  
<form:form method="POST" class="form-inline" commandName="userDetail" >
      <div class="row">
    	<div class="col-md-8 col-md-offset-2">
 <div class="panel panel-default">
			  	<div class="panel-heading">
			    	<h3 class="panel-title">Confirm Details</h3>
			 	</div>
			  	<div class="panel-body">
   <div class="col-md-4">
					UserName:</div><div class="col-md-8">${userDetail.username}</div>
					<br /><br />
					<div class="col-md-4">
					Email Id:</div><div class="col-md-8">${userDetail.emailId}</div>
					<br /><br />
					<div class="col-md-4">
					First Name :</div><div class="col-md-8">${userDetail.firstname}</div>
					<br /><br />
					<div class="col-md-4">Last Name :</div><div class="col-md-8">${userDetail.lastname}</div>
					<br /><br />
					<div class="col-md-4">contact No :</div><div class="col-md-8">${userDetail.contactNo}</div>
					<br /><br />
					<div class="col-md-4">Alternate contact No :</div><div class="col-md-8">${userDetail.alternateContactNo}</div>
					<br /><br />
					
					<input name="_eventId_edit" type="submit" value="Edit" /> 
					<input name="_eventId_submit" type="submit" value="confirmdetails" /><br>
					</div>
					</div>
					</div>
					</div>
				</form:form>
		</div>

<%@include file="footer.jsp" %>