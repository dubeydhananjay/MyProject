<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2>Category Information</h2>
<form:form method="POST" action="add/categories" commandName="categories" modelAttribute="categories">
   <table>
    <tr>
        <td><form:label path="categoryName">CategoryName</form:label></td>
        <td><form:input path="categoryName" /></td>
    </tr>
    <tr>
        <td><form:label path="categoryDescription">Description</form:label></td>
        <td><form:input path="categoryDescription" /></td>
    </tr>
    
    <tr>
        <td colspan="2">
            <input type="submit" value="Submit"/>
        </td>
    </tr>
</table>  
</form:form>
</body>
</html>