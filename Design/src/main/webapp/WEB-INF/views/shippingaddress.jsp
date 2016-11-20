<%@include file="header.jsp" %>

<form:form method="POST"  modelAttribute="shippingAddress" commandName="shippingAddress">
        <h2>Shipping Address</h2>       
   <div class="form-group">
    <label>Street Address 1:</label>
        <form:input path="streetAddress1" class="form-control" /></div>
        
        <div class="form-group">
    <label>Street Address 2:</label>
        <form:input path="streetAddress2" class="form-control" /></div>
        
        <div class="form-group">
    <label>Landmark:</label>
        <form:input path="landmark" class="form-control" /></div>

 <div class="form-group">
    <label>City:</label>
        <form:input path="city" class="form-control" /></div>

 <div class="form-group">
    <label>District:</label>
        <form:input path="district" class="form-control" /></div>

 <div class="form-group">
    <label>Pincode:</label>
        <form:input path="pinCode" class="form-control" /></div>

 <div class="form-group">
    <label>State:</label>
        <form:input path="state" class="form-control" /></div>
        	
        <br>
        <input name="_eventId_submit" type="submit" value="Submit" /><br>
        <input name="_eventId_edit" type="submit" value="Edit" />
        <input name="_eventId_cancel" type="submit" value="Cancel" />	
        
        
        </form:form>
<%@include file="footer.jsp" %>