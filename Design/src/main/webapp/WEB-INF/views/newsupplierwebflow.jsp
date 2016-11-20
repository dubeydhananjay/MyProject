<%@include file="header.jsp" %><br>
  
<form:form method="POST"  commandName="userDetail" class="form-inline">
               
   <div class="form-group">
    <label>User Name</label>
        <form:input path="username" class="form-control" />
        <!--  to display validation message -->
        	<c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('username')}" var="err">
        <div><span>${err.text}</span></div>
        </c:forEach></div>
    
   <div class="form-group">
        <label>First Name</label>
        <form:input path="firstname" class="form-control"/>
        <c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('firstname')}" var="err">
        <div><span>${err.text}</span></div>
        </c:forEach></div>
        
 <div class="form-group">
        <label>Last Name</label>
        <form:input path="lastname" class="form-control" />
        <c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('lastname')}" var="err">
        <div><span>${err.text}</span></div>
        </c:forEach></div>
       
     <div class="form-group">
        <label>Password</label>
       <form:input path="password" type="password" class="form-control" />
        <c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('password')}" var="err">
        <div><span>${err.text}</span></div>
        </c:forEach></div>
        
        <div class="form-group">
        <label>Contact No.</label>
        <form:input path="contactNo" class="form-control"/>
        <c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('contactNo')}" var="err">
        <div><span>${err.text}</span></div>
        </c:forEach></div>
        
        
       <div class="form-group">
        <label>Alternate Contact No.</label>
        <form:input path="alternateContactNo" class="form-control"/>
        <c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('alternateContactNo')}" var="err">
        <div><span>${err.text}</span></div>
        </c:forEach></div>
        
<div class="form-group">
        <label>Email Id</label>
        <form:input path="emailId" class="form-control"/>
        <c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('emailId')}" var="err">
        <div><span>${err.text}</span></div>
        </c:forEach></div>
     <br>
           <input name="_eventId_submit" type="submit" value="Submit" />
        
     
</form:form><br><br>
<%@include file="footer.jsp" %>