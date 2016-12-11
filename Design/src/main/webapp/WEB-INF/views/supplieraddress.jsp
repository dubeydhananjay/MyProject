<%@include file="header.jsp" %>

<form:form method="POST"  modelAttribute="supplier"  commandName="supplier">
 <div class="row">
    	<div class="col-md-6 col-md-offset-2">
 <div class="panel panel-default">
			  	<div class="panel-heading">
			    	<h3 class="panel-title">Supplier Address (<sup> *</sup> denotes necessary fields)</h3>
			 	</div>
			  	<div class="panel-body">
               
   <div class="form-group">
    <label> Company Name<sup>*</sup>:</label>
        <form:input path="supplierCompanyName" class="form-control" />
         <br>
        	<c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('supplierCompanyName')}" var="err">
        	<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
        <span><font color="red">${err.text}</font></span>
        </c:forEach>
        </div>
        
        <div class="form-group">
    <label>Company URL:</label>
        <form:input path="supplierCompanyURL" class="form-control" /></div>
        
        <div class="form-group">
    <label> Company Address 1<sup>*</sup>:</label>
        <form:input path="supplierCompanyAddress1" class="form-control" />
         <br>
        	<c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('supplierCompanyAddress1')}" var="err">
        	<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
        <span><font color="red">${err.text}</font></span>
        </c:forEach>
        </div>

 <div class="form-group">
    <label> Company Address 2:</label>
        <form:input path="supplierCompanyAddress2" class="form-control" />
         <br>
        	<c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('supplierCompanyAddress2')}" var="err">
        	<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
        <span><font color="red">${err.text}</font></span>
        </c:forEach>
        </div>

 <div class="form-group">
    <label>City<sup>*</sup>:</label>
        <form:input path="supplierCity" class="form-control" />
        <br>
        	<c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('supplierCity')}" var="err">
        	<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
        <span><font color="red">${err.text}</font></span>
        </c:forEach>
        </div>

 <div class="form-group">
    <label>District<sup>*</sup>:</label>
        <form:input path="supplierDistrict" class="form-control" />
         <br>
        	<c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('supplierDistrict')}" var="err">
        	<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
        <span><font color="red">${err.text}</font></span>
        </c:forEach>
        </div>
        
        <div class="form-group">
    <label>Pincode<sup>*</sup>:</label>
        <form:input path="supplierPinCode" class="form-control" />
         <br>
        	<c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('supplierPinCode')}" var="err">
        	<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
        <span><font color="red">${err.text}</font></span>
        </c:forEach>
        </div>

 <div class="form-group">
    <label>State:</label>
        <form:input path="supplierState" class="form-control" />
         <br>
        	<c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('supplierState')}" var="err">
        	<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
        <span><font color="red">${err.text}</font></span>
        </c:forEach>
        </div>
        <br>
           <button type="submit" name="_eventId_submit" class="btn btn-default">Confirm</button>
           <button type="submit" name="_eventId_edit" class="btn btn-default">Edit</button>
		   <button type="submit" name="_eventId_cancel" class="btn btn-default">Cancel</button><br>
        </div>
        </div></div>
        </div>
        </form:form>
<%@include file="footer.jsp" %>