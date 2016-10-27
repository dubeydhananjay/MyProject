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
<title>Confirm details</title>
</head>
<body>
<a href="home">Home</a><br><br>
<form:form method="post" modelAttribute="userDetail">
					<form:label path="username">UserName:</form:label>${userDetail.username}
					<br /><br />
					<form:label path="emailId">Email Id:</form:label>${userDetail.emailId}
					<br /><br />
					
					<form:label path="firstname">First Name :</form:label>${userDetail.firstname}
					<br /><br />
					<form:label path="lastname">Last Name :</form:label>${userDetail.lastname}
					<br /><br />
					<form:label path="contactNo">contact No :</form:label>${userDetail.contactNo}
					<br /><br />
					<form:label path="alternateContactNo">Alternate contact No :</form:label>${userDetail.alternateContactNo}
					<br /><br />
					<!-- for triggering webflow events using form submission,
					 the eventId to be triggered is given in "name" attribute as:
					-->
					<input name="_eventId_edit" type="submit" value="Edit" /> 
					<input name="_eventId_submit" type="submit" value="confirmdetails" /><br>
				</form:form>
		

</body>
</html>