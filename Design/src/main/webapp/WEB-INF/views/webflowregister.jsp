<%@include file="header.jsp" %>
<div class="container">
    
  
<form:form method="POST" class="form-inline" commandName="userDetail" >
      <div class="row">
    	<div class="col-md-4 col-md-offset-4">
 <div class="panel panel-default">
			  	<div class="panel-heading">
			    	<h3 class="panel-title">Registration</h3>
			 	</div>
			  	<div class="panel-body">
   <div class="form-group">
    <label class="col-md-4 control-label">User Name</label>
    <div class="col-md-8">
        <form:input path="username" class="form-control input-md" />
        <!--  to display validation message -->
        
        	<span><c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('username')}" var="err">
     <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
     <span><font color="red">${err.text}</font></span>
        </c:forEach></span></div></div><br><br>
    
   <div class="form-group">
        <label class="col-md-4 control-label">First Name</label>
        <div class="col-md-8">
        <form:input path="firstname" class="form-control input-md"/>
        <c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('firstname')}" var="err">
        <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
     <span><font color="red">${err.text}</font></span>
        </c:forEach></div></div><br><br>
        
 <div class="form-group">
        <label class="col-md-4 control-label">Last Name</label>
        <div class="col-md-8">
        <form:input path="lastname" class="form-control input-md" />
        <c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('lastname')}" var="err">
        <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
     <span><font color="red">${err.text}</font></span>
        </c:forEach></div></div><br><br>
       
    <div class="form-group"> 
        <label class="col-md-4 control-label">Password</label>
        <div class="col-md-8">
       <form:input path="password" type="password" class="form-control input-md" />
        <c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('password')}" var="err">
        <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
     <span><font color="red">${err.text}</font></span>
        </c:forEach></div></div><br><br>
        
     <div class="form-group">   
        <label class="col-md-4 control-label">Contact No.</label>
        <div class="col-md-8">
        <form:input path="contactNo" class="form-control input-md"/>
        <c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('contactNo')}" var="err">
        <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
     <span><font color="red">${err.text}</font></span>
        </c:forEach></div></div><br><br>
        
        
       <div class="form-group">
        <label class="col-md-4 control-label">Alternate Contact No.</label>
        <div class="col-md-8">
        <form:input path="alternateContactNo" class="form-control input-md"/>
        </div></div><br><br>
        
<div class="form-group">
        <label class="col-md-4 control-label">Email Id</label>
        <div class="col-md-8">
        <form:input path="emailId" class="form-control input-md"/>
        <c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('emailId')}" var="err">
        <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
     <span><font color="red">${err.text}</font></span>
        </c:forEach></div></div>
     <br><br>
           <input name="_eventId_submit" type="submit" value="Submit" />
           <input name="_eventId_cancel" type="submit" value="Cancel" />
      </div></div>  
     </div></div>
</form:form></div><br><br>
<%@include file="footer.jsp" %>
