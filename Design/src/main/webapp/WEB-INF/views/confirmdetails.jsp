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
<a href="${flowExecutionUrl}&_eventId_home">Home</a><br><br>
<form:form modelAttribute="userBean">
					<form:label path="userId">UserName:</form:label>${userDetail.userId}
					<br /><br />
					<form:label path="email">Email Id:</form:label>${userDetail.email}
					<br /><br />
					<form:label path="age">Age :</form:label>${userDetail.age}
					<br /><br />
					<!-- for triggering webflow events using form submission,
					 the eventId to be triggered is given in "name" attribute as:
					-->
					<input name="_eventId_edit" type="submit" value="Edit" /> 
					<input name="_eventId_submit" type="submit" value="confirmdetails" /><br>
				</form:form>
		

</body>
</html>