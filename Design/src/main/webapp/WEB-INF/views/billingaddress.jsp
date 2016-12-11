<%@include file="header.jsp" %>

<form:form method="POST"  modelAttribute="billingAddress"  commandName="billingAddress">
 <div class="row">
    	<div class="col-md-6 col-md-offset-2">
 <div class="panel panel-default">
			  	<div class="panel-heading">
			    	<h3 class="panel-title">Billing Address(Optional)</h3>
			 	</div>
			  	<div class="panel-body">
              
   <div class="form-group">
    <label>Street Address 1:</label>
        <form:input path="streetAddress1" class="form-control" />
        <br><br>
        
    <label>Street Address 2:</label>
        <form:input path="streetAddress2" class="form-control" />
        <br><br>
        
    <label>Landmark:</label>
        <form:input path="landmark" class="form-control" />
<br><br>
 
    <label>City:</label>
        <form:input path="city" class="form-control" />
<br><br>
 
    <label>District:</label>
        <form:input path="district" class="form-control" />
<br><br>
 
    <label>Pincode:</label>
        <form:input path="pinCode" class="form-control" />
<br><br>
 
    <label>State:</label>
        <form:input path="state" class="form-control" /></div>
        <br>
        <input name="_eventId_submit" type="submit" value="Submit" />
        <input name="_eventId_cancel" type="submit" value="cancel" />	
        </div>
        </div>
        </div>
        </div>
        </form:form>
<%@include file="footer.jsp" %>