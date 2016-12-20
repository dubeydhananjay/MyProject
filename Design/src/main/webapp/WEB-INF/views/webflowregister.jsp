<%@include file="header.jsp" %>
<div class="container">
    
  
<form:form method="POST"  commandName="userDetail" >
      <div class="row">
    	<div class="col-md-6 col-md-offset-2">
 <div class="panel panel-default">
			  	<div class="panel-heading">
			    	<h3 class="panel-title">Registration (<sup> *</sup> denotes necessary fields)</h3>
			 	</div>
			  	<div class="panel-body">
  <div class="form-group">
    <label> Username<sup>*</sup>:</label>
        <form:input path="username" class="form-control" />
         <br>
        	<c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('username')}" var="err">
        	<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
        <span><font color="red">${err.text}</font></span>
        </c:forEach>
        </div>
    
   <div class="form-group">
        <label>First Name:<sup>*</sup></label>
        
        <form:input path="firstname" class="form-control"/><br>
        <c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('firstname')}" var="err">
        <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
     <span><font color="red">${err.text}</font></span>
        </c:forEach></div>
        
 <div class="form-group">
        <label>Last Name:<sup>*</sup></label>
        
        <form:input path="lastname" class="form-control" /><br>
        <c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('lastname')}" var="err">
        <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
     <span><font color="red">${err.text}</font></span>
        </c:forEach></div>
       
    <div class="form-group"> 
        <label>Password:<sup>*</sup></label>
        
       <form:input path="password" type="password" class="form-control" /><br>
        <c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('password')}" var="err">
        <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
     <span><font color="red">${err.text}</font></span>
        </c:forEach></div>
        
     <div class="form-group">   
        <label>Contact No.:<sup>*</sup></label>
        
        <form:input path="contactNo" class="form-control"/><br>
        <c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('contactNo')}" var="err">
        <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
     <span><font color="red">${err.text}</font></span>
        </c:forEach></div>
        
        
       <div class="form-group">
        <label>Alternate Contact No.:</label>
        
        <form:input path="alternateContactNo" class="form-control input-md"/>
        </div>
        
<div class="form-group">
        <label>Email Id:<sup>*</sup></label>
        
        <form:input path="emailId" class="form-control input-md"/><br>
        <c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('emailId')}" var="err">
        <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
     <span><font color="red">${err.text}</font></span>
        </c:forEach></div>
     <br><br>
           <button type="submit" name="_eventId_submit" class="btn btn-default">Submit</button>
           <button type="submit" name="_eventId_cancel" class="btn btn-default">Cancel</button>
      </div></div>  
     </div></div>
</form:form></div><br><br>
<%@include file="footer.jsp" %>
