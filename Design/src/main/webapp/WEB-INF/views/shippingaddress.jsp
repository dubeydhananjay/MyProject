<%@include file="header.jsp" %>

<form:form method="POST"  modelAttribute="shippingAddress" commandName="shippingAddress">
 <div class="row">
    	<div class="col-md-6 col-md-offset-2">
 <div class="panel panel-default">
			  	<div class="panel-heading">
			    	<h3 class="panel-title">Shipping Address (<sup> *</sup> denotes necessary fields)</h3>
			 	</div>
			  	<div class="panel-body">
              
   <div class="form-group">
    <label>Street Address 1<sup>*</sup>:</label>
        <form:input path="streetAddress1" class="form-control" />
        <br>
        	<span><c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('streetAddress1')}" var="err">
     <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
     <span><font color="red">${err.text}</font></span>
        </c:forEach></span>
        </div>
        
        <div class="form-group">
    <label>Street Address 2:</label>
        <form:input path="streetAddress2" class="form-control" />
        <br>
        	<span><c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('streetAddress2')}" var="err">
     <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
     <span><font color="red">${err.text}</font></span>
        </c:forEach></span>
        </div>
        
        <div class="form-group">
    <label>Landmark<sup>*</sup>:</label>
        <form:input path="landmark" class="form-control" />
        <br>
        	<span><c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('landmark')}" var="err">
     <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
     <span><font color="red">${err.text}</font></span>
        </c:forEach></span>
        </div>

 <div class="form-group">
    <label>City<sup>*</sup>:</label>
        <form:input path="city" class="form-control" />
        <br>
        	<span><c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('city')}" var="err">
     <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
     <span><font color="red">${err.text}</font></span>
        </c:forEach></span>
        </div>

 <div class="form-group">
    <label>District<sup>*</sup>:</label>
        <form:input path="district" class="form-control" />
        <br>
        	<span><c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('streetAddress1')}" var="err">
     <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
     <span><font color="red">${err.text}</font></span>
        </c:forEach></span>
        </div>

 <div class="form-group">
    <label>Pincode<sup>*</sup>:</label>
        <form:input path="pinCode" class="form-control" />
        <br>
        	<span><c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('district')}" var="err">
     <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
     <span><font color="red">${err.text}</font></span>
        </c:forEach></span>
        </div>

 <div class="form-group">
    <label>State<sup>*</sup>:</label>
        <form:input path="state" class="form-control" />
        <br>
        	<span><c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('state')}" var="err">
     <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
     <span><font color="red">${err.text}</font></span>
        </c:forEach></span>
        </div>
        	
        <br>
        <button type="submit" name="_eventId_submit" class="btn btn-default">Submit</button>
           <button type="submit" name="_eventId_cancel" class="btn btn-default">Cancel</button>	
        </div>
        </div>
        </div>
        </div>
        </form:form>
<%@include file="footer.jsp" %>