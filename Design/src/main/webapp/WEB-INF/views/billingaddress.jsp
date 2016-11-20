<%@include file="header.jsp" %>

<form:form method="POST"  class="form-inline" modelAttribute="billingAddress"  commandName="billingAddress">
      <h2>Billing Address</h2>         
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
        <input name="_eventId_submit" type="submit" value="Submit" /><br>
        <input name="_eventId_edit" type="submit" value="Edit" />	
        
        
        </form:form>
<%@include file="footer.jsp" %>