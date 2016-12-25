<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>
</head>
<body>
<form:form method="POST" action="newsupplier" commandName="newsupplier" modelAttribute="newsupplier" >
               
   <table>
   <tr>
        <td><label>User Name</label></td>
        <td><form:input path="username" /></td>
        
    </tr>
    <tr>
        <td><label>First Name</label></td>
        <td><form:input path="firstname" /></td>
        
    </tr>
   <tr>
        <td><label>Last Name</label></td>
        <td><form:input path="lastname" /></td>
        
    </tr>
     <tr>
        <td><label>Password</label></td>
        <td><form:input path="password" /></td>
        
    </tr>
     <tr>
        <td><label>Contact No.</label></td>
        <td><form:input path="contactNo" /></td>
        
    </tr>
     <tr>
        <td><label>Alternate Contact No.</label></td>
        <td><form:input path="alternateContactNo" /></td>
        
    </tr>
     <tr>
        <td><label>Email Id</label></td>
        <td><form:input path="emailId" /></td>
        
    </tr>
     
     <tr>
        <td><label>Shipping AdressId</label></td>
        <td><form:input path="shippingAddress.streetAddress1" /></td>
        
    </tr>
    <tr>
        <td><label>Billing AdressId</label></td>
        <td><form:input path="billingAddress.streetAddress1" /></td>
        
    </tr>
     
    <tr>
        <td colspan="2">
            <input type="submit" value="Submit"/>
        </td>
    </tr>
</table>  
</form:form><br><br>
</body>
</html>