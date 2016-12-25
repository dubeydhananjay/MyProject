<%@include file="header.jsp" %>

<form:form method="POST"  modelAttribute="supplier"  commandName="supplier">
      <h2>Supplier Address</h2>         
   <div class="form-group">
    <label> Company Name:</label>
        <form:input path="supplierCompanyName" class="form-control" /></div>
        
        <div class="form-group">
    <label>Company URL:</label>
        <form:input path="supplierCompanyURL" class="form-control" /></div>
        
        <div class="form-group">
    <label> Company Address 1:</label>
        <form:input path="supplierCompanyAddress1" class="form-control" /></div>

 <div class="form-group">
    <label> Company Address 2:</label>
        <form:input path="supplierCompanyAddress2" class="form-control" /></div>

 <div class="form-group">
    <label>City:</label>
        <form:input path="supplierCity" class="form-control" /></div>

 <div class="form-group">
    <label>District:</label>
        <form:input path="supplierDistrict" class="form-control" /></div>
        
        <div class="form-group">
    <label>Pincode:</label>
        <form:input path="supplierPinCode" class="form-control" /></div>

 <div class="form-group">
    <label>State:</label>
        <form:input path="supplierState" class="form-control" /></div>
        <br>
        <input name="_eventId_submit" type="submit" value="Submit" /><br>
        <input name="_eventId_edit" type="submit" value="Edit" />	
        
        
        </form:form>
<%@include file="header.jsp" %>