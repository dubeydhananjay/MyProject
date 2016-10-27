<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Supplier Address</title>
</head>
<body>
<form:form method="POST"  modelAttribute="supplierAddress"  commandName="supplierAddress">
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
</body>
</html>