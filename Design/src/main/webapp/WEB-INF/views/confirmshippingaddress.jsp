<%@include file="header.jsp" %><br>
<div class="container">
    
  
<form:form method="POST" class="form-inline" commandName="shippingAddress" >
      <div class="row">
    	<div class="col-md-8 col-md-offset-2">
 <div class="panel panel-default">
			  	<div class="panel-heading">
			    	<h3 class="panel-title">Confirm Shipping Address</h3>
			 	</div>
			  	<div class="panel-body">
   <div class="col-md-4">
					Street Address1:</div><div class="col-md-8">${shippingAddress.streetAddress1}</div>
					<br /><br />
					<div class="col-md-4">
					Street Address2:</div><div class="col-md-8">${shippingAddress.streetAddress2}</div>
					<br /><br />
					<div class="col-md-4">
					Landmark:</div><div class="col-md-8">${shippingAddress.landmark}</div>
					<br /><br />
					<div class="col-md-4">
					City:</div><div class="col-md-8">${shippingAddress.city}</div>
					<br /><br />
					<div class="col-md-4">
					District:</div><div class="col-md-8">${shippingAddress.district}</div>
					<br /><br />
					<div class="col-md-4">
					PinCode:</div><div class="col-md-8">${shippingAddress.pinCode}</div>
					<br /><br />
					<div class="col-md-4">
					State:</div><div class="col-md-8">${shippingAddress.state}</div>
					<br /><br />
		   <button type="submit" name="_eventId_submit" class="btn btn-default">Confirm</button>
           <button type="submit" name="_eventId_edit" class="btn btn-default">Edit</button>
		   <button type="submit" name="_eventId_cancel" class="btn btn-default">Cancel</button><br>
					</div>
					</div>
					</div>
					</div>
					</form:form>
					</div>
					
<%@include file="footer.jsp" %>